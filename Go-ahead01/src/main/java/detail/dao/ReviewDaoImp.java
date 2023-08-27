package detail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import detail.dto.ReviewDTO;

public class ReviewDaoImp implements ReviewDAO {

	private SqlSessionTemplate sqlSession;

	public ReviewDaoImp() {
		// TODO Auto-generated constructor stub
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReviewDTO> reviewlist(ReviewDTO dto) {
		return sqlSession.selectList("detail.detailReview", dto);
	}

	@Override
	public int detailreviewinsert(ReviewDTO dto) {
		return sqlSession.insert("detail.detailReviewInsert", dto);
	}

//	 @Override public ReviewDTO detailreview(int rev_seq) { return
//	 sqlSession.selectOne("detail.detailReview", rev_seq); }

	@Override
	public void save(ReviewDTO dto) {
		sqlSession.insert("detail.save", dto);
	}

}
