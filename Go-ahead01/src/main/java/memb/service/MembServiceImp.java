package memb.service;

import common.exception.WrongPasswordException;
import memb.dao.MembDAO;
import memb.dto.AuthInfo;
import memb.dto.ChangePwdCommand;
import memb.dto.MembDTO;

public class MembServiceImp implements MembService {

	private MembDAO membDao;

	public MembServiceImp() {
	}

	public void setMembDao(MembDAO membDao) {
		this.membDao = membDao;
	}

	// 회원가입 회원 정보 insert
	@Override
	public AuthInfo addMembProcess(MembDTO dto) {
		membDao.insertMemb(dto);

		return new AuthInfo(dto.getMemb_id(), dto.getMemb_pw(), dto.getNickname());
	}

	// 로그인 처리
	@Override
	public AuthInfo loginProcess(MembDTO dto) {

		MembDTO memb = membDao.selectById(dto.getMemb_id());

		// ....? 회원정보가 존재하지 않습니다?
		if (memb == null) {
			throw new WrongPasswordException("회원정보가 존재하지 않습니다.");
		}

		//이거 구현된건지 확인
		if (!memb.matchPass(dto.getMemb_pw())) {
			throw new WrongPasswordException("비밀번호가 일치하지 않습니다.");
		}

		return new AuthInfo(memb.getMemb_id(), memb.getMemb_pw(), memb.getNickname());
	}

	// 로그인 되어있는 회원의 아이디를 선택
	@Override
	public MembDTO updateMembProcess(String memb_id) {
		return membDao.selectById(memb_id);
	}
	
	// 회원수정 서비스
	@Override
	public AuthInfo updateMembProcess(MembDTO dto) {
		// 데이터 잘 넘어오는지 확인 / 추후 삭제 또는 주석
		System.out.printf("process: %s %s %s",dto.getMemb_id(), dto.getMemb_pw(), dto.getNickname());
		
		membDao.updateMemb(dto);
		MembDTO memb = membDao.selectById(dto.getMemb_id());
		
		System.out.println(memb.getMemb_id());
		 
		return new AuthInfo(memb.getMemb_id(), memb.getMemb_pw(), memb.getNickname() );
	}

	// ???????????????? 필요??????????///
	@Override
	public void updatePassProcess(String memb_id, ChangePwdCommand changePwd) {

	}

}