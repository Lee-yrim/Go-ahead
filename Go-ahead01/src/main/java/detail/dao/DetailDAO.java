package detail.dao;

import java.util.List;

import detail.dto.DetailDTO;

public interface DetailDAO {
	
	public List<DetailDTO> infolist(DetailDTO dto);
	
	public DetailDTO detailInfo(int info_seq);
	
	
}
