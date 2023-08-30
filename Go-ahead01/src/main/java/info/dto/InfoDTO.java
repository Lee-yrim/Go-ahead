package info.dto;

import favor.dto.FavorDTO;

public class InfoDTO {

	private int info_seq;
	private String loc_name;
	private String address;
	private String tel;
	private String info_content;
	private String img;
	private String route;
	private String variety;
	private String pet;
	private String facility;
	private String nature;

	private FavorDTO favorDTO;

	public FavorDTO getFavorDTO() {
		return favorDTO;
	}

	public void setFavorDTO(FavorDTO favorDTO) {
		this.favorDTO = favorDTO;
	}

	public InfoDTO() {
	}

	public int getInfo_seq() {
		return info_seq;
	}

	public void setInfo_seq(int info_seq) {
		this.info_seq = info_seq;
	}

	public String getLoc_name() {
		return loc_name;
	}

	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getInfo_content() {
		return info_content;
	}

	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public String getVariety() {
		return variety;
	}

	public void setVariety(String variety) {
		this.variety = variety;
	}

	public String getPet() {
		return pet;
	}

	public void setPet(String pet) {
		this.pet = pet;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		this.facility = facility;
	}

	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

}
