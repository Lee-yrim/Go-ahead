package detail.service;

import java.util.List;

import detail.dao.AlgoDAO;
import detail.dto.AlgoDTO;

public class AlgoServiceImp implements AlgoService {

	private AlgoDAO algoDao;

	public AlgoServiceImp() {

	}

	public void setAlgoDao(AlgoDAO algoDao) {
		this.algoDao = algoDao;
	}

	@Override
	public List<AlgoDTO> algoListProcess(AlgoDTO dto) {
		return algoDao.algolist(dto);
	}

}
