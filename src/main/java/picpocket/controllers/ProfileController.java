package picpocket.controllers;

import java.io.IOException;
import java.io.UnsupportedEncodingException;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import picpocket.DAO.PhotoDAO;
import picpocket.DAO.UserDAO;
import picpocket.DAO.UserMapper;
import picpocket.DAO.WalletDAO;
import picpocket.DTO.UserRequestDTO;
import picpocket.DTO.UserResponseDTO;
import picpocket.models.UserBean;


@Controller
@RequestMapping("/users")
public class ProfileController {

	@Autowired
	UserDAO userDAO;
	@Autowired
	WalletDAO walletDAO;
	@Autowired
	PhotoDAO photoDAO;
	@Autowired
	UserMapper userMapper;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView showUserProfile(HttpSession session,ModelMap model) throws UnsupportedEncodingException {
		Integer userID = (Integer) session.getAttribute("id");

		if (userID == null) {

			return new ModelAndView("redirect:/userlogin");
		} else {
			
			model.addAttribute("sellposts", photoDAO.postByCreator(userID));
			model.addAttribute("buyposts", photoDAO.postByOwner(userID));
			model.addAttribute("photos", userDAO.profilePhoto(userID));
			
			UserRequestDTO dto = new UserRequestDTO();
			dto.setId(userID);

			UserResponseDTO res = userDAO.selectOne(dto);
			
			UserBean user = userMapper.mapDTOToUser(res);
			model.addAttribute("data", walletDAO.getWalletById(userID));
			return new ModelAndView("profile", "user", user);
		}
		
	}
	 
	
	@RequestMapping(value="/upload",method=RequestMethod.GET)
	public ModelAndView photoTesting(HttpSession session) {
		Integer userID = (Integer) session.getAttribute("id");
		UserBean photo=new UserBean();
		photo.setId(userID);
		return new ModelAndView("testphoto","photo",new UserBean());
	}
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String photoTesting(@ModelAttribute("photo") UserBean photo,HttpSession session, ModelMap model) throws IOException {
		Integer userID = (Integer) session.getAttribute("id");
		photo.setId(userID);
	    UserRequestDTO dto =userMapper.mapuserToRequestDTO(photo);
	   dto.setId(photo.getId());
	   System.out.println("ID   :"+dto.getId());
	   
	    try {
			dto.setImagepath(photo.getImagepath().getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
	    int rs = userDAO.addingPhoto(dto);
	    if (rs == 0) {
	        model.addAttribute("error", "Photo Insert Fail (SQL Error)");
	        return "redirect:/userlogin";
	    }
	    return "redirect:/users/profile";
	}
	
	
	
	
	@RequestMapping(value = "/editprofile", method = RequestMethod.GET)
	public ModelAndView editProfile(HttpSession session) throws UnsupportedEncodingException {
		Integer userID = (Integer) session.getAttribute("id");
		if (userID == null) {

			return new ModelAndView("redirect:/loginuser");
		} else {
			UserRequestDTO dto = new UserRequestDTO();
			dto.setId(userID);
			if (userID.equals(dto.getId())) {
				return new ModelAndView("editprofile", "user", userDAO.selectOne(dto));

			} else
				return new ModelAndView("profile", "userbean", userDAO.selectOne(dto));
		}
	}

	@RequestMapping(value = "/viewmoresellphotos", method = RequestMethod.GET)
	public ModelAndView viewMore1(ModelMap model,HttpSession session) throws UnsupportedEncodingException {
		Integer userID = (Integer) session.getAttribute("id");

		if (userID == null) {

			return new ModelAndView("redirect:/userlogin");
		} else {
		model.addAttribute("sellposts", photoDAO.postByCreator(userID));
		    
		return new ModelAndView("viewmoresellphotos", "user", new UserBean());
	}
}

	@RequestMapping(value = "/viewmorebuyphotos", method = RequestMethod.GET)
	public ModelAndView viewMore2(ModelMap model,HttpSession session) throws UnsupportedEncodingException {
		Integer userID = (Integer) session.getAttribute("id");

		if (userID == null) {

			return new ModelAndView("redirect:/userlogin");
		} else {
		model.addAttribute("buyposts", photoDAO.postByOwner(userID));
		    
		return new ModelAndView("viewmorebuyphotos", "user", new UserBean());
		
		}
	}
	@RequestMapping(value = "/userviewphoto", method = RequestMethod.GET)
	  public String userViewPhoto(@RequestParam("id") int id, ModelMap model) throws UnsupportedEncodingException {
	    model.addAttribute("phh", photoDAO.forBuyPostSold(id));
	    model.addAttribute("phh", photoDAO.forBuyPost(id));
	    model.addAttribute("ph", photoDAO.viewPhoto(id));

	    return "userviewphoto";
	  }

	  
	
	@RequestMapping(value = "/userviewbuyphoto", method = RequestMethod.GET)
	  public String userViewBuyPhoto(@RequestParam("id") int id, ModelMap model) throws UnsupportedEncodingException {
	    model.addAttribute("phh", photoDAO.forBuyPostSold(id));
	    model.addAttribute("phh", photoDAO.forBuyPost(id));
	    model.addAttribute("ph", photoDAO.viewPhoto(id));

	    return "userviewbuyphoto";
	  }
}
