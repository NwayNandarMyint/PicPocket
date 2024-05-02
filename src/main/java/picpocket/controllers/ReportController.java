package picpocket.controllers;
import java.io.UnsupportedEncodingException;
import java.util.*;

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
import picpocket.DAO.PhotoDAO;
import picpocket.DAO.PhotoMapper;
import picpocket.DAO.ReportDAO;
import picpocket.DAO.ReportMapper;
import picpocket.DTO.ReportRequestDTO;
import picpocket.DTO.ReportResponseDTO;
import picpocket.models.PhotoBean;
import picpocket.models.ReportBean;
@Controller
@RequestMapping("/users")
public class ReportController {
  @Autowired
  ReportDAO reportDAO;
  @Autowired
  PhotoDAO photoDAO;
  @Autowired
  ReportMapper reportMapper;
  @Autowired
  PhotoMapper photoMapper;
  @RequestMapping(value="/photo",method=RequestMethod.GET)
	public ModelAndView addReport(@RequestParam("id") int id, HttpSession session ,ModelMap model) throws UnsupportedEncodingException {
		//List<PhotoBean> photos=photoMapper.mapToListBean(photoDAO.allPosts());		
	  String photo_title=photoDAO.getPhotoTitleById(id);
		ReportBean report=new ReportBean();
		report.setPhoto_id(id);
		report.setPhoto_title(photo_title);
		//model.addAttribute("photos", photos);
		int userId= (int) session.getAttribute("id");
		report.setUser_id(userId);		
		return new ModelAndView("report","report",report);
	}
  @RequestMapping(value="addreport",method=RequestMethod.POST)
	public String addReport(@ModelAttribute("report") @Validated ReportBean report,HttpSession session,BindingResult bResult,ModelMap model) {
		if(bResult.hasErrors()) {
			return "report";
		}
		ReportRequestDTO dto=reportMapper.mapToRequestDTO(report);
		int userId= (int) session.getAttribute("id");
		dto.setUser_id(userId);		
		int rs=reportDAO.addReport(dto);
		if(rs==0) {
			model.addAttribute("error","Insert Fail(SQL Error)");
			return "report"; 
		}
		return "redirect:/users/home";
	}

}
  /* @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView uploadCheatSheet(HttpSession session) throws UnsupportedEncodingException {
      List<PhotoResponseDTO>dtos=photoDAO.allPosts();    
      List<PhotoBean>photos=photoMapper.mapToListBean(dtos);  
      Integer photoID =(Integer)session.getAttribute("id");
      
            if (photoID == null) {
                
                return new ModelAndView("redirect:/userlogin");
            } else {
              ReportBean report=new ReportBean();
              report.setId(photoID);
      return new ModelAndView("report", "report", new ReportBean());
            }
    }
    
    
    @RequestMapping(value="/add",method=RequestMethod.POST)
    public String addUser(@ModelAttribute("report") @Validated ReportBean report,BindingResult bResult, ModelMap model,HttpSession session) throws SerialException, SQLException, IOException {
      if(bResult.hasErrors()) {
        return "report";
      }
      Integer photoid =(Integer)session.getAttribute("id");
      

      ReportRequestDTO dto = reportMapper.mapToRequestDTO(report);
      dto.setDescription(report.getDescription());
      dto.setPhoto_id(photoid);
      dto.setUser_id(photoid);
      System.out.println("3333--"+dto.getPhoto_id()+"photoid"+dto.getUser_id()+"user"+"Owner"+dto.getDescription()+"description   :");
     
      int rs=reportDAO.addReport(dto);
      if(rs==0) {
        model.addAttribute("error","Insert Fail(SQL Error)");
        return "report"; 
      }
      
      model.addAttribute("result",rs);
      return "redirect:/reports/add";
    }

  }*/