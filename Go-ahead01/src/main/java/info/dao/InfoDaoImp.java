package info.dao;

import org.mybatis.spring.SqlSessionTemplate;

import info.dto.InfoDTO;

import java.util.List;

public class InfoDaoImp implements InfoDAO{
	
	private SqlSessionTemplate sqlSession;
	
	public InfoDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<InfoDTO> list() {
		return sqlSession.selectList("info.all");
		//Å×½ºÆ®
	}
	
}//end class
