package detail.service;

import java.util.List;

import detail.dto.DetailDTO;

public interface DetailService {
	
	public List<DetailDTO> infoListProcess(DetailDTO dto);
	
	public DetailDTO selectDetailInfo(int info_seq);
	
}
