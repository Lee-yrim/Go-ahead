package detail.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import detail.dto.AlgoDTO;
import detail.dto.DetailDTO;
import detail.dto.ReviewDTO;
import detail.service.AlgoService;
import detail.service.DetailService;
import detail.service.ReviewService;
import memb.dto.AuthInfo;

@Controller
public class DetailController {

	private DetailService detailService;
	private ReviewService reviewService;
	private AlgoService algoService;

	public DetailController() {

	}

	public void setDetailService(DetailService detailService) {
		this.detailService = detailService;
	}

	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	public void setAlgoService(AlgoService algoService) {
		this.algoService = algoService;
	}

	// 상세페이지 in
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView listExecute(DetailDTO dto, ReviewDTO rdto, AlgoDTO adto, ModelAndView mav, HttpSession session, HttpServletResponse resp) {
		
		//System.out.println(detailService.infoListProcess(dto));

		try {
			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
			adto.setMemb_id(authInfo.getMemb_id());

			mav.addObject("detailInfoList", detailService.infoListProcess(dto));
			mav.addObject("reviewlist", reviewService.reviewListProcess(rdto));
			mav.addObject("algolist", algoService.algoListProcess(adto));
			mav.setViewName("/detail/detail");

		} catch (NullPointerException e) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out;
			try {
				out = resp.getWriter();
				out.print("<script> alert('로그인이 필요합니다.');location.href='login.do'</script>");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			return null;
		}
		return mav;
	}

	// 상세페이지에서 리뷰 작성 처리
	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
	public String writeProExcute(ReviewDTO dto, DetailDTO ddto, HttpServletRequest req, HttpSession session, RedirectAttributes ratt) {

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		dto.setMemb_id(authInfo.getMemb_id());

		reviewService.insertProcess(dto);
		System.out.println(dto.getMemb_id());
		System.out.println(ddto.getInfo_seq());

		return "redirect:/detail.do?info_seq=" + ddto.getInfo_seq();
	}

}
