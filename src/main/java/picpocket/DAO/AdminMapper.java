package picpocket.DAO;

import java.util.ArrayList;
import java.util.List;

import picpocket.DTO.AdminRequestDTO;
import picpocket.DTO.AdminResponseDTO;
import picpocket.models.AdminBean;



public class AdminMapper {

	public AdminRequestDTO mapAdminToRequestDTO(AdminBean admin) {
		AdminRequestDTO dto=new AdminRequestDTO();
		
		dto.setName(admin.getName());
		dto.setEmail(admin.getEmail());
		dto.setPassword(admin.getPassword());
		
		return dto;
	}	
	public AdminBean mapDTOToAdmin(AdminResponseDTO dto) {
		AdminBean admin=new AdminBean();
		
		admin.setName(dto.getName());
		admin.setEmail(dto.getEmail());
		admin.setPassword(dto.getPassword());
		
		return admin;
	}
	public List<AdminBean> mapToListUser(List<AdminResponseDTO> dtos) {
		List<AdminBean> admins=new ArrayList<AdminBean>();
		for(AdminResponseDTO dto:dtos) {
			AdminBean admin=mapDTOToAdmin(dto);
			admins.add(admin);
		}
		return admins;
	}
}
