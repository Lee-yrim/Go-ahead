package detail.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import memb.dto.MembDTO;

public class ReviewDTO {
	private int rev_seq; 
	
	private Date write_date;
	private String swrite_date;
	
	private String review_content;
	private String memb_id;
	private String nickname;
	
	private String upload;
	private MembDTO membDTO;
	private MultipartFile filename;
	
	private String ip;
	
	
	
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

	public String getSwrite_date() {
		return swrite_date;
	}

	public void setSwrite_date(String swrite_date) {
		this.swrite_date = swrite_date;
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

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

	public MembDTO getMembDTO() {
		return membDTO;
	}

	public void setMembDTO(MembDTO membDTO) {
		this.membDTO = membDTO;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
}
