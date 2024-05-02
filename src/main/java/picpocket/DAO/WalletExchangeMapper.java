package picpocket.DAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import picpocket.DTO.WalletExchangeRequestDTO;
import picpocket.DTO.WalletExchangeResponseDTO;
import picpocket.models.WalletExchangeBean;

public class WalletExchangeMapper {
	
	public WalletExchangeRequestDTO mapWalletExchangeToRequestDTO(WalletExchangeBean wallet) throws IOException {
		WalletExchangeRequestDTO dto=new WalletExchangeRequestDTO();
		dto.setId(wallet.getId());
		dto.setAmount(wallet.getAmount());
		dto.setWallet_id(wallet.getWallet_id());
		
		return dto;
	}	
	public WalletExchangeBean mapDTOToWalletExchange(WalletExchangeResponseDTO dto) {
		WalletExchangeBean wallet=new WalletExchangeBean();
		wallet.setId(dto.getId());
		wallet.setAmount(dto.getAmount());
		wallet.setWallet_id(dto.getWallet_id());
		
		return wallet;
	}
	public List<WalletExchangeBean> mapToListWalletExchange(List<WalletExchangeResponseDTO> dtos) {
		List<WalletExchangeBean> wallets=new ArrayList<WalletExchangeBean>();
		for(WalletExchangeResponseDTO dto:dtos) {
			WalletExchangeBean wallet=mapDTOToWalletExchange(dto);
			
			wallets.add(wallet);
		}
		return wallets;
	}
	
	
}
