package picpocket.models;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class WalletExchangeBean {
    private int id;
    private ExchangeType exchangetype;
    
    @NotEmpty(message="Amount is required!!")
    @Size(min = 1,message="Amount must be greater than or 0 !!!")
    private Double amount;
    private String exchangeDate;
    
    private int wallet_id;
    private boolean hasNoti;

    @NotEmpty(message="Password is required")
    @Size(min = 6,message="Password must be greater than or 6 !!!")
    private String password;
    
    public WalletExchangeBean() {
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


	public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getExchangeDate() {
        return exchangeDate;
    }

    public void setExchangeDate(String exchangeDate) {
        this.exchangeDate = exchangeDate;
    }

    public int getWallet_id() {
        return wallet_id;
    }

    public void setWallet_id(int wallet_id) {
        this.wallet_id = wallet_id;
    }
}
