package picpocket.models;


import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;


public class UserBean {
	private int id;
	
	@NotEmpty(message="Name is required")
	private String name;
	
	@Email
	@NotEmpty(message="Email is required")
	private String email; 
	
	
	@Size(min = 6,message="Password must be greater than or 6 !!!")
	private String password;
	
	@NotEmpty(message="Confarm Password is required!!!")
	private String cfpassword; 
	
	@NotEmpty(message="Phone number is required!!!")
	private String phone_no;
	
	@NotEmpty(message="Address is required")
	private String address; 
	
	private MultipartFile imagepath;
	
	private String newpassword;
	
	
	

	public String getNewpassword() {
		return newpassword;
	}


	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}


	
	public MultipartFile getImagepath() {
		return imagepath;
	}


	public void setImagepath(MultipartFile imagepath) {
		this.imagepath = imagepath;
	}


	private boolean active;
	
	public  UserBean() {
	
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
