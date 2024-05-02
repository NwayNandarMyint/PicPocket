package picpocket.DTO;

import java.time.LocalDateTime;

import picpocket.models.ExchangeType;

public class WalletExchangeRequestDTO {

	
	 	private int id;
	    
	    private Double amount;
	    private LocalDateTime exchangeDate;
	    private int wallet_id;
	    private String password;
	    private ExchangeType exchangetype;
	    private boolean hasNoti;
	    public WalletExchangeRequestDTO(){
	    	
	    }
	    
		public boolean isHasNoti() {
			return hasNoti;
		}


		public void setHasNoti(boolean hasNoti) {
			this.hasNoti = hasNoti;
		}


		public ExchangeType getExchangetype() {
			return exchangetype;
		}

		public void setExchangetype(ExchangeType exchangetype) {
			this.exchangetype = exchangetype;
		}

		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		public Double getAmount() {
			return amount;
		}
		public void setAmount(Double amount) {
			this.amount = amount;
		}
		public LocalDateTime getExchangeDate() {
			return exchangeDate;
		}
		public void setExchangeDate(LocalDateTime exchangeDate) {
			this.exchangeDate = exchangeDate;
		}
		public int getWallet_id() {
			return wallet_id;
		}
		public void setWallet_id(int wallet_id) {
			this.wallet_id = wallet_id;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
	    
	    
}
