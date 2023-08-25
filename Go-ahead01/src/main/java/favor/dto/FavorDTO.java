package favor.dto;

import info.dto.InfoDTO;
import memb.dto.MembDTO;

public class FavorDTO {
	
	private int favor_seq;
	private int info_seq;
	private String memb_id;
	private String favor_why;
	
	private InfoDTO infoDTO;
	private MembDTO membDTO;

	public FavorDTO() {

	}

	public InfoDTO getInfoDTO() {
		return infoDTO;
	}

	public void setInfoDTO(InfoDTO infoDTO) {
		this.infoDTO = infoDTO;
	}

	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}

	public String getMemb_id() {
		return memb_id;
	}

	public String getFavor_why() {
		return favor_why;
	}
	
	public void setFavor_why(String favor_why) {
		this.favor_why = favor_why;
	}
	
	public FavorDTO(int favor_seq, int info_seq, String memb_id, String favor_why) {
		super();
		this.favor_seq = favor_seq;
		this.info_seq = info_seq;
		this.memb_id = memb_id;
		this.favor_why = favor_why;
	}

	public int getFavor_seq() {
		return favor_seq;
	}

	public void setFavor_seq(int favor_seq) {
		this.favor_seq = favor_seq;
	}

	public int getInfo_seq() {
		return info_seq;
	}

	public void setInfo_seq(int info_seq) {
		this.info_seq = info_seq;
	}

	public MembDTO getMembDTO() {
		return membDTO;
	}

	public void setMembDTO(MembDTO membDTO) {
		this.membDTO = membDTO;
	}

}
