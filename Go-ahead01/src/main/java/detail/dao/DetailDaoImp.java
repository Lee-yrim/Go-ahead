package detail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import detail.dto.DetailDTO;

public class DetailDaoImp implements DetailDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public DetailDaoImp() {
		// TODO Auto-generated constructor stub
	}

	 public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<DetailDTO> infolist(DetailDTO dto) {
		return sqlSession.selectList("detail.detailInfo", dto);
	}

	@Override
	public DetailDTO detailInfo(int info_seq) {
		return sqlSession.selectOne("detail.detailInfo", info_seq);
	}


}
