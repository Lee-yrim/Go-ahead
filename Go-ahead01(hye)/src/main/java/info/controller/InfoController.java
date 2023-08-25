package info.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import favor.dao.FavorDAO;
import favor.dto.FavorDTO;
import favor.service.FavorService;
import info.dao.InfoDAO;
import memb.dto.AuthInfo;

// http://localhost:8090/myapp/camping.do

@Controller
public class InfoController {
	
	private InfoDAO dao;
	
	
	private FavorDAO favordao;
	private FavorService favorService;
	public InfoController() {

	}
	
	public void setFavordao(FavorDAO favordao) {
		this.favordao = favordao;
	}
	public FavorDAO getFavordao() {
		return favordao;
	}
	public void setFavorService(FavorService favorService) {
		this.favorService = favorService;
	}
	

	public void setDao(InfoDAO dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/camping.do")
	public ModelAndView list(ModelAndView mav, FavorDTO dto, HttpSession session) {
		mav.addObject("camping", dao.list());
		mav.setViewName("info/camping");
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		dto.setMemb_id(authInfo.getMemb_id());
		mav.addObject("favor", favorService.favorList(dto));
		
		
		return mav;
	}

	@RequestMapping(value = "/kakaomap.do")
	public ModelAndView map(ModelAndView mav) {
		mav.addObject("kakaomap", dao.list());
		mav.setViewName("info/kakaomap");
		return mav;
	}

	@RequestMapping(value = "/glamping.do")
	public ModelAndView glamping(ModelAndView mav) {
		mav.addObject("glamping", dao.list());
		mav.setViewName("info/glamping");
		return mav;
	}
	
	@RequestMapping(value = "/glampingmap.do")
	public ModelAndView glampingmap(ModelAndView mav) {
		mav.addObject("glampingmap", dao.list());
		mav.setViewName("info/glampingmap");
		return mav;
	}

	@RequestMapping(value = "/car.do")
	public ModelAndView car(ModelAndView mav) {
		mav.addObject("car", dao.list());
		mav.setViewName("info/car");
		return mav;
	}
	
	@RequestMapping(value = "/carmap.do")
	public ModelAndView carmap(ModelAndView mav) {
		mav.addObject("carmap", dao.list());
		mav.setViewName("info/carmap");
		return mav;
	}
	
}
