package picpocket.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import picpocket.DAO.AlbumDAO;
import picpocket.DAO.AlbumMapper;
import picpocket.DAO.PhotoDAO;
import picpocket.DTO.AlbumRequestDTO;
import picpocket.DTO.AlbumResponseDTO;
import picpocket.models.AlbumBean;
@Controller
@RequestMapping("/albums")
public class AlbumController {
	@Autowired
	AlbumDAO albumDAO;
	@Autowired
	PhotoDAO photoDAO;
	@Autowired
	AlbumMapper mapper;
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String displayAlbums(ModelMap m) {
		List<AlbumResponseDTO>dtos=albumDAO.getAllAlbums();
		List<AlbumBean>albums=mapper.mapToListBean(dtos);		
		m.addAttribute("albums", albums);
		return "displayalbums";
	}
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public ModelAndView addAlbum(ModelMap model) {
				return new ModelAndView("album","album",new AlbumBean());
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addalbum(@ModelAttribute("album") @Validated AlbumBean album,BindingResult bResult,ModelMap model) {
		if(bResult.hasErrors()) {
			return "album";
		}
		AlbumRequestDTO dto=mapper.mapToRequestDTO(album);
		int rs=albumDAO.addAlbum(dto);
		if(rs==0) {
			model.addAttribute("error","Insert Fail(SQL Error)");
			return "album"; 
		}
		return "redirect:/albums/";
	}@RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
	public ModelAndView editAlbum(@PathVariable int id) {
		AlbumResponseDTO dto=albumDAO.getAlbumById(id);
		AlbumBean album=mapper.mapToBean(dto);
		
		return new ModelAndView("editalbum","album",album);
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String editAlbum(@ModelAttribute("album") @Validated AlbumBean albums,BindingResult bResult,ModelMap model) {
		if(bResult.hasErrors()) {
			return "editalbum";
		}		
		AlbumRequestDTO dto=mapper.mapToRequestDTO(albums);		
		int rs=albumDAO.editAlbum(dto);
		if(rs==0) {
			model.addAttribute("error","AlbumUpdate Fail(SQL Error)");
			return "editalbum"; 
		}
		return "redirect:/albums/";
	}
	
}
	


