package memb.dto;

import java.sql.Date;

public class AuthInfo {
	private String memb_id;
	private String memb_pw;
	private String nickname;
	private Date birth;

	public AuthInfo() {

	}

	public AuthInfo(String memb_id) {
		super();
		this.memb_id = memb_id;
	}

	public AuthInfo(String memb_id, String memb_pw, String nickname) {
		super();
		this.memb_id = memb_id;
		this.memb_pw = memb_pw;
		this.nickname = nickname;
	}

	public AuthInfo(String memb_id, String memb_pw, String nickname, Date birth) {
		super();
		this.memb_id = memb_id;
		this.memb_pw = memb_pw;
		this.nickname = nickname;
		this.birth = birth;
	}
	
	
	public AuthInfo(String memb_pw, String nickname) {
		super();
		this.memb_pw = memb_pw;
		this.nickname = nickname;
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
	
	public Date getBirth() {
		return birth;
	}
	
	public void setBirth(Date birth) {
		this.birth = birth;
	}

}
