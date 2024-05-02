package picpocket.DAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import picpocket.DTO.UserRequestDTO;
import picpocket.DTO.UserResponseDTO;
import picpocket.models.UserBean;

public class UserMapper {
	public UserRequestDTO mapuserToRequestDTO(UserBean user) throws IOException {
		UserRequestDTO dto=new UserRequestDTO();
		dto.setId(user.getId());
		dto.setName(user.getName());
		dto.setEmail(user.getEmail());
		dto.setPassword(user.getPassword());
		dto.setCfpassword(user.getCfpassword());
		dto.setPhone_no(user.getPhone_no());
		dto.setAddress(user.getAddress());
		dto.setActive(user.isActive());
		
		return dto;
	}	
	public UserBean mapDTOToUser(UserResponseDTO dto) {
		UserBean user=new UserBean();
		user.setId(dto.getId());
		user.setName(dto.getName());
		user.setEmail(dto.getEmail());
		user.setPassword(dto.getPassword());
		user.setCfpassword(dto.getCfpassword());
		user.setPhone_no(dto.getPhone_no());
		user.setAddress(dto.getAddress());
		user.setActive(dto.isActive());
		
		return user;
	}
	public List<UserBean> mapToListUser(List<UserResponseDTO> dtos) {
		List<UserBean> users=new ArrayList<UserBean>();
		for(UserResponseDTO dto:dtos) {
			UserBean user=mapDTOToUser(dto);
			System.out.println("active2 :"+dto.isActive());
			users.add(user);
		}
		return users;
	}
}
