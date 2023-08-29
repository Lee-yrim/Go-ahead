package detail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import detail.dto.AlgoDTO;

public class AlgoDaoImp implements AlgoDAO {

	private SqlSessionTemplate sqlSession;
	
	public AlgoDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<AlgoDTO> algolist(AlgoDTO dto) {

		return sqlSession.selectList("detail.detailAlgo", dto);
	}

}
