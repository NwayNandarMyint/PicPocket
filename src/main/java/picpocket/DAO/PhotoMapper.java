package picpocket.DAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import picpocket.DTO.PhotoRequestDTO;
import picpocket.DTO.PhotoResponseDTO;
import picpocket.models.PhotoBean;

public class PhotoMapper {
	
	public PhotoRequestDTO mapToRequestDTO(PhotoBean photo) throws IOException {
		PhotoRequestDTO dto=new PhotoRequestDTO();
		dto.setId(photo.getId());
		dto.setTitle(photo.getTitle());
		dto.setDescription(photo.getDescription());
		dto.setPrice(photo.getPrice());
		dto.setDate(photo.getDate());
		dto.setAlbum_id(photo.getAlbum_id());
		dto.setCreator(photo.getCreator());
		dto.setOwner_id(photo.getOwner_id());
		dto.setReport_count(photo.getReport_count());
		
		return dto;
	}
	
	public PhotoBean mapToBean(PhotoResponseDTO dto) {
		
		PhotoBean photo=new PhotoBean();
		photo.setId(dto.getId());
		photo.setTitle(dto.getTitle());
		photo.setDescription(dto.getDescription());
		photo.setPrice(dto.getPrice());
		photo.setDate(dto.getDate());
		photo.setAlbum_id(dto.getAlbum_id());
		photo.setCreator(dto.getCreator());
		photo.setOwner_id(dto.getOwner_id());
		photo.setReport_count(dto.getReport_count());
		photo.setCreatorname(dto.getCreatorname());
		
		
		return photo;
}
	public List<PhotoBean> mapToListBean(List<PhotoResponseDTO> dtos) {
		List<PhotoBean> photos=new ArrayList<PhotoBean>();
		for(PhotoResponseDTO dto:dtos) {
			PhotoBean photo=mapToBean(dto);
			photos.add(photo);
			
		}
		return photos;
	}
	
}


