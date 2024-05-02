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

import picpocket.DTO.AdminResponseDTO;
import picpocket.DTO.PhotoResponseDTO;
import picpocket.DTO.UserResponseDTO;

public class AdminDAO {

    private static final Connection con;

    static {
        try {
            con = MyConnection.getConnection();
        } catch (Exception e) {
            throw new RuntimeException("Failed to initialize database connection.", e);
        }
    }

    public List<AdminResponseDTO> selectAllAdmins() {
        List<AdminResponseDTO> admins = new ArrayList<>();
        String sql = "SELECT * FROM admin";
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                AdminResponseDTO adminRes = new AdminResponseDTO();
                adminRes.setName(rs.getString("name"));
                adminRes.setEmail(rs.getString("email"));
                adminRes.setPassword(rs.getString("password"));
                admins.add(adminRes);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error selecting all admins.", e);
        }
        return admins;
    }

    public List<UserResponseDTO> selectAllUsers() throws UnsupportedEncodingException {
        List<UserResponseDTO> users = new ArrayList<>();
        String sql = "SELECT * FROM user";
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UserResponseDTO userRes = new UserResponseDTO();
                userRes.setId(rs.getInt("id"));
                userRes.setName(rs.getString("name"));
                userRes.setEmail(rs.getString("email"));
                userRes.setPassword(rs.getString("password"));
                userRes.setPhone_no(rs.getString("phone_no"));
                userRes.setAddress(rs.getString("address"));
                userRes.setActive(rs.getBoolean("active"));
                
                Blob blob = (Blob) rs.getBlob("imagepath");
                byte[] bytes = blob.getBytes(1, (int) blob.length());
                byte[] encodeBase64 = Base64.encodeBase64(bytes);
                userRes.setBase64image(new String(encodeBase64, "UTF-8"));
                
               
                users.add(userRes);
                
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error selecting all users.", e);
        }
        return users;
    }
    

    public List<PhotoResponseDTO> selectAllBanPhotos() throws UnsupportedEncodingException {
        List<PhotoResponseDTO> photos = new ArrayList<>();
        String sql = "SELECT p.*, u.name AS creatorname " +
                "FROM photo p " +
                "JOIN user u ON p.creator = u.id " +
                "WHERE p.ban = 1";
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
               PhotoResponseDTO photo = new PhotoResponseDTO();
               Blob blob = (Blob) rs.getBlob("imagepath");
             	 byte [] bytes  =  blob.getBytes(1,(int) blob.length());
             	 byte[] encodeBase64 = Base64.encodeBase64(bytes);
             	
             	 photo.setBase64image(new String(encodeBase64, "UTF-8"));
             	 photo.setId(rs.getInt("id"));
             	 photo.setTitle(rs.getString("title"));
             	 photo.setDescription(rs.getString("description"));
             	 photo.setDate(rs.getString("date"));
             	 photo.setPrice(rs.getDouble("price"));
             	 photo.setCreatorname(rs.getString("creatorname"));
             	 photo.setCreator(rs.getInt("creator"));
             	 photo.setBan(rs.getBoolean("ban"));
             	 photo.setSold(rs.getBoolean("sold"));
             	 
               
                photos.add(photo);
                
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error selecting all users.", e);
        }
        return photos;
    }
    
    public int disableUser(int userId) {
		int result=0;
		String sql="UPDATE user SET active=?" + " WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);	
			ps.setBoolean(1, false);
			ps.setInt(2, userId);

			result=ps.executeUpdate();			
		}catch(SQLException e) {
			System.out.println("Update error: "+e);
		}		
		return result;
	}
	
	public int enableUser(int userId) {
		int result=0;
		String sql="UPDATE user SET active=?" + " WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);	
			ps.setBoolean(1, true);
			ps.setInt(2, userId);

			result=ps.executeUpdate();			
		}catch(SQLException e) {
			System.out.println("Update error: "+e);
		}		
		return result;
	}
	 public int unbanPhoto(int Id) {
			int result=0;
			String sql="UPDATE photo SET ban=?" + " WHERE id=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);	
				ps.setBoolean(1, false);
				ps.setInt(2, Id);

				result=ps.executeUpdate();			
			}catch(SQLException e) {
				System.out.println("Update error: "+e);
			}		
			return result;
		}
		
		public int banPhoto(int Id) {
			int result=0;
			String sql="UPDATE photo SET ban=?" + " WHERE id=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);	
				ps.setBoolean(1, true);
				ps.setInt(2, Id);

				result=ps.executeUpdate();			
			}catch(SQLException e) {
				System.out.println("Update error: "+e);
			}		
			return result;
		}
		
		public AdminResponseDTO checkingAdminLogin(String email) {
	        String sql = "SELECT * FROM admin WHERE email = ?";
	        AdminResponseDTO res = new AdminResponseDTO(); 
	        try {
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, email);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                res.setPassword(rs.getString("password"));
	                res.setId(rs.getInt("id"));
	                res.setEmail(rs.getString("email"));
	                
	            }
	        } catch (SQLException e) {
	            System.out.println("select admin error" + e);
	        }
	        return res;
	    }
	
	
    public AdminResponseDTO adminValid() {
        AdminResponseDTO admin = new AdminResponseDTO();
        String sql = "SELECT email, password FROM admin WHERE id=?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, 1);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    admin.setEmail(rs.getString("email"));
                    admin.setPassword(rs.getString("password"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error validating admin.", e);
        }
        return admin;
    }
}
