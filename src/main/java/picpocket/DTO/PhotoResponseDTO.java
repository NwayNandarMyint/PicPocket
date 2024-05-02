package picpocket.DTO;

public class PhotoResponseDTO {
	private int id;
	private String title;
	private String description;
	private Double price;
	private String date;
	private String base64image;
	private int album_id;
	private int creator;
	private int owner_id;
	private String creatorname;
	private boolean sold;
	private boolean ban;
	private int report_count;
	public int getReport_count() {
		return report_count;
	}


	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}


	public PhotoResponseDTO() {
		
	}
	

	public boolean isBan() {
		return ban;
	}


	public void setBan(boolean ban) {
		this.ban = ban;
	}


	public boolean isSold() {
		return sold;
	}


	public void setSold(boolean sold) {
		this.sold = sold;
	}


	public String getBase64image() {
		return base64image;
	}


	public void setBase64image(String base64image) {
		this.base64image = base64image;
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
		this.date =date;
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

	public void setCreator(String string) {
		// TODO Auto-generated method stub
		
	}
	
}
