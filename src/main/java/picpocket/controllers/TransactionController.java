package picpocket.controllers;

import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import picpocket.DAO.UserDAO;
import picpocket.DAO.WalletDAO;
import picpocket.DAO.WalletExchangeMapper;
import picpocket.DAO.WalletMapper;
import picpocket.DTO.WalletExchangeRequestDTO;
import picpocket.DTO.WalletResponseDTO;
import picpocket.models.ExchangeType;
import picpocket.models.WalletBean;
import picpocket.models.WalletExchangeBean;

@Controller
@RequestMapping("/admins")
public class TransactionController {

    @Autowired
    WalletDAO walletDAO;
    @Autowired
    WalletMapper walletMapper;

    @Autowired
    WalletExchangeMapper wexMapper;
    @Autowired
    UserDAO userDAO;

	private String DateCreator() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd  HH:mm");
		   LocalDateTime now = LocalDateTime.now();
		   String createddate =dtf.format(now);
		   System.out.println(createddate);
		   return createddate;
	}
	
    @RequestMapping(value = "/deposite", method = RequestMethod.GET)
    public ModelAndView viewWalletExchange(ModelMap model, HttpSession session, @RequestParam("id") int user_id) throws UnsupportedEncodingException {
    	
    	int uid=user_id;
    	session.setAttribute("user_id", uid);
    	model.addAttribute("data", walletDAO.getWalletById(uid));
    	WalletResponseDTO wdto=walletDAO.getWalletById(uid);
    	
    	WalletExchangeBean walletEx = new WalletExchangeBean();
    	walletEx.setWallet_id(wdto.getId());
        walletEx.setExchangetype(ExchangeType.DEPOSIT);
        model.addAttribute("walletEx", walletEx);
        
        return new ModelAndView("deposite", "walletEx", walletEx);
    }

    @RequestMapping(value = "/deposite", method = RequestMethod.POST)
    public String depositCoin(@ModelAttribute("walletEx") WalletExchangeBean walletEx,@RequestParam("password") int password,ModelMap model, HttpSession session) throws UnsupportedEncodingException {
    	int user_Id=(int)session.getAttribute("user_id");
    	
		 model.addAttribute("data", walletDAO.getWalletById(user_Id)); 
        try {

        	double depositAmount = walletEx.getAmount();
        	
           if(!walletEx.getPassword().equals("123456")) {
        	   model.addAttribute("error","Password is incorrect!!!!");
        	   return "/deposite";
           }
        	   
        	   if (depositAmount <= 0 ) {
                   model.addAttribute("error", "Invalid deposit amount. Please enter a positive value.");
                   return "/deposite";
               }   
        	   
        	WalletResponseDTO rwallet = walletDAO.getWalletById(walletEx.getWallet_id());
        	WalletBean wallet = walletMapper.mapDTOToWallet(rwallet);

        	wallet.setTotalamount(wallet.getTotalamount() + depositAmount);
        	
        	walletEx.setExchangetype(ExchangeType.DEPOSIT);
        	walletEx.setExchangeDate(DateCreator());
        	
        	WalletExchangeRequestDTO wedto = wexMapper.mapWalletExchangeToRequestDTO(walletEx);
        	wedto.setExchangetype(walletEx.getExchangetype());
        	wedto.setWallet_id(walletEx.getWallet_id());
        	
        	walletDAO.exchangeCoin(wedto);
        
        	model.addAttribute("data", walletDAO.getWalletById(walletEx.getWallet_id()));
          
        } catch (Exception e) {
           
            e.printStackTrace();
            model.addAttribute("error", "Error during deposit: " + e.getMessage());
        }

        return "redirect:/admins/";
    }
    
    @RequestMapping(value = "/withdraw", method = RequestMethod.GET)
    public ModelAndView viewWithdraw(ModelMap model, HttpSession session, @RequestParam("id") int user_id)
            throws UnsupportedEncodingException {
    	
    	int uId = user_id;
    	
    	session.setAttribute("user_id", uId);
        
        WalletResponseDTO wdto = walletDAO.getWalletById(uId);
        WalletExchangeBean walletEx = new WalletExchangeBean();
        walletEx.setWallet_id(wdto.getId());
        walletEx.setExchangetype(ExchangeType.WITHDRAW);
        model.addAttribute("data", wdto);
        return new ModelAndView("withdraw", "walletEx", walletEx);
    }

    @RequestMapping(value = "/withdraw", method = RequestMethod.POST)
    public String withdrawCoin(@ModelAttribute("walletEx") WalletExchangeBean walletEx, ModelMap model, HttpSession session) throws UnsupportedEncodingException {
        
    	
    	int user_Id=(int)session.getAttribute("user_id");
    	
    	  model.addAttribute("data", walletDAO.getWalletById(user_Id));
    	
    	try {
        	
            int walletId = walletEx.getWallet_id();
            double withdrawAmount = walletEx.getAmount();
            
            if(walletEx.getPassword().equals("123456")) {
            
            WalletResponseDTO rwallet = walletDAO.getWalletById(walletId);
            WalletBean wallet = walletMapper.mapDTOToWallet(rwallet);

           
            if (withdrawAmount <= 0) {
                model.addAttribute("error", "Invalid withdraw amount. Please enter a positive value.");
               
                return "/withdraw";
            }

            if (withdrawAmount > wallet.getTotalamount()) {
            	
                model.addAttribute("error", "Insufficient funds for withdrawal.");
           
                return "/withdraw";
            }

          
            wallet.setTotalamount(wallet.getTotalamount() - withdrawAmount);

            
            walletEx.setExchangetype(ExchangeType.WITHDRAW);
            walletEx.setExchangeDate(DateCreator());
            
            WalletExchangeRequestDTO wedto = wexMapper.mapWalletExchangeToRequestDTO(walletEx);
            wedto.setExchangetype(walletEx.getExchangetype());
            wedto.setWallet_id(walletId);

            walletDAO.exchangeCoin(wedto);
           

            model.addAttribute("data", walletDAO.getWalletById(walletId));
            }else {
            	model.addAttribute("error","Password is incorrect!!!!");
            	
            	return "/withdraw";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error during withdrawal: " + e.getMessage());
        }

        return "redirect:/admins/";
    }


}
