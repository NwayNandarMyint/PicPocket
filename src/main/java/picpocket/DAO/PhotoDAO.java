package picpocket.DAO;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.tomcat.util.codec.binary.Base64;
import picpocket.DTO.PhotoRequestDTO;
import picpocket.DTO.PhotoResponseDTO;
import picpocket.DTO.PhotoTradingDTO;
import picpocket.DTO.WalletExchangeResponseDTO;

public class PhotoDAO {
	public static Connection con=null;
	static {
		con=MyConnection.getConnection();
	}
	private String DateCreator() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		   LocalDateTime now = LocalDateTime.now();
		   String createddate =dtf.format(now);
		   System.out.println(createddate);
		   return createddate;
	}
	public PhotoResponseDTO forBuyPostSold(int id) throws UnsupportedEncodingException {
	    
	     String sql = "SELECT p.*, u.name AS creatorname " +
	               "FROM photo p " +
	               "JOIN user u ON p.creator = u.id " +
	               "WHERE p.id = ? AND p.sold = 1 ";
	     PhotoResponseDTO photo = new PhotoResponseDTO();
	      try {
	          PreparedStatement ps = con.prepareStatement(sql);
	          ps.setInt(1,  id);
	          ResultSet rs = ps.executeQuery();
	         
	          while (rs.next()) {
	            
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
	             photo.setOwner_id(rs.getInt("owner_id"));
	             photo.setBan(rs.getBoolean("ban"));
	             photo.setSold(rs.getBoolean("sold"));
	             
	          
	          }
	         
	      } catch (SQLException e) {
	          System.out.println("select all error: " + e);
	      }
	      System.out.println("Image  :"  +photo);
	    return photo;
	      
	  }
	
	public List<PhotoTradingDTO>hasNotiFromPhoto(int userid) throws UnsupportedEncodingException {
	    List<PhotoTradingDTO> photos = new ArrayList<PhotoTradingDTO>();
	      
	     String sql = "select * from photo_trading_log where creator=? and hasNoti = 0"; 
	    

	        try {
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setInt(1, userid);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	              PhotoTradingDTO photo = new PhotoTradingDTO();
	              
	              photos.add(photo);
	              
	              
	            }
	        } catch (SQLException e) {
	            System.out.println("select all error: " + e);
	        }
	        System.out.println("Image  :"  +photos);
	      return photos;
	    }
	
	public List<WalletExchangeResponseDTO> hasNotiForWallet(int walletId) {
        List<WalletExchangeResponseDTO> wallet = new ArrayList<>();
        String sql = "SELECT * FROM walletexchange WHERE wallet_id = ? AND hasNoti=0 ";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, walletId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    WalletExchangeResponseDTO userRes = new WalletExchangeResponseDTO();
                    
                    wallet.add(userRes);
                 
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error selecting users by wallet id.", e);
        }
        return wallet;
    }
	
	public int addPhoto(PhotoRequestDTO dto) {
		int result=0;
		String sql = "INSERT INTO photo(title,description,date,price,imagepath,creator,album_id,owner_id,sold,ban) VALUES (?,?,?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			Blob blob = new javax.sql.rowset.serial.SerialBlob(dto.getImagepath());
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getDescription());
			ps.setString(3, DateCreator());
			ps.setDouble(4, dto.getPrice());
			ps.setBlob(5, blob);
			ps.setInt(6, dto.getCreator());
			ps.setInt(7, dto.getAlbum_id());
			ps.setInt(8, dto.getOwner_id());
			ps.setBoolean(9, dto.isSold());
			ps.setBoolean(10, dto.isBan());
			result=ps.executeUpdate();
			System.out.println("result  :  "+result);
		} catch (SQLException e) {
			System.out.println("Database error 123" + e.getMessage());
		}
		return result;
	}
	
	public boolean updatePhotoOwner(int photoId, int newOwnerId) {
	    try {
	    	con.setAutoCommit(false);
	        String updateSql = "UPDATE photo SET owner_id = ?  WHERE id = ?";
	        
	        PreparedStatement updatePs = con.prepareStatement(updateSql);
	        updatePs.setInt(1, newOwnerId);
	        updatePs.setInt(2, photoId);

	        int updateResult = updatePs.executeUpdate();
	        con.commit();
	        return updateResult > 0;
	    } catch (SQLException e) {
	    	try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        System.out.println("Database error: " + e.getMessage());
	        return false;
	    }
	}

	public PhotoResponseDTO forBuyPost(int id) throws UnsupportedEncodingException {
	    
	    String sql = "SELECT p.*, u.name AS creatorname, p.owner_id AS owner_id \r\n"
	                + "FROM photo p\r\n"
	                + "JOIN user u ON p.creator = u.id\r\n"
	                + "WHERE p.id = ? AND p.sold = 0";
	      PhotoResponseDTO photo = new PhotoResponseDTO();
	       try {
	           PreparedStatement ps = con.prepareStatement(sql);
	           ps.setInt(1,  id);
	           ResultSet rs = ps.executeQuery();
	          
	           while (rs.next()) {
	             
	              Blob blob = (Blob) rs.getBlob("imagepath");
	              byte [] bytes  =  blob.getBytes(1,(int) blob.length());
	              byte[] watermarkedBytes = addWatermark(bytes);
			        byte[] encodeBase64 = Base64.encodeBase64(watermarkedBytes);
	             
	              photo.setBase64image(new String(encodeBase64, "UTF-8"));
	              photo.setId(rs.getInt("id"));
	              photo.setTitle(rs.getString("title"));
	              photo.setDescription(rs.getString("description"));
	              photo.setDate(rs.getString("date"));
	              photo.setPrice(rs.getDouble("price"));
	              photo.setCreatorname(rs.getString("creatorname"));
	              photo.setOwner_id(rs.getInt("owner_id"));
	              photo.setCreator(rs.getInt("creator"));
	              photo.setBan(rs.getBoolean("ban"));
	              photo.setSold(rs.getBoolean("sold"));
	              
	           System.out.println("ownername"+photo.getOwner_id() );
	           }
	          
	       } catch (SQLException e) {
	           System.out.println("select all error: " + e);
	       }
	       System.out.println("Image  :"  +photo);
	     return photo;
	       
	   }
	public PhotoResponseDTO forBuyPostForBack(int id) throws UnsupportedEncodingException {
		
		 String sql = "SELECT p.*, u.name AS creatorname " +
               "FROM photo p " +
               "JOIN user u ON p.creator = u.id " +
               "WHERE u.id = ? AND p.sold = 0 ";
 		PhotoResponseDTO photo = new PhotoResponseDTO();
      try {
          PreparedStatement ps = con.prepareStatement(sql);
          ps.setInt(1,  id);
          ResultSet rs = ps.executeQuery();
         
          while (rs.next()) {
          	
          	 Blob blob = (Blob) rs.getBlob("imagepath");
          	 byte [] bytes  =  blob.getBytes(1,(int) blob.length());
          	 byte[] watermarkedBytes = addWatermark(bytes);
		     byte[] encodeBase64 = Base64.encodeBase64(watermarkedBytes);
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
          	 
          
          }
         
      } catch (SQLException e) {
          System.out.println("select all error: " + e);
      }
      System.out.println("Image  :"  +photo);
  	return photo;
      
  }
	
	public List<PhotoResponseDTO>allPosts() throws UnsupportedEncodingException {
		List<PhotoResponseDTO> photos = new ArrayList<PhotoResponseDTO>();
		/*
		 * String sql = "SELECT p.*, u.name, COUNT(r.photo_id) AS report_count " +
		 * "FROM photo AS p " + "JOIN user AS u ON p.creator = u.id AND u.active = '0' "
		 * + "LEFT JOIN report AS r ON p.id = r.photo_id " +
		 * "GROUP BY p.id Order by date desc";
		 */
		String sql = "SELECT p.*, u.name, COUNT(r.photo_id) AS report_count " +
	             "FROM photo AS p " +
	             "JOIN user AS u ON p.creator = u.id AND u.active = '0' " +
	             "LEFT JOIN report AS r ON p.id = r.photo_id " + 
	             "WHERE u.active = '0' AND p.sold = 0 AND p.ban = 0 " +
	             "GROUP BY p.id " +
	             "ORDER BY date DESC";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				PhotoResponseDTO photo = new PhotoResponseDTO();
				Blob blob = (Blob) rs.getBlob("imagepath");
		        byte[] bytes = blob.getBytes(1, (int) blob.length());
		        byte[] watermarkedBytes = addWatermark(bytes);
		        byte[] encodeBase64 = Base64.encodeBase64(watermarkedBytes);
				 photo.setBase64image(new String(encodeBase64, "UTF-8"));
				 photo.setId(rs.getInt("id"));
            	 photo.setTitle(rs.getString("title"));
            	 photo.setDescription(rs.getString("description"));
            	 photo.setDate(rs.getString("date"));
            	 photo.setPrice(rs.getDouble("price"));
            	 photo.setCreatorname(rs.getString("name"));
            	 photo.setReport_count(rs.getInt("report_count"));

            	 photos.add(photo);
			}
		} catch (SQLException e) {
			System.out.println("Database error 123" + e.getMessage());
		}

		return photos;
	}
	
	public List<PhotoResponseDTO>postByCreator(int creator) throws UnsupportedEncodingException {
		List<PhotoResponseDTO> photos = new ArrayList<PhotoResponseDTO>();
    	
		 String sql = "select * from photo where creator=? and ban= 0 and sold = 0"; 
		

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, creator);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
            	PhotoResponseDTO photo = new PhotoResponseDTO();
            	 Blob blob = (Blob) rs.getBlob("imagepath");
            	 byte [] bytes  =  blob.getBytes(1,(int) blob.length());
            	 byte[] watermarkedBytes = addWatermark(bytes);
  		        byte[] encodeBase64 = Base64.encodeBase64(watermarkedBytes);
            
            	 photo.setBase64image(new String(encodeBase64, "UTF-8"));
            	photo.setId(rs.getInt("id"));
            	 photo.setTitle(rs.getString("title"));
            	 photo.setDescription(rs.getString("description"));
            	 photo.setDate(rs.getString("date"));
            	 photo.setPrice(rs.getDouble("price"));
            	 photo.setCreator(rs.getInt("creator"));
            	photos.add(photo);
            	
            	
            }
        } catch (SQLException e) {
            System.out.println("select all error: " + e);
        }
        System.out.println("Image  :"  +photos);
    	return photos;
    }
	
	private byte[]addWatermark(byte[] originalImageBytes){
	    try {
	     System.out.println(originalImageBytes);
	      BufferedImage originalImage = ImageIO.read(new ByteArrayInputStream(originalImageBytes));
	      Graphics2D graphics = originalImage.createGraphics();
	          graphics.setColor(Color.RED);
	          int fontSize = originalImage.getWidth() * 10 / 100; // 5% of the image width
	          graphics.setFont(new Font("Arial", Font.BOLD, fontSize));
	          
	          // Calculate position based on a percentage of the image width and height
	          int x = originalImage.getWidth() * 20 / 100; // 50% of the image width
	          int y = originalImage.getHeight() * 50 / 100; // 80% of the image height
	          
	          graphics.drawString("PicPocket", x, y);
	          ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	          ImageIO.write(originalImage, "png", outputStream);
	          return outputStream.toByteArray();
	    } catch (IOException e) {
	      
	      e.printStackTrace();
	    }
	    return originalImageBytes;}
	
	public List<PhotoResponseDTO>postByOwner(int owner_id) throws UnsupportedEncodingException {
		List<PhotoResponseDTO> photos = new ArrayList<PhotoResponseDTO>();
    	
		 String sql = "select * from photo where owner_id=? and sold = 1"; 
		

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, owner_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
            	PhotoResponseDTO photo = new PhotoResponseDTO();
            	 Blob blob = (Blob) rs.getBlob("imagepath");
            	 byte [] bytes  =  blob.getBytes(1,(int) blob.length());
					/* byte[] watermarkedBytes = addWatermark(bytes); */
 		        byte[] encodeBase64 = Base64.encodeBase64(bytes);
            	 photo.setBase64image(new String(encodeBase64, "UTF-8"));
            	 
            	 photo.setId(rs.getInt("id"));
            	 photo.setTitle(rs.getString("title"));
            	 photo.setDescription(rs.getString("description"));
            	 photo.setDate(rs.getString("date"));
            	 photo.setPrice(rs.getDouble("price"));
            	photos.add(photo);
            	
            	
            }
        } catch (SQLException e) {
            System.out.println("select all error: " + e);
        }
        System.out.println("Image  :"  +photos);
    	return photos;
    }
	
	
	public PhotoResponseDTO viewPhoto(int id) throws UnsupportedEncodingException {
		
		 String sql = "SELECT imagepath FROM photo where id=?"; 
			/*
			 * String sql = "SELECT p.*, u.name\r\n" + "		FROM photo\r\n" +
			 * "		RIGHT JOIN user\r\n" + "		ON photo.creator = user.id\r\n" +
			 * "		PHOTO BY photo.id;  ";
			 */
  		PhotoResponseDTO photo = new PhotoResponseDTO();
       try {
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setInt(1,  id);
           ResultSet rs = ps.executeQuery();
          
           while (rs.next()) {
           	
           	 Blob blob = (Blob) rs.getBlob("imagepath");
           	 byte [] bytes  =  blob.getBytes(1,(int) blob.length());
           	byte[] watermarkedBytes = addWatermark(bytes);
		        byte[] encodeBase64 = Base64.encodeBase64(watermarkedBytes);
           	
           	 photo.setBase64image(new String(encodeBase64, "UTF-8"));
           	 
           }
          
       } catch (SQLException e) {
           System.out.println("select all error: " + e);
       }
       System.out.println("Image  :"  +photo);
   	return photo;
       
   }
	
	public String getPhotoTitleById(int id) {
	    String title="";
	    String sql = "SELECT title FROM photo WHERE id=?";
	    try {
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setInt(1, id);
	      ResultSet rs = ps.executeQuery();
	  
	      while (rs.next()) {          
	        title=rs.getString("title");          
	      }
	    } catch (SQLException e) {
	      System.out.println("select photo by id error" + e);
	    }
	    return title;
	  }
	public PhotoResponseDTO forDisplayPost(int id) throws UnsupportedEncodingException {

		  String sql = "SELECT * FROM photo where id=?";
		  PhotoResponseDTO photo = new PhotoResponseDTO();
		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setInt(1,  id);
		        ResultSet rs = ps.executeQuery();
		       
		        while (rs.next()) {
		          
		           Blob blob = (Blob) rs.getBlob("imagepath");
		           byte [] bytes  =  blob.getBytes(1,(int) blob.length());
		           byte[] encodeBase64 = Base64.encodeBase64(bytes);
		          
		           photo.setBase64image(new String(encodeBase64, "UTF-8"));
		           photo.setTitle(rs.getString("title"));
		           photo.setDescription(rs.getString("description"));
		           photo.setDate(rs.getString("date"));
		           photo.setPrice(rs.getDouble("price"));
		           photo.setReport_count(rs.getInt("report_count"));
		        }
		       
		    } catch (SQLException e) {
		        System.out.println("select all error: " + e);
		    }
		    System.out.println("Image  :"  +photo);
		  return photo;
		    
			}
	public List<PhotoTradingDTO> photoTradingLogs(int creator) throws UnsupportedEncodingException {
	      List<PhotoTradingDTO> photos = new ArrayList<>();
	      String sql = "SELECT p.*, u.name\r\n"
	              + "FROM photo_trading_log AS p\r\n"
	              + "JOIN user AS u ON p.buyer = u.id\r\n"
	              + "WHERE p.creator = ?;";

	      try (PreparedStatement ps = con.prepareStatement(sql)) {
	          ps.setInt(1, creator); // Set the creator value for the ? placeholder
	          ResultSet rs = ps.executeQuery();

	          while (rs.next()) {
	              PhotoTradingDTO photo = new PhotoTradingDTO();
	              photo.setId(rs.getInt("id"));
	              photo.setTitle(rs.getString("title"));
	              photo.setDescription(rs.getString("description"));
	              Timestamp date = rs.getTimestamp("trading_date");
	              photo.setTrading_date(date.toLocalDateTime());
	              photo.setBuyer_name(rs.getString("name"));
	              photo.setBuyer(rs.getInt("buyer"));
	              photo.setHasNoti(rs.getBoolean("hasNoti"));
	              photos.add(photo);
	          }

	          return photos;
	      } catch (SQLException e) {
	          System.out.println("Database error 123" + e.getMessage());
	          throw new RuntimeException("Failed to retrieve photo trading logs", e); // Rethrow the exception for proper handling
	      }
	  }
	
}		
		
		
	


