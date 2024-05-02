package picpocket.DAO;

import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Service;
import picpocket.DTO.UserRequestDTO;
import picpocket.DTO.UserResponseDTO;


@Service("UserDAO")
public class UserDAO {
	public static Connection con = null;
	static {
		try {
			con = MyConnection.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public int addUser(UserRequestDTO dto) {
	    int result = 0;
	    String sql = "Insert into user (name, email, password, phone_no, address,active,imagepath) " + "values(?,?,?, ?, ?, ?,?)" ;
	    String sqlw="INSERT INTO wallet(totalamount,user_id) VALUES(?,?)";
	    String sqls="SELECT id FROM user WHERE email=?";
	    try {
	      con.setAutoCommit(false);
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setString(1, dto.getName());
	      ps.setString(2, dto.getEmail());
	      ps.setString(3, dto.getPassword());
	      ps.setString(4, dto.getPhone_no());
	      ps.setString(5, dto.getAddress());
	      ps.setBoolean(6, dto.isActive());
	      Blob blob = new javax.sql.rowset.serial.SerialBlob(dto.getImagepath());
	            ps.setBlob(7, blob);
	      result = ps.executeUpdate();
	      
	      ps = con.prepareStatement(sqls);
	      ps.setString(1, dto.getEmail());
	      ResultSet rs = ps.executeQuery();
	      int user_id=0;
	      while (rs.next()) {
	        user_id=rs.getInt("id");
	      }
	      System.out.println(user_id);
	      
	      ps = con.prepareStatement(sqlw);
	            ps.setDouble(1, 0.0);
	            ps.setInt(2, user_id);
	            result = ps.executeUpdate();    
	            
	      System.out.println("Result  :"+result);
	      con.commit();
	      ps.close();
	    } catch (SQLException e) {
	      System.out.print(e);
	      try {
	        con.rollback();
	      } catch (SQLException e1) {
	        // TODO Auto-generated catch block
	        e1.printStackTrace();
	      }
	    }
	    
	    return result;
	  }
	public UserResponseDTO checkingUserLogin(String email) {
		String sql = "SELECT * FROM user WHERE email = ? and active= 0";
		UserResponseDTO res = new UserResponseDTO();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res.setPassword(rs.getString("password"));
				res.setId(rs.getInt("id"));
				res.setEmail(rs.getString("email"));
				res.setName(rs.getString("name"));
				res.setPhone_no(rs.getString("phone_no"));
				res.setAddress(rs.getString("address"));
			}

		} catch (SQLException e) {
			System.out.println("select company error" + e);
		}
		return res;
	}
	 
	public void updatePassword(UserRequestDTO dto) {
		String sql="update user set password=? where id=? ";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1,dto.getNewpassword());
			ps.setInt(2,dto.getId());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("database error"+e.getMessage()); 
		}
	} 	
	public ArrayList<UserResponseDTO> selectAllUsers() throws UnsupportedEncodingException {
		ArrayList<UserResponseDTO> users = new ArrayList<UserResponseDTO>();
		String sql = "select * from user ";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserResponseDTO userRes = new UserResponseDTO();
				userRes.setId(rs.getInt("id"));
				userRes.setName(rs.getString("name"));
				userRes.setEmail(rs.getString("email"));
				userRes.setPassword(rs.getString("password"));
				userRes.setPhone_no(rs.getString("phone_no"));
				userRes.setAddress(rs.getString("address"));
				userRes.setActive(rs.getBoolean("active"));
				
				
				
				users.add(userRes);
				
			}

		} catch(SQLException e) {
			System.out.println("select all error: "+e);
		}
		return users;
		
	}
	
	public UserResponseDTO  selectOne(UserRequestDTO dto) throws UnsupportedEncodingException {
		UserResponseDTO res=new UserResponseDTO();
		String sql="select * from user where id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1,dto.getId());
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				res.setId(rs.getInt("id"));
				res.setEmail(rs.getString("email"));
				res.setName(rs.getString("name"));
				res.setPassword(rs.getString("password"));
				res.setPhone_no(rs.getString("phone_no"));
				res.setAddress(rs.getString("address"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
		
	}
	
	 public void updateData(UserRequestDTO dto) {
			String sql="update user set name=?,email=?,phone_no=?,address=? where id=? ";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				
				ps.setString(1,dto.getName());
				ps.setString(2,dto.getEmail());
				ps.setString(3,dto.getPhone_no());
				ps.setString(4,dto.getAddress());
				ps.setInt(5,dto.getId());
				
				ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e.getMessage()); 
			}
		} 	
	 
		
		public int addingPhoto(UserRequestDTO dto) {

			int result = 0;
			String sql = "update user set imagepath=? where id=? ";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				Blob blob = new javax.sql.rowset.serial.SerialBlob(dto.getImagepath());
	            ps.setBlob(1, blob);
				ps.setInt(2, dto.getId());
				result = ps.executeUpdate();

				System.out.println("result  :" + result);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			return result;
		}
		public UserResponseDTO profilePhoto(int id) throws UnsupportedEncodingException {
			UserResponseDTO photos = new UserResponseDTO();
	    	
	    	String sql = "SELECT imagepath FROM user WHERE id=?";
	        try {
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	            	 Blob blob = (Blob) rs.getBlob("imagepath");
	            	 byte [] bytes  =  blob.getBytes(1,(int) blob.length());
	            	 byte[] encodeBase64 = Base64.encodeBase64(bytes);
	            	
	            	 photos.setBase64image(new String(encodeBase64, "UTF-8"));
	            	
	            	 
	            }
	        } catch (SQLException e) {
	            System.out.println("select all error: " + e);
	        }
	        System.out.println("Image  :"  +photos);
	    	return photos;
	    }
	
		public UserRequestDTO  verifyEmail(String userEmail,String userPhone) throws UnsupportedEncodingException {
		    UserRequestDTO res=new UserRequestDTO();
		    String sql="select * from user where email=? and phone_no=?";
		    try {
		      PreparedStatement ps=con.prepareStatement(sql);
		      ps.setString(1,userEmail);
		      ps.setString(2,userPhone);
		      ResultSet rs=ps.executeQuery();
		      while (rs.next()) {
		        res.setId(rs.getInt("id"));
		        res.setEmail(rs.getString("email"));
		        res.setName(rs.getString("name"));
		        res.setPassword(rs.getString("password"));
		        res.setPhone_no(rs.getString("phone_no"));
		        res.setAddress(rs.getString("address"));
		        
		        
		      }
		    } catch (SQLException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    }
		    return res;
		    
		  }
	
	public boolean isEmailExist(String email) throws UnsupportedEncodingException {
		List<UserResponseDTO> list =new UserDAO().selectAllUsers();
		if(list != null) {
			for(UserResponseDTO user: list) {
				if(user.getEmail().equals(email)) {
					return true;
				}System.out.println(user.getEmail()+"-"+email);
			}
		}
		return false;
		
	}

}