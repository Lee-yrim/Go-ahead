package favor.service;

import java.util.List;

import favor.dao.FavorDAO;
import favor.dto.FavorDTO;

public class FavorServiceImp implements FavorService {

	private FavorDAO favorDao;

	public void setFavorDao(FavorDAO favorDao) {
		this.favorDao = favorDao;
	}

	public FavorServiceImp() {
	}

	// 찜한 목록을 favor.do에 출력
	@Override
	public List<FavorDTO> favorList(FavorDTO dto) {
		return favorDao.favor_list(dto);
	}

	// 찜 추가 
	@Override
	public void insertFavor(FavorDTO dto) {
		favorDao.insertFavor(dto);
	}

	// 찜 삭제
	@Override
	public void deleteFavor(int favor_seq) {
		favorDao.deleteFavor(favor_seq);		
	}
	
	/*@Override
	public void deleteFavor(FavorDTO dto) {
		favorDao.deleteFavor(dto);
	}*/

}
