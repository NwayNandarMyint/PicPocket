package picpocket.DAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import picpocket.DTO.WalletRequestDTO;
import picpocket.DTO.WalletResponseDTO;
import picpocket.models.WalletBean;

public class WalletMapper {

	public WalletRequestDTO mapWalletToRequestDTO(WalletBean user) throws IOException {
		WalletRequestDTO dto=new WalletRequestDTO();
		dto.setId(user.getId());
		dto.setTotalamount(user.getTotalamount());
		dto.setUser_id(user.getUser_id());
		return dto;
	}	
	public WalletBean mapDTOToWallet(WalletResponseDTO dto) {
		WalletBean user=new WalletBean();
		user.setId(dto.getId());
		user.setTotalamount(dto.getTotalamount());
		user.setUser_id(dto.getUser_id());
		
		return user;
	}
	public List<WalletBean> mapToListUser(List<WalletResponseDTO> dtos) {
		List<WalletBean> wallets=new ArrayList<WalletBean>();
		for(WalletResponseDTO dto:dtos) {
			WalletBean wallet=mapDTOToWallet(dto);
			
			wallets.add(wallet);
		}
		return wallets;
	}

}
