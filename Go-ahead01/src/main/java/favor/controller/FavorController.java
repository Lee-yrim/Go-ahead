package favor.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.Callpython;
import com.mycompany.myapp.Callpython2;

import favor.dao.FavorDAO;
import favor.dto.FavorDTO;
import favor.service.FavorService;
import memb.dto.AuthInfo;

// http://localhost:8090/myapp/camping.do

@Controller
public class FavorController {

	private FavorDAO favorDao;
	private FavorService favorService;

	public void setFavorService(FavorService favorService) {
		this.favorService = favorService;
	}

	public FavorController() {

	}

	public FavorDAO getFavorDao() {
		return favorDao;
	}

	public void setFavorDao(FavorDAO favorDao) {
		this.favorDao = favorDao;
	}

	// 로그인 한 회원이 찜한 목록 출력해주는 favor.do 호출
	@RequestMapping(value = "/favor.do", method = RequestMethod.GET)
	public ModelAndView favorExecute(FavorDTO dto, HttpSession session, ModelAndView mav) throws IOException, InterruptedException {

		Callpython callpython=new Callpython();
		callpython.main();
		
		Callpython2 callpython2=new Callpython2();
		callpython2.main();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		dto.setMemb_id(authInfo.getMemb_id());
		mav.addObject("favor", favorService.favorList(dto));
		mav.setViewName("memb/favor");
		
		return mav;
	}

	// 찜한 장소의 정보를 DB에 넣어주고 이어서 찜할 수 있는 처리(ajax)
	@RequestMapping(value = "/memb/heart.do", method = RequestMethod.GET)
	public void favorExecute(FavorDTO dto, HttpSession session) {
		// System.out.println("info: " + dto.getInfo_seq());
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		dto.setMemb_id(authInfo.getMemb_id());
		favorService.insertFavor(dto);
	}

	// DB에 저장된 찜한 장소의 정보를 삭제하는 매핑
	@RequestMapping("/delete.do")
	public String deleteExecute(int favor_seq) {
		// System.out.println("favor_seq" + favor_seq);
		
		favorService.deleteFavor(favor_seq);
		return "redirect:/favor.do";
	}

}