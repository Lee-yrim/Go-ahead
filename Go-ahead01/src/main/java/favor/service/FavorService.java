package favor.service;

import java.util.List;

import favor.dto.FavorDTO;

public interface FavorService {
	
	//찜 목록
	public List<FavorDTO> favorList(FavorDTO dto);
	
	//찜 추가
	public void insertFavor(FavorDTO dto);
	
	//찜 삭제
	public void deleteFavor(int favor_seq);
//	public void deleteFavor(FavorDTO dto);
}
