package memb.dao;

import org.mybatis.spring.SqlSessionTemplate;
import memb.dto.MembDTO;

public class MembDaoImp implements MembDAO {

	private SqlSessionTemplate sqlSession;

	public MembDaoImp() {
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int insertMemb(MembDTO dto) {
		return sqlSession.insert("memb.insertMemb", dto);
	}

	@Override
	public MembDTO selectById(String memb_Id) {
		return sqlSession.selectOne("memb.selectById", memb_Id);
	}

	@Override
	public void updateMemb(MembDTO dto) {
		sqlSession.update("memb.updateMemb", dto);
	}

}
