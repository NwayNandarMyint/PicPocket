package picpocket.DAO;

import java.util.ArrayList;
import java.util.List;
import picpocket.DTO.ReportRequestDTO;
import picpocket.DTO.ReportResponseDTO;
import picpocket.models.ReportBean;

public class ReportMapper {
	public ReportRequestDTO mapToRequestDTO(ReportBean report) {
		ReportRequestDTO dto=new ReportRequestDTO();
		dto.setId(report.getId());
		dto.setDescription(report.getDescription());
		dto.setDate(report.getDate());
		dto.setPhoto_id(report.getPhoto_id());
		dto.setUser_id(report.getUser_id());
		return dto;
	}
	
	public ReportBean mapToBean(ReportResponseDTO dto) {
		PhotoDAO photoDAO=new PhotoDAO();
		ReportBean report=new ReportBean();
		report.setId(dto.getId());;
		report.setDescription(dto.getDescription());;
		report.setDate(dto.getDate());
		report.setPhoto_id(dto.getPhoto_id());
		String photo_title=photoDAO.getPhotoTitleById(dto.getPhoto_id());
		report.setPhoto_title(photo_title);
		report.setBase64image(dto.getBase64image());
		report.setUser_id(dto.getUser_id());
		report.setNumberRow(dto.getNumberRow());
		return report;
}
	public List<ReportBean> mapToListBean(List<ReportResponseDTO> dtos) {
		List<ReportBean> reports=new ArrayList<ReportBean>();
		for(ReportResponseDTO dto:dtos) {
			ReportBean report=mapToBean(dto);
			reports.add(report);
			
		}
		return reports;
	}
	
}