package detail.service;

import java.util.List;

import detail.dao.DetailDAO;
import detail.dto.DetailDTO;

public class DetailServiceImp implements DetailService {
	
	private DetailDAO detailDao;

	public void setDetailDao(DetailDAO detailDao) {
		this.detailDao = detailDao;
	}

	@Override
	public List<DetailDTO> infoListProcess(DetailDTO dto) {
		return detailDao.infolist(dto);
	}

	@Override
	public DetailDTO selectDetailInfo(int info_seq) {
		return detailDao.detailInfo(info_seq);
	}

}
