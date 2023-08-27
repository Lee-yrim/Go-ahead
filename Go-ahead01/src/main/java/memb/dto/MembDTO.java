package memb.dto;

import java.sql.Date;

public class MembDTO {

	private String memb_id;
	private String memb_pw;
	private String nickname;
	private Date birth;
	private String sbirth;
	private boolean rememberId;
	private int favor_seq;

	public MembDTO() {

	}

	public boolean isRememberId() {
		return rememberId;
	}

	public String getMemb_id() {
		return memb_id;
	}

	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}

	public String getMemb_pw() {
		return memb_pw;
	}

	public void setMemb_pw(String memb_pw) {
		this.memb_pw = memb_pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getFavor_seq() {
		return favor_seq;
	}

	public void setFavor_seq(int favor_seq) {
		this.favor_seq = favor_seq;
	}

	public void setRememberId(boolean rememberId) {
		this.rememberId = rememberId;
	}

	public boolean matchPass(String memb_pw) {
		return this.memb_pw.equals(memb_pw);
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getSbirth() {
		return sbirth;
	}

	public void setSbirth(String sbirth) {
		this.sbirth = sbirth;
	}

}
