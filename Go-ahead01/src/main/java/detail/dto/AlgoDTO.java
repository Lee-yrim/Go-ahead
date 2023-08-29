package detail.dto;

import java.sql.Date;

import favor.dto.FavorDTO;
import info.dto.InfoDTO;
import memb.dto.MembDTO;

public class AlgoDTO {

	private String memb_id;	
	private Date birth;
	private int age; 	
	private int info_seq; 
	private String loc_name;	
	private String img;	

	
	private MembDTO membDTO;
	private FavorDTO favorDTO;
	private InfoDTO infoDTO;
	
	public AlgoDTO() {

	}
	
	public FavorDTO getFavorDTO() {
		return favorDTO;
	}
	
	public InfoDTO getInfoDTO() {
		return infoDTO;
	}

	public void setInfoDTO(InfoDTO infoDTO) {
		this.infoDTO = infoDTO;
	}

	
	public void setFavorDTO(FavorDTO favorDTO) {
		this.favorDTO = favorDTO;
	}
	
	public String getLoc_name() {
		return loc_name;
	}

	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public MembDTO getMembDTO() {
		return membDTO;
	}
	
	public void setMembDTO(MembDTO membDTO) {
		this.membDTO = membDTO;
	}
	

	public String getMemb_id() {
		return memb_id;
	}

	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getInfo_seq() {
		return info_seq;
	}

	public void setInfo_seq(int info_seq) {
		this.info_seq = info_seq;
	}

	public AlgoDTO(String memb_id, Date birth, int age, int info_seq) {
		super();
		this.memb_id = memb_id;
		this.birth = birth;
		this.age = age;
		this.info_seq = info_seq;
	}

//	public AlgoDTO(String memb_id, Date birth, int age, int info_seq, MembDTO membDTO, FavorDTO favorDTO,
//			InfoDTO infoDTO) {
//		super();
//		this.memb_id = memb_id;
//		this.birth = birth;
//		this.age = age;
//		this.info_seq = info_seq;
//		this.membDTO = membDTO;
//		this.favorDTO = favorDTO;
//		this.infoDTO = infoDTO;
//	}

	
	
	
	
}
