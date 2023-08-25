package memb.dao;

import memb.dto.MembDTO;

public interface MembDAO {
	
	public int insertMemb(MembDTO dto);
	
	public MembDTO selectById(String memb_Id);
	
	public void updateMemb(MembDTO dto);
	
	public void updateByPass(MembDTO dto);
	// :)
}
