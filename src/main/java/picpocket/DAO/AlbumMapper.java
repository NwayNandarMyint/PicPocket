package picpocket.DAO;

import java.util.ArrayList;
import java.util.List;

import picpocket.DTO.AlbumRequestDTO;
import picpocket.DTO.AlbumResponseDTO;
import picpocket.models.AlbumBean;
public class AlbumMapper {
	public AlbumRequestDTO mapToRequestDTO(AlbumBean album) {
		AlbumRequestDTO dto=new AlbumRequestDTO();
		dto.setId(album.getId());
		dto.setTitle(album.getTitle());
		dto.setDescription(album.getDescription());
		return dto;
	}	
	public AlbumBean mapToBean(AlbumResponseDTO dto) {
		AlbumBean album=new AlbumBean();
		album.setId(dto.getId());
		album.setTitle(dto.getTitle());
		album.setDescription(dto.getDescription());
		return album;
	}
	public List<AlbumBean> mapToListBean(List<AlbumResponseDTO> dtos) {
		List<AlbumBean> albums=new ArrayList<AlbumBean>();
		for(AlbumResponseDTO dto:dtos) {
			AlbumBean bean=mapToBean(dto);
			
			albums.add(bean);
		}
		return albums;
	}
}


