package picpocket.DTO;

import java.time.LocalDateTime;

public class PhotoTradingDTO {
	private int id;
	private String title;
	private String description;
	private int buyer;
	private String photo_id;
	private LocalDateTime trading_date;
	private String Buyer_name;
	private Boolean hasNoti;
	public PhotoTradingDTO() {
		
	}
	
	public Boolean getHasNoti() {
		return hasNoti;
	}

	public void setHasNoti(Boolean hasNoti) {
		this.hasNoti = hasNoti;
	}

	public String getBuyer_name() {
		return Buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		Buyer_name = buyer_name;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public int getBuyer() {
		return buyer;
	}

	public void setBuyer(int buyer) {
		this.buyer = buyer;
	}

	public String getPhoto_id() {
		return photo_id;
	}
	public void setPhoto_id(String photo_id) {
		this.photo_id = photo_id;
	}
	public LocalDateTime getTrading_date() {
		return trading_date;
	}
	public void setTrading_date(LocalDateTime trading_date) {
		this.trading_date = trading_date;
	}
	
	
}
