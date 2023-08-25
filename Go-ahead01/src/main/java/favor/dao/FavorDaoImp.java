package favor.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import favor.dto.FavorDTO;

public class FavorDaoImp implements FavorDAO {

	private SqlSessionTemplate sqlSession;

	public FavorDaoImp() {
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 찜목록 호출
	@Override
	public List<FavorDTO> favor_list(FavorDTO dto) {
		return sqlSession.selectList("favor.favor", dto);
	}

	// 찜 추가
	@Override
	public void insertFavor(FavorDTO dto) {
		System.out.printf("%d %s", dto.getInfo_seq(), dto.getFavor_why());
		sqlSession.insert("favor.insertFavor", dto);
	}

	// 찜 삭제
	@Override
	public void deleteFavor(int favor_seq) {
		sqlSession.delete("favor.deleteFavor", favor_seq);
	}
	

}
