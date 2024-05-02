package picpocket.DTO;

public class UserRequestDTO {
	private int id;
	private String name;
	private String email; 
	private String password; 
	private String cfpassword;
	private String newpassword;
	private String phone_no;
	private String address;
	private byte[] imagepath;
	private boolean active;
	
	public  UserRequestDTO() {
	
	}
	
	
	


	public String getNewpassword() {
		return newpassword;
	}


	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	
	public byte[] getImagepath() {
		return imagepath;
	}

	public void setImagepath(byte[] imagepath) {
		this.imagepath = imagepath;
	}
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCfpassword() {
		return cfpassword;
	}
	public void setCfpassword(String cfpassword) {
		this.cfpassword = cfpassword;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone_no() {
		return phone_no;
	}


	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}
	
	
}
