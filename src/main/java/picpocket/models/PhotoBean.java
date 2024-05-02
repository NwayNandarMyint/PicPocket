package picpocket.models;

import org.springframework.web.multipart.MultipartFile;

public class PhotoBean {
	private int id;
	private String title;
	private String description;
	private Double price;
	private String date;
	private int album_id;
	private int creator;
	private int owner_id;
	private String creatorname;
	private int report_count;
	private boolean sold;
	private boolean ban;
private MultipartFile imagepath;

	

public int getReport_count() {
	return report_count;
}


public void setReport_count(int report_count) {
	this.report_count = report_count;
}
	
	public boolean isBan() {
	return ban;
}


public void setBan(boolean ban) {
	this.ban = ban;
}


	public PhotoBean() {}
	

	public boolean isSold() {
		return sold;
	}


	public void setSold(boolean sold) {
		this.sold = sold;
	}


	public MultipartFile getImagepath() {
		return imagepath;
	}

	public void setImagepath(MultipartFile imagepath) {
		this.imagepath = imagepath;
	}


	public String getCreatorname() {
		return creatorname;
	}

	public void setCreatorname(String creatorname) {
		this.creatorname = creatorname;
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
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public int getAlbum_id() {
		return album_id;
	}
	public void setAlbum_id(int album_id) {
		this.album_id = album_id;
	}
	
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public int getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(int owner_id) {
		this.owner_id = owner_id;
	}
	


}

