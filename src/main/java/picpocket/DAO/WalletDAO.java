package picpocket.DAO;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import picpocket.DTO.WalletExchangeRequestDTO;
import picpocket.DTO.WalletExchangeResponseDTO;
import picpocket.DTO.WalletResponseDTO;
import picpocket.models.ExchangeType;



public class WalletDAO {
	public static Connection con = null;
	static {
		try {
			con = MyConnection.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private String DateCreator() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd  HH:mm");
		   LocalDateTime now = LocalDateTime.now();
		   String createddate =dtf.format(now);
		   System.out.println(createddate);
		   return createddate;
	}
	
	
	public WalletResponseDTO getWalletById(int user_id) throws UnsupportedEncodingException {
		
		 String sql = "SELECT w.*, u.name, u.email " +
                "FROM wallet w " +
                "JOIN user u ON w.user_id = u.id " +
                "WHERE u.id = ?";
  		WalletResponseDTO wallet = new WalletResponseDTO();
       try {
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setInt(1,  user_id);
           ResultSet rs = ps.executeQuery();
          
           while (rs.next()) {
          	
           	 wallet.setId(rs.getInt("id"));
           	 wallet.setTotalamount(rs.getDouble("totalamount"));
           	 wallet.setName(rs.getString("name"));
           	 wallet.setEmail(rs.getString("email"));
           	 wallet.setUser_id(rs.getInt("user_id"));
           	 
           }
          
       } catch (SQLException e) {
           System.out.println("select all error: " + e);
       }
    
   	return wallet;
       
   }
	

	public WalletResponseDTO getWalletByOwnerId(int Owner_id) throws UnsupportedEncodingException {
		
		 String sql = "SELECT w.*, u.name, u.email " +
                "FROM wallet w " +
                "JOIN user u ON w.user_id = u.id " +
                "WHERE u.id = ?";
  		WalletResponseDTO wallet = new WalletResponseDTO();
       try {
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setInt(1,  Owner_id);
           ResultSet rs = ps.executeQuery();
          
           while (rs.next()) {
          	
           	 wallet.setId(rs.getInt("id"));
           	 wallet.setTotalamount(rs.getDouble("totalamount"));
           	 wallet.setName(rs.getString("name"));
           	 wallet.setEmail(rs.getString("email"));
           	 wallet.setUser_id(rs.getInt("user_id"));
           	 
           }
          
       } catch (SQLException e) {
           System.out.println("select all error: " + e);
       }
    
   	return wallet;
       
   }
	
	
	public int exchangeCoin(WalletExchangeRequestDTO dto) {
	    int result = 0;
	    String sql = "INSERT INTO walletexchange(exchangeType, exchangeDate, amount, wallet_id,hasNoti) VALUES (?,?, ?, ?, ?)";

	    try {
	       
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, dto.getExchangetype().name()); 
	        ps.setString(2, DateCreator());
	        ps.setDouble(3, dto.getAmount());
	        ps.setInt(4, dto.getWallet_id());
	        ps.setBoolean(5, false);
	        
	        result = ps.executeUpdate();
	        System.out.println("DAO wId"+dto.getWallet_id());
	        // Check if the insert was successful
	        if (result > 0) {
	            
	        	updateWallet(dto.getWallet_id(), dto.getAmount(), dto.getExchangetype());
	        }
	    } catch (SQLException e) {
	        System.out.println("Database error: " + e.getMessage());
	    }
	    return result;
	}
	
	public boolean updateWalletAmount(int userId, double amount) {
	      try {
	          String updateSql = "UPDATE wallet SET totalamount = totalamount + ? WHERE user_id = ?";
	          PreparedStatement updatePs = con.prepareStatement(updateSql);
	          updatePs.setDouble(1, amount);
	          updatePs.setInt(2, userId);

	          int updateResult = updatePs.executeUpdate();

	          return updateResult > 0;
	      } catch (SQLException e) {
	          System.out.println("Database error: " + e.getMessage());
	          return false;
	      }
	  }

	public void updateWallet(int walletId, double amount, ExchangeType exchangeType) {
	    try {
	        String updateSql;
	        switch (exchangeType) {
	            case WITHDRAW:
	                updateSql = "UPDATE wallet SET totalamount = totalamount - ? WHERE id = ?";
	                break;
	            case DEPOSIT:
	                updateSql = "UPDATE wallet SET totalamount = totalamount + ? WHERE id = ?";
	                break;
	            default:
	                System.out.println("Invalid exchange type");
	                return;
	        }

	        PreparedStatement updatePs = con.prepareStatement(updateSql);
	        updatePs.setDouble(1, amount);
	        updatePs.setInt(2, walletId);

	        int updateResult = updatePs.executeUpdate();

	        if (updateResult <= 0) {
	            System.out.println("Failed to update totalamount in the wallet table.");
	        }
	    } catch (SQLException e) {
	        System.out.println("Database error: " + e.getMessage());
	    }
	}
	
	public boolean updatePhotoOwnerAndWalletTransaction(int photoId, int buyerId, int creator, double price,String title,String description,double mount) {
	      try {
	          con.setAutoCommit(false);

	          String updatePhotoSql = "UPDATE photo SET owner_id = ? , sold = 1 WHERE id = ?";
	          String deductAmountSql = "UPDATE wallet SET totalamount = totalamount - ? WHERE user_id = ?";
	          String increaseAmountSql = "UPDATE wallet SET totalamount = totalamount + ? WHERE user_id = ?";
	          String photTradingLogsSql="INSERT INTO photo_trading_log(title,description,buyer,trading_date,photo_id,creator,hasNoti) VALUES(?,?,?,?,?,?,?)";
	          try (PreparedStatement updatePhotoPs = con.prepareStatement(updatePhotoSql);
	               PreparedStatement deductAmountPs = con.prepareStatement(deductAmountSql);
	               PreparedStatement increaseAmountPs = con.prepareStatement(increaseAmountSql);
	             PreparedStatement photTradingLogsPs = con.prepareStatement(photTradingLogsSql)) {

	              // Update photo owner
	              updatePhotoPs.setInt(1, buyerId);
	              updatePhotoPs.setInt(2, photoId);
	              int updatePhotoResult = updatePhotoPs.executeUpdate();
	              
	              // Deduct amount from buyer's wallet
	              
	              deductAmountPs.setDouble(1, price);
	              deductAmountPs.setInt(2, buyerId);
	              int deductAmountResult = deductAmountPs.executeUpdate();
	              // Increase amount to seller's wallet
	              increaseAmountPs.setDouble(1, mount);
	              increaseAmountPs.setInt(2, creator);
	              int increaseAmountResult = increaseAmountPs.executeUpdate();

	        photTradingLogsPs.setString(1, title);
	        photTradingLogsPs.setString(2, description);
	        photTradingLogsPs.setInt(3, buyerId);
	        photTradingLogsPs.setString(4, DateCreator());
	        photTradingLogsPs.setInt(5, photoId);
	        photTradingLogsPs.setInt(6, creator);
	        photTradingLogsPs.setBoolean(7, false);
	        int insertPhotoTradingLogResult = photTradingLogsPs.executeUpdate();

	              // Commit the transaction if all updates are successful
	              if (updatePhotoResult > 0 && deductAmountResult > 0 && increaseAmountResult > 0 && insertPhotoTradingLogResult > 0 ) {
	                  con.commit();
	                  return true;
	              } else {
	                  con.rollback();
	                  return false;
	              }
	          }
	      } catch (SQLException e) {
	          try {
	              con.rollback();
	          } catch (SQLException rollbackException) {
	              rollbackException.printStackTrace();
	          }
	          System.out.println("Error updating photo owner and wallet: " + e.getMessage());
	          return false;
	      } finally {
	          try {
	              con.setAutoCommit(true);
	          } catch (SQLException autoCommitException) {
	              autoCommitException.printStackTrace();
	          }
	      }
	  }
	
	
			public List<WalletExchangeResponseDTO> walletTradingByWalletId(int walletId) {
			      List<WalletExchangeResponseDTO> wallet = new ArrayList<>();
			      String sql = "SELECT * FROM walletexchange WHERE wallet_id = ?";
			      try (PreparedStatement ps = con.prepareStatement(sql)) {
			          ps.setInt(1, walletId);
			          try (ResultSet rs = ps.executeQuery()) {
			              while (rs.next()) {
			                  WalletExchangeResponseDTO userRes = new WalletExchangeResponseDTO();
			                  userRes.setId(rs.getInt("id"));
			                  userRes.setWallet_id(rs.getInt("wallet_id"));
			                  userRes.setAmount(rs.getDouble("amount"));
			                  userRes.setExchangetype(ExchangeType.valueOf(rs.getString("exchangetype")));
			                  Timestamp date = rs.getTimestamp("exchangeDate");
			                  userRes.setExchangeDate(date.toLocalDateTime());
			                  userRes.setHasNoti(rs.getBoolean("hasNoti"));
			                  wallet.add(userRes);
			              }
			          }
			      } catch (SQLException e) {
			          throw new RuntimeException("Error selecting users by wallet id.", e);
			      }
			      return wallet;
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
	 
	 public double getTotalAmount(int userId) {
	        String sql = "SELECT totalamount FROM wallet WHERE user_id = ?";
	        
	        try {
	        	PreparedStatement ps = con.prepareStatement(sql);
	        	ps.setInt(1, userId);

	            try (ResultSet resultSet = ps.executeQuery()) {
	                if (resultSet.next()) {
	                    return resultSet.getDouble("totalamount");
	                }
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return 0.0;
	    }



}
