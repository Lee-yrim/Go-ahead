package detail.controller;

import java.sql.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.velocity.tools.view.WebappUberspector.SetAttributeExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.file.FileUpload;
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
		// TODO Auto-generated constructor stub
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
	
//	@RequestMapping(value = "/detail.do")
//	public String ReviewOpen() {
//		
//		return "/detail/detail";
//	}
	
//	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
//	public ModelAndView listExecute(DetailDTO dto, ReviewDTO rdto, ModelAndView mav) {
//		System.out.println(detailService.infoListProcess(dto));
//		mav.addObject("detailInfoList", detailService.infoListProcess(dto));
//		mav.addObject("reviewlist", reviewService.reviewListProcess(rdto));
//		mav.setViewName("/detail/detail");
//		
//		return mav;
//	}
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView listExecute(DetailDTO dto, ReviewDTO rdto, AlgoDTO adto, ModelAndView mav,HttpSession session) {
		System.out.println(detailService.infoListProcess(dto));
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		adto.setMemb_id(authInfo.getMemb_id());
		
		mav.addObject("detailInfoList", detailService.infoListProcess(dto));
		mav.addObject("reviewlist", reviewService.reviewListProcess(rdto));		
		mav.addObject("algolist", algoService.algoListProcess(adto));
		mav.setViewName("/detail/detail");
		
		return mav;
	}
	
	

	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
	public String writeProExcute(ReviewDTO dto, DetailDTO ddto, HttpServletRequest req, HttpSession session, RedirectAttributes ratt) {
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		dto.setMemb_id(authInfo.getMemb_id());
		
		reviewService.insertProcess(dto);
//		ratt.addAttribute("info_seq", ddto.getInfo_seq());
		System.out.println(dto.getMemb_id());
		System.out.println(ddto.getInfo_seq());
		
//		return "/detail/detail";
		return "redirect:/detail.do?info_seq="+ddto.getInfo_seq();
	}
}
