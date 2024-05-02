package picpocket.DAO;

import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.codec.binary.Base64;

import picpocket.DTO.ReportRequestDTO;
import picpocket.DTO.ReportResponseDTO;

public class ReportDAO {
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
	public int addReport(ReportRequestDTO reportDTO) {
		int result=0;
		System.out.println(reportDTO.getPhoto_id());
		String sql="INSERT INTO report(id,description,date,user_id,photo_id) VALUES(?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, reportDTO.getId());
			ps.setString(2, reportDTO.getDescription());
			ps.setString(3, DateCreator());
			ps.setInt(4, reportDTO.getUser_id());
			ps.setInt(5, reportDTO.getPhoto_id());
			result=ps.executeUpdate();
			
		}catch(SQLException e) {
			System.out.println("Insert error"+e);
		}
		return result;
	}
	public List<ReportResponseDTO> getAllReports() throws UnsupportedEncodingException {
		List<ReportResponseDTO> reports=new ArrayList<ReportResponseDTO>();
		String sql="SELECT r.*, p.imagepath FROM report r INNER JOIN photo p ON r.photo_id = p.id";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ReportResponseDTO report=new ReportResponseDTO();
				report.setId(rs.getInt("id"));
				report.setDescription(rs.getString("description"));
				report.setDate(rs.getString("date"));
				report.setUser_id(rs.getInt("user_id"));
				report.setPhoto_id(rs.getInt("photo_id"));
				System.out.println(report.getDescription());
				Blob blob = (Blob) rs.getBlob("imagepath");
				byte[] bytes = blob.getBytes(1, (int) blob.length());
				byte[] encodeBase64 = Base64.encodeBase64(bytes);
				report.setBase64image(new String(encodeBase64, "UTF-8"));
				reports.add(report);
			}
			
		
		}catch(SQLException e) {
			System.out.println("select all error: "+e);
		}
		return reports;
	}public ReportResponseDTO getReportById(int id) {
		ReportResponseDTO report=new  ReportResponseDTO();
		String sql="SELECT * FROM  report WHERE id=?";
		
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				report.setId(rs.getInt("id"));
				report.setDescription(rs.getString("description"));
				report.setDate(rs.getString("date"));
				report.setPhoto_id(rs.getInt("photo_id"));
				report.setUser_id(rs.getInt("user_id"));
			}				
		}catch(SQLException e) {
			System.out.println("select by id error"+e);
		}
		return report;
				
			}
	
		      
		
		
	}
