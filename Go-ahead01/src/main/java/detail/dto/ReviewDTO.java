package detail.dto;

import java.sql.Date;

import info.dto.InfoDTO;
import memb.dto.MembDTO;

public class ReviewDTO {
	private int rev_seq; 
	
	private Date write_date;
	
	private String review_content;
	private String memb_id;
	private String nickname;
	
	private int info_seq;

	
	private MembDTO membDTO;
	private InfoDTO infoDTO;
	
	
	public int getInfo_seq() {
		return info_seq;
	}

	public void setInfo_seq(int info_seq) {
		this.info_seq = info_seq;
	}

	public InfoDTO getInfoDTO() {
		return infoDTO;
	}

	public void setInfoDTO(InfoDTO infoDTO) {
		this.infoDTO = infoDTO;
	}

	public int getRev_seq() {
		return rev_seq;
	}

	public void setRev_seq(int rev_seq) {
		this.rev_seq = rev_seq;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getMemb_id() {
		return memb_id;
	}

	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public MembDTO getMembDTO() {
		return membDTO;
	}

	public void setMembDTO(MembDTO membDTO) {
		this.membDTO = membDTO;
	}

	
	
}
