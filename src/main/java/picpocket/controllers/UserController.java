package picpocket.controllers;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import picpocket.DAO.AdminDAO;
import picpocket.DAO.AdminMapper;
import picpocket.DAO.MyConnection;
import picpocket.DAO.PhotoDAO;
import picpocket.DAO.PhotoMapper;
import picpocket.DAO.UserDAO;
import picpocket.DAO.UserMapper;
import picpocket.DAO.WalletDAO;
import picpocket.DTO.AdminResponseDTO;
import picpocket.DTO.PhotoResponseDTO;
import picpocket.DTO.PhotoTradingDTO;
import picpocket.DTO.UserRequestDTO;
import picpocket.DTO.UserResponseDTO;
import picpocket.DTO.WalletExchangeResponseDTO;
import picpocket.models.ExchangeType;
import picpocket.models.NotiBean;
import picpocket.models.UserBean;

@Controller
@RequestMapping("/users")
public class UserController {
	@Autowired
	WalletDAO walletDAO;

	@Autowired
	UserDAO userDAO;
	@Autowired
	UserMapper userMapper;
	@Autowired
	PhotoDAO photoDAO;
	@Autowired
	PhotoMapper photoMapper;
	@Autowired
	AdminDAO adminDAO;
	@Autowired
	AdminMapper adminMapper;
	
	public static Connection con = null;
	  static {
	    try {
	      con = MyConnection.getConnection();
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }
	private static final int ITEMS_PER_PAGE =24;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String logo(@RequestParam(name = "page", defaultValue = "1") int page, HttpSession session, ModelMap model) throws UnsupportedEncodingException {
	      List<PhotoResponseDTO> photos = photoDAO.allPosts();
	      int totalItems = photos.size();
	      int totalPages = (totalItems + ITEMS_PER_PAGE - 1) / ITEMS_PER_PAGE;

	      int startIndex = (page - 1) * ITEMS_PER_PAGE;
	      int endIndex = page * ITEMS_PER_PAGE;

	      
	      if (endIndex > totalItems) {
	          endIndex = totalItems;
	      }

	      List<PhotoResponseDTO> paginatedPhotos = photos.subList(startIndex, endIndex);

	      // Define how many pages to show in pagination
	      int maxPageLinks = 3; // Adjust this as needed5

	      
	      int startPage = page - (maxPageLinks / 2);
	      int endPage = startPage + maxPageLinks - 1;

	      
	      while (startPage < 1 && endPage < totalPages) {
	          startPage++;
	          endPage++;
	      }
	      while (endPage > totalPages && startPage > 1) {
	          endPage--;
	          startPage--;
	      }

	      
	      while (endPage - startPage + 1 < maxPageLinks && startPage > 1) {
	          startPage--;
	      }

	      model.addAttribute("photos", paginatedPhotos);
	      model.addAttribute("currentPage", page);
	      model.addAttribute("totalPages", totalPages);
	      model.addAttribute("startPage", startPage);
	      model.addAttribute("endPage", endPage);

	      return "home2";
	  }
	
	
	@RequestMapping(value="/home",method = RequestMethod.GET)
	public String shownewsfeed(@RequestParam(name = "page", defaultValue = "1") int page,HttpSession session,ModelMap model) throws UnsupportedEncodingException {
		int creator = (int) session.getAttribute("id");
		int count = 0;
    	List<PhotoResponseDTO> photos=photoDAO.allPosts();
   	 int startIndex = (page - 1) * ITEMS_PER_PAGE;
        int endIndex = startIndex + ITEMS_PER_PAGE;
        if (endIndex >= photos.size()) {
            endIndex = photos.size();
        }
        List<PhotoResponseDTO> paginatedPhotos = photos.subList(startIndex, endIndex);
        int totalPages = (photos.size() + ITEMS_PER_PAGE - 1) / ITEMS_PER_PAGE;
        model.addAttribute("photos", paginatedPhotos);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
	    
	    
	    System.out.println("TEST :"+session.getAttribute("id"));
	    List<PhotoTradingDTO> noti = photoDAO.hasNotiFromPhoto(creator);
	      model.addAttribute("hasnoti", noti);
	      List<WalletExchangeResponseDTO> noti2 = walletDAO.hasNotiForWallet(creator);
	      model.addAttribute("hasnoti2", noti2);
	      List<PhotoTradingDTO> photoDTO = photoDAO.photoTradingLogs(creator);
	      
	      List<WalletExchangeResponseDTO> wallet = walletDAO.walletTradingByWalletId(creator);

	      List<NotiBean> notiList = new ArrayList<>();

	      // Process photo trading logs
	      for (PhotoTradingDTO v : photoDTO) {
	          count++; // Increment count
	          notiList.add(new NotiBean(
	                  v.getId(),
	                  v.getBuyer_name() + " buy your photo.",
	                  v.getTrading_date()));
	      }

	      // Process wallet transactions
	      for (WalletExchangeResponseDTO v : wallet) {
	          count++; // Increment count
	          notiList.add(new NotiBean(
	                  v.getId(),
	                  ExchangeType.DEPOSIT.equals(v.getExchangetype())
	                          ? "You have received " + v.getAmount() + " coin."
	                          : "You withdraw " + v.getAmount() + " coin.",
	                  v.getExchangeDate()));
	      }

	      // Sorting the notiList by date-time in descending order
	      notiList.sort(Comparator.comparing(NotiBean::getDateTime).reversed());

	      model.addAttribute("notiList", notiList);
	    
		 
   		return "home";
           }
	  
	@RequestMapping(value = "/viewphoto", method = RequestMethod.GET)
	public String viewPhoto(@RequestParam("id") int id, ModelMap model) throws UnsupportedEncodingException {
		UserResponseDTO dto = new UserResponseDTO();
		dto.setId(id);
		model.addAttribute("phh", photoDAO.forBuyPost(id));
		model.addAttribute("ph", photoDAO.viewPhoto(id));

		return "viewphoto";
	}
	
	

	@RequestMapping(value = "/userprofileview", method = RequestMethod.GET)
	public ModelAndView showUserProfile(@RequestParam("id") int id, ModelMap model) 
	        throws UnsupportedEncodingException {
	    UserRequestDTO dto = new UserRequestDTO();
	    dto.setId(id);
	    PhotoResponseDTO pdto=photoDAO.forBuyPostForBack(id);
	    
	    model.addAttribute("sellposts", photoDAO.postByCreator(id));
	    model.addAttribute("photos", userDAO.profilePhoto(id));
	    model.addAttribute("data", walletDAO.getWalletById(id));
	    
	    
	    model.addAttribute("photoid", pdto.getId());
	    model.addAttribute("userid", pdto.getCreator());
	    UserResponseDTO res = userDAO.selectOne(dto);
	 

	    UserBean user = userMapper.mapDTOToUser(res);

	    return new ModelAndView("userprofileview", "user", user);
	}

	@RequestMapping(value = "/userviewmoresellphotos", method = RequestMethod.GET)
	public ModelAndView userViewMore(ModelMap model,@RequestParam("id") int userID) throws UnsupportedEncodingException {
		 model.addAttribute("userid", userID);
		model.addAttribute("sellposts", photoDAO.postByCreator(userID));
		
		    
		return new ModelAndView("userviewmoresellphotos", "user", new UserBean());
	
}

	@RequestMapping(value = "/userlogin", method = RequestMethod.GET)
	public ModelAndView addUser() {
		return new ModelAndView("userlogin", "user", new UserBean());
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	  public String login(@ModelAttribute("user") UserBean user, HttpSession session, BindingResult bResult, ModelMap model) {
	      if (bResult.hasErrors()) {
	          return "userlogin";
	      }
	      user.setActive(true);

	      // Check if it's an admin login or a user login
	      if (isAdmin(user.getEmail())) {
	          AdminResponseDTO adminRes = adminDAO.checkingAdminLogin(user.getEmail());
	          if (user.getPassword().equals(adminRes.getPassword())) {
	              session.setAttribute("id", adminRes.getId());
	              session.setAttribute("role", "admin"); // Set admin role in session
	              return "redirect:/admins/"; // Redirect to admin home page
	          }
	      } else {
	          UserResponseDTO userRes = userDAO.checkingUserLogin(user.getEmail());
	          if (user.getPassword().equals(userRes.getPassword())) {
	              session.setAttribute("id", userRes.getId());
	              session.setAttribute("role", "user"); // Set user role in session
	              return "redirect:/users/home"; // Redirect to user home page
	          }
	      }

	      model.addAttribute("emailerror", "Please check your password and email again!");
	      return "userlogin";
	  }
	private boolean isAdmin(String email) {
	      String sql = "SELECT COUNT(*) FROM admin WHERE email = ?";
	      try {
	          PreparedStatement ps = con.prepareStatement(sql);
	          ps.setString(1, email);
	          ResultSet rs = ps.executeQuery();
	          if (rs.next()) {
	              int count = rs.getInt(1);
	              return count > 0;
	          }
	      } catch (SQLException e) {
	          System.out.println("Error checking if email is admin: " + e.getMessage());
	      }
	      return false; 
	  }

	@RequestMapping(value = "/userregister", method = RequestMethod.GET)
	public ModelAndView userRegister(ModelMap model) throws UnsupportedEncodingException {
		List<UserResponseDTO> dtos = userDAO.selectAllUsers();
		List<UserBean> user = userMapper.mapToListUser(dtos);
		model.addAttribute("user", user);

		return new ModelAndView("userregister", "user", new UserBean());
	}

	@RequestMapping(value = "/userregister", method = RequestMethod.POST)
	public String userRegister(@ModelAttribute("user") @Validated UserBean user, BindingResult bResult, ModelMap model,
			HttpSession session) throws IOException {
		if (bResult.hasErrors()) {
			return "userregister";
		} else if (!user.getPassword().equals(user.getCfpassword())) {
			model.addAttribute("pswerror", "Password doesn't match!!!!!");
			return "userregister";
		} else if (userDAO.isEmailExist(user.getEmail())) {
			model.addAttribute("emailerror", "Email already exists!!");
			return "userregister";
		}

		UserRequestDTO dto = userMapper.mapuserToRequestDTO(user);
		dto.setImagepath(user.getImagepath().getBytes());

		int rs = userDAO.addUser(dto);
		if (rs == 0) {
			model.addAttribute("error", "User Insert Fail(SQL Error)");
			return "userregister";
		}

		session.setAttribute("id", dto.getId());
		return "userlogin";
	}

	@RequestMapping(value = "/updatepassword", method = RequestMethod.GET)
	  public ModelAndView UpdatePassword(HttpSession session, ModelMap model) throws UnsupportedEncodingException {
	    Integer userID = (Integer) session.getAttribute("id");
	    System.out.println(userID);
	    model.addAttribute("userId", userID);
	    if (userID == null) {

	      return new ModelAndView("redirect:/userlogin");
	    } else {
	      UserRequestDTO dto = new UserRequestDTO();
	      dto.setId(userID);
	      if (userID.equals(dto.getId())) {
	        return new ModelAndView("changepsw", "psw", new UserBean());

	      } else
	        return new ModelAndView("profile", "psw", userDAO.selectOne(dto));

	    }
	  }
	
	@RequestMapping(value = "/forgotpass", method = RequestMethod.GET)
	  private String forgotPassword() {
	    
	    return "askemail";}
	  @RequestMapping(value = "/verifyemail", method = RequestMethod.POST)
	  private String verifyEmail(@RequestParam("email") String userEmail,@RequestParam("password") String userPassword,@RequestParam("phone_no") String userPhone) throws UnsupportedEncodingException {
	    System.out.println("email  "+userEmail);
	    System.out.println("pass "+userPassword);
	    System.out.println("phone  "+userPhone);
	    UserDAO dao=new UserDAO();
	    UserRequestDTO dto= dao.verifyEmail(userEmail, userPhone);
	    System.out.println(dto.getName());
	    if(dto.getName()==null) {
	      return "askemail";
	    }
	    else {
	      dto.setNewpassword(userPassword);
	      dao.updatePassword(dto);
	      
	      return "redirect:/users/";}
	    }

	  @RequestMapping(value = "/updatepassword", method = RequestMethod.POST)
	  public String updatePassword(@ModelAttribute("psw") UserBean user, HttpSession session, ModelMap model)
	      throws UnsupportedEncodingException {
	    int userID = (int) session.getAttribute("id");
	    UserRequestDTO dto = new UserRequestDTO();
	    dto.setId(userID);
	    dto.setNewpassword(user.getNewpassword());
	    dto.setCfpassword(user.getCfpassword());
	    System.out.println("passwoed  :" + user.getNewpassword() + user.getCfpassword());
	    UserResponseDTO resDTO = userDAO.selectOne(dto);
	    System.out.println("Password  :" + resDTO.getPassword() + "PSW" + user.getPassword());

	    if (!user.getPassword().equals(resDTO.getPassword())) {
	      model.addAttribute("error", "Incorrect old password");
	      return "changepsw";
	    }

	    if (user.getPassword().equals(user.getNewpassword())) {
	      model.addAttribute("error", "Old password and new password can't be the same");
	      return "changepsw";
	    }
	    if (!user.getNewpassword().equals(user.getCfpassword())) {
	      model.addAttribute("error", "Confarm password and new password are not same");
	      return "changepsw";
	    }

	    userDAO.updatePassword(dto);
	    return "redirect:/users/profile";
	  }

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	private String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/users/";
	}
	@RequestMapping(value = "/termofservice", method = RequestMethod.GET)
	private String termofservice() {
		return "termofservice";
	}
	@RequestMapping(value = "/termofservicelo", method = RequestMethod.GET)
	private String termofservicelo() {
		return "termofservicelo";
	}

}
