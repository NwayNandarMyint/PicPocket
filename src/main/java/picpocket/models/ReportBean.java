package picpocket.models;

import org.springframework.web.multipart.MultipartFile;

public class ReportBean {
	private int id;
	private String description;
	private String date;
	private int photo_id;
	private String photo_title;
	private int user_id;
	private int numberRow;
	private MultipartFile imagepath;
	private String base64image;

	public String getBase64image() {
		return base64image;
	}
	public void setBase64image(String base64image) {
		this.base64image = base64image;
	}
	public ReportBean () {
		 
	 }
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPhoto_id() {
		return photo_id;
	}
	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}
	
	public String getPhoto_title() {
		return photo_title;
	}
	public void setPhoto_title(String photo_title) {
		this.photo_title = photo_title;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getNumberRow() {
		return numberRow;
	}
	public void setNumberRow(int numberRow) {
		this.numberRow = numberRow;
	}
	public MultipartFile getImagepath() {
		return imagepath;
	}
	public void setImagepath(MultipartFile imagepath) {
		this.imagepath = imagepath;
	}

}