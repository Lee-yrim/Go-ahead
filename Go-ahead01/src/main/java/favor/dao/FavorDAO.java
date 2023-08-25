package favor.dao;

import java.util.List;

import favor.dto.FavorDTO;

public interface FavorDAO {
	
	public List<FavorDTO> favor_list(FavorDTO dto);
	
	public void insertFavor(FavorDTO dto); 
	
	public void deleteFavor(int favor_seq);
}
