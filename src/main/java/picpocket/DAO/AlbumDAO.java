package picpocket.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import picpocket.DTO.AlbumRequestDTO;
import picpocket.DTO.AlbumResponseDTO;

public class AlbumDAO {
	public static Connection con=null;
	static {
		con=MyConnection.getConnection();
	}
	public int addAlbum(AlbumRequestDTO dto) {
		int result=0;
		String sql="INSERT INTO album(id,title,description) VALUES(?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, dto.getId());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getDescription());
			result=ps.executeUpdate();			
		}catch(SQLException e) {
			System.out.println("Insert error: "+e);
		}		
		return result;
	}
	public List<AlbumResponseDTO> getAllAlbums() {
		List<AlbumResponseDTO> albums=new ArrayList<AlbumResponseDTO>();
		String sql="SELECT * FROM album";
		try {
			PreparedStatement ps=con.prepareStatement(sql);			
			ResultSet rs=ps.executeQuery();			
			while(rs.next()) {
				AlbumResponseDTO album=new AlbumResponseDTO();
				album.setId(rs.getInt("id"));
				album.setTitle(rs.getString("title"));
				album.setDescription(rs.getString("Description"));
				albums.add(album);
			}				
		}catch(SQLException e) {
			System.out.println("select all error: "+e);
		}
		return albums;
	}public AlbumResponseDTO getAlbumById(int id) {
		AlbumResponseDTO album = new AlbumResponseDTO();
		String sql = "SELECT * FROM album WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				album.setId(rs.getInt("id"));
				album.setTitle(rs.getString("title"));
				album.setDescription(rs.getString("description"));
				
			}
		} catch (SQLException e) {
			System.out.println("select author by id error" + e);
		}
		return album;
	}public int editAlbum(AlbumRequestDTO albumDTO) {
		int result = 0;
		String sql = "UPDATE album SET title=?,description=? WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, albumDTO.getTitle());
			ps.setString(2, albumDTO.getDescription());
			ps.setInt(3, albumDTO.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Author Update error: " + e);
		}
		return result;
	}public String getAlbumTitleById(int id) {
		String title="";
		String sql = "SELECT title FROM album WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {					
				title=rs.getString("title");					
			}
		} catch (SQLException e) {
			System.out.println("select album by id error" + e);
		}
		return title;
	}

}


