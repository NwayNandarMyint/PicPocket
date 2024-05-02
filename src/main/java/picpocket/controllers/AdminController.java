package picpocket.controllers;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import picpocket.DAO.AdminDAO;
import picpocket.DAO.AdminMapper;
import picpocket.DAO.PhotoDAO;
import picpocket.DAO.PhotoMapper;
import picpocket.DAO.ReportDAO;
import picpocket.DAO.ReportMapper;
import picpocket.DAO.UserDAO;
import picpocket.DAO.UserMapper;
import picpocket.DAO.WalletDAO;
import picpocket.DAO.WalletMapper;
import picpocket.DTO.AdminResponseDTO;
import picpocket.DTO.PhotoResponseDTO;
import picpocket.DTO.ReportResponseDTO;
import picpocket.DTO.UserRequestDTO;
import picpocket.DTO.UserResponseDTO;
import picpocket.models.AdminBean;
import picpocket.models.PhotoBean;
import picpocket.models.ReportBean;
import picpocket.models.UserBean;




@Controller
@RequestMapping("/admins")
public class AdminController {
	 @Autowired
	 AdminDAO adminDAO;
	 @Autowired
	 UserDAO userDAO;
	 @Autowired
	 AdminMapper adminMapper;
	 @Autowired
	 UserMapper userMapper;
	 @Autowired
	 PhotoDAO photoDAO;
	 @Autowired
	 WalletDAO walletDAO;
	 @Autowired
	 WalletMapper walletMapper;
	 @Autowired
	 PhotoMapper photoMapper;
	 @Autowired
	 ReportDAO reportDAO;
	 @Autowired
	 ReportMapper reportMapper;
		
	 @RequestMapping(value="/adminlogin",method=RequestMethod.POST)
		public String addAdmin(@ModelAttribute("admin")AdminBean admin,ModelMap model) {
		 
		 AdminResponseDTO dto=adminDAO.adminValid();
		 if(admin.getEmail().equals(dto.getEmail()) && admin.getPassword().equals(dto.getPassword()) ) {
			return "adminhomepage" ;
	 		}
		 model.addAttribute("vemail","Email or password is incorrect!!!!");
		return "adminlogin";
		}
	 
	 @RequestMapping(value="/",method=RequestMethod.GET)
		public String homepage(ModelMap m) throws UnsupportedEncodingException {						
		 List<UserResponseDTO>dtos=adminDAO.selectAllUsers();		
		 List<UserBean>users=userMapper.mapToListUser(dtos);
		 
			m.addAttribute("users", users);
			return "adminhomepage";
		}
	 @RequestMapping(value="/photobanlists",method=RequestMethod.GET)
		public String banlists(ModelMap m) throws UnsupportedEncodingException {						
		 List<PhotoResponseDTO>dtos=adminDAO.selectAllBanPhotos();		
		 List<PhotoBean>photos=photoMapper.mapToListBean(dtos);
		 
			m.addAttribute("photos", photos);
			return "photobanlists";
		}
	
	 @RequestMapping(value = "/adminprofileview", method = RequestMethod.GET)
		public ModelAndView showUserProfile(@RequestParam("id") int userID ,ModelMap model) throws UnsupportedEncodingException {
		 UserRequestDTO dto=new UserRequestDTO();
	    	dto.setId(userID);
	    	PhotoResponseDTO pdto=photoDAO.forBuyPostForBack(userID);
	    	 model.addAttribute("photoid", pdto.getId());
				model.addAttribute("sellposts", photoDAO.postByCreator(userID));
				model.addAttribute("userid",userID);
				model.addAttribute("data", walletDAO.getWalletById(userID));
				
				model.addAttribute("photos", userDAO.profilePhoto(userID));
			
				RedirectAttributesModelMap redirectAttributesModelMap = new RedirectAttributesModelMap();
				redirectAttributesModelMap.addAttribute("userID", userID);
				
				UserResponseDTO res = userDAO.selectOne(dto);
				
				UserBean user = userMapper.mapDTOToUser(res);
				
				return new ModelAndView("adminprofileview", "user", user);
			
			
		}
	 @RequestMapping(value = "/adminviewmoresellphotos", method = RequestMethod.GET)
		public ModelAndView viewMore1(ModelMap model,@RequestParam("id") int creator) throws UnsupportedEncodingException {
			

			if (creator == 0) {

				return new ModelAndView("redirect:/userlogin");
			} else {
			model.addAttribute("sellposts", photoDAO.postByCreator(creator));
			    model.addAttribute("userid", creator);
			return new ModelAndView("adminviewmoresellphotos", "user", new UserBean());
			}
		}
	
	 
	 @RequestMapping(value="/disable/{id}",method=RequestMethod.GET)
		public String disableUser(@PathVariable int id,ModelMap model) {
			int result=adminDAO.disableUser(id);
			if(result==0) {
				model.addAttribute("error","Disable Fail(SQL Error)");
			}		
			
			return "redirect:/admins/";		
		}
		
		@RequestMapping(value="/enable/{id}",method=RequestMethod.GET)
		public String enableUser(@PathVariable int id,ModelMap model) {
			int result=adminDAO.enableUser(id);
			if(result==0) {
				model.addAttribute("error","Enable Fail(SQL Error)");
			}			
			
			return "redirect:/admins/";		
		}
		
		@RequestMapping(value="/unban/{id}",method=RequestMethod.GET)
	    public String disablePhoto(@PathVariable int id,ModelMap model) {
	      int result=adminDAO.unbanPhoto(id);
	      if(result==0) {
	        model.addAttribute("error","Disable Fail(SQL Error)");
	      }    
	      
	      return "redirect:/admins/";    
	    }
	    
	    @RequestMapping(value="/ban/{id}",method=RequestMethod.GET)
	    public String enablePhoto(@PathVariable int id,ModelMap model) {
	      int result=adminDAO.banPhoto(id);
	      if(result==0) {
	        model.addAttribute("error","Enable Fail(SQL Error)");
	      }      
	      
	      return "redirect:/admins/";    
	    }
		@RequestMapping(value = "/adminviewbuyphoto", method = RequestMethod.GET)
		public String buyPhoto(@RequestParam("id") int photo_id, HttpSession session, ModelMap model) throws UnsupportedEncodingException {
		   
		    model.addAttribute("ph", photoDAO.forBuyPost(photo_id));
		    model.addAttribute("photoId", photo_id);

		    return "adminviewbuyphoto";
		}
		  
		@RequestMapping(value = "/adminviewphoto", method = RequestMethod.GET)
		public String viewPhoto(@RequestParam("id") int id, ModelMap model) throws UnsupportedEncodingException {
			UserResponseDTO dto = new UserResponseDTO();
			dto.setId(id);
			model.addAttribute("phh", photoDAO.forBuyPost(id));
			model.addAttribute("ph", photoDAO.viewPhoto(id));

			return "adminviewphoto";
		}
		
		 @RequestMapping(value="/displayreport",method=RequestMethod.GET)
			public String displayreport(ModelMap m) throws UnsupportedEncodingException {
				//int reportCount=reportDAO.count();
				//List<ReportResponseDTO>counts=new ArrayList<ReportResponseDTO>();
				List<ReportResponseDTO>dtos=reportDAO.getAllReports();		
				List<ReportBean>reports=reportMapper.mapToListBean(dtos);	
				System.out.println(dtos.size()+""+reports.size());
				m.addAttribute("reports", reports);
				//m.addAttribute("reportCount", reportCount);
				return "/displayreport";
			}
		 
		 @RequestMapping(value="/displayphotos11",method = RequestMethod.GET)
	     public String displayPhoto(@RequestParam("id") int id,HttpSession session,ModelMap model) throws UnsupportedEncodingException {
	      AdminResponseDTO dto=new AdminResponseDTO();
	      dto.setId(id);
	      
	      model.addAttribute("ph", photoDAO.forDisplayPost(id));  
	      System.out.println("TEST222 :"+photoDAO.forDisplayPost(id)); 
	       return "displayphotos11";
	          
	 }
		
}
