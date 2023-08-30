package memb.service;

import memb.dto.AuthInfo;
import memb.dto.ChangePwdCommand;
import memb.dto.MembDTO;

public interface MembService {
	
	public AuthInfo addMembProcess(MembDTO dto);
	
	public AuthInfo loginProcess(MembDTO dto);
	
	public MembDTO updateMembProcess(String memb_id);
	
	public AuthInfo updateMembProcess(MembDTO dto);
	
}
