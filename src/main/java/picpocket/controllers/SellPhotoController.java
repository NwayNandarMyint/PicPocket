package picpocket.controllers;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import picpocket.DAO.PhotoDAO;
import picpocket.DAO.PhotoMapper;
import picpocket.DAO.WalletDAO;
import picpocket.DTO.PhotoRequestDTO;
import picpocket.DTO.PhotoResponseDTO;
import picpocket.models.PhotoBean;

@Controller
@RequestMapping("/users")
public class SellPhotoController {
	@Autowired
	PhotoDAO photoDAO;
	@Autowired
	PhotoMapper photoMapper;
	@Autowired
	WalletDAO walletDAO;
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView uploadPhoto(HttpSession session) {
		Integer userID = (Integer) session.getAttribute("id");

		if (userID == null) {

			return new ModelAndView("redirect:/userlogin");
		} else {
			PhotoBean photo = new PhotoBean();
			photo.setCreator(userID);
			return new ModelAndView("sellphoto", "photo", new PhotoBean());
		}
	}

	@RequestMapping(value = "/photocreate", method = RequestMethod.POST)
	  public String addUser(@ModelAttribute("photo") @Validated PhotoBean photo, BindingResult bResult, ModelMap model,
	          HttpSession session) throws SerialException, SQLException, IOException {
	      if (bResult.hasErrors()) {
	          return "sellphoto";
	      }
	      photo.setSold(true);
	      photo.setBan(true);
	      Integer userid = (Integer) session.getAttribute("id");

	      // Deduct 3 from the user's wallet total amount
	    double deductionAmount = 3.0;
	    if (buyerHasEnoughCoin(userid, deductionAmount)) {

	      model.addAttribute("error", "Insufficient funds and You need 3 coil to create the photo.");

	      return "sellphoto";
	    } else {
	      boolean walletUpdateSuccess = walletDAO.updateWalletAmount(userid, -deductionAmount);
	       PhotoRequestDTO dto = photoMapper.mapToRequestDTO(photo);
	          dto.setImagepath(photo.getImagepath().getBytes());
	          dto.setAlbum_id(1);
	          dto.setCreator(userid);
	          dto.setOwner_id(userid);

	          int rs = photoDAO.addPhoto(dto);
	          if (rs == 0) {
	              model.addAttribute("error", "Insert Fail(SQL Error)");
	              return "sellphoto";
	          }if (!walletUpdateSuccess) {
	          model.addAttribute("error", "Failed to deduct amount from the wallet. Photo creation unsuccessful.");
	          return "sellphoto";
	        }
	      
	      model.addAttribute("result", rs);
	      return "redirect:/users/home";
	    }
	  }

	  @RequestMapping(value = "/buyphoto", method = RequestMethod.GET)
	  public String buyPhoto(@RequestParam("id") int photo_id, HttpSession session, ModelMap model) throws UnsupportedEncodingException {
	      PhotoResponseDTO dto = new PhotoResponseDTO();
	      dto.setId(photo_id);

	      model.addAttribute("ph", photoDAO.forBuyPost(photo_id));
	      model.addAttribute("photoId", photo_id);

	      return "buyphoto";
	  }
	  @RequestMapping(value = "/buyphoto", method = RequestMethod.POST)
	  public String buyPhotoPost(@RequestParam("photo_id") int photoId, HttpSession session, ModelMap model) throws UnsupportedEncodingException {
	      Integer buyerId = (Integer) session.getAttribute("id");
	      model.addAttribute("ph", photoDAO.forBuyPost(photoId));

	      if (buyerId == null) {
	          model.addAttribute("error", "User not logged in. Please log in to purchase photos.");
	          return "redirect:/userlogin";
	      }

	      try {
	          PhotoResponseDTO photoDTO = photoDAO.forBuyPost(photoId);

	          // Check if buyer is trying to buy their own photo
	          if (photoDTO.getCreator() == buyerId) {
	              model.addAttribute("error", "You cannot buy your own photos.");
	              return "buyphoto";
	          }

	          if (buyerHasEnoughCoin(buyerId, photoDTO.getPrice())) {
	              model.addAttribute("error", "Insufficient funds to purchase the photo.");
	              return "buyphoto";
	          } else {
	            double mount=photoDTO.getPrice()+3;
	                System.out.println(mount);
	              boolean transactionSuccess = walletDAO.updatePhotoOwnerAndWalletTransaction(photoId, buyerId, photoDTO.getCreator(), photoDTO.getPrice(),photoDTO.getTitle(), photoDTO.getDescription(),mount);

	              if (transactionSuccess) {
	                
	                  model.addAttribute("success", "Photo purchased successfully!");
	                  return "redirect:/users/home";
	              } else {
	                  model.addAttribute("error", "Failed to complete the photo purchase transaction. Please try again.");
	              }
	          }

	      } catch (UnsupportedEncodingException e) {
	          e.printStackTrace();
	          model.addAttribute("error", "Error processing photo purchase.");
	      }

	      return "redirect:/users/buyphoto";
	  }

	  private boolean buyerHasEnoughCoin(int buyerId, double requiredAmount) {
	    double totalAmount = walletDAO.getTotalAmount(buyerId);
	    return totalAmount < requiredAmount;
	  }


	/*
	 * @RequestMapping(value = "/buyphoto", method = RequestMethod.POST) public
	 * String buyPhotoPost(@RequestParam("id") int photoId, HttpSession session,
	 * ModelMap model) { Integer buyerId = (Integer) session.getAttribute("id");
	 * 
	 * if (buyerId == null) { return "redirect:/userlogin"; }
	 * 
	 * try { PhotoResponseDTO photoDTO = photoDAO.forBuyPost(photoId);
	 * 
	 * 
	 * if (buyerHasEnoughCoin(buyerId, photoDTO.getPrice())) {
	 * 
	 * boolean deductionSuccess = walletDAO.deductAmountFromWallet(buyerId,
	 * photoDTO.getPrice());
	 * 
	 * if (deductionSuccess) { // Increase amount to the creator's wallet boolean
	 * increaseSuccess = walletDAO.increaseAmountToWallet(photoDTO.getCreator(),
	 * photoDTO.getPrice());
	 * 
	 * if (increaseSuccess) {
	 * 
	 * boolean updateSuccess = photoDAO.updatePhotoOwner(photoId, buyerId);
	 * 
	 * if (updateSuccess) { model.addAttribute("success",
	 * "Photo purchased successfully!"); } else { model.addAttribute("error",
	 * "Failed to update photo owner. Please try again."); } } else {
	 * model.addAttribute("error",
	 * "Failed to increase amount to the creator's wallet. Please try again."); } }
	 * else { model.addAttribute("error",
	 * "Insufficient funds to purchase the photo."); } } else {
	 * model.addAttribute("error", "Insufficient funds to purchase the photo."); } }
	 * catch (UnsupportedEncodingException e) { e.printStackTrace();
	 * model.addAttribute("error", "Error processing photo purchase."); }
	 * 
	 * return "redirect:/users/home"; }
	 * 
	 * private boolean buyerHasEnoughCoin(int buyerId, double requiredAmount) {
	 * double totalAmount = walletDAO.getTotalAmount(buyerId); return totalAmount >=
	 * requiredAmount; }
	 * 
	 * 
	 */
}