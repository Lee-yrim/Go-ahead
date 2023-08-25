package detail.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.file.FileUpload;
import detail.dto.DetailDTO;
import detail.dto.ReviewDTO;
import detail.service.DetailService;
import detail.service.ReviewService;
import memb.dto.AuthInfo;

@Controller
public class DetailController {

	private DetailService detailService;
	private ReviewService reviewService;
	
	public DetailController() {
		// TODO Auto-generated constructor stub
	}

	public void setDetailService(DetailService detailService) {
		this.detailService = detailService;
	}

	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	
//	@RequestMapping(value = "/detail.do")
//	public String ReviewOpen() {
//		
//		return "/detail/detail";
//	}
	
	@RequestMapping(value = "/detail.do")
	public ModelAndView listExecute(DetailDTO dto, ReviewDTO rdto ,ModelAndView mav) {
		System.out.println(detailService.infoListProcess(dto));
		mav.addObject("detailInfoList", detailService.infoListProcess(dto));
		mav.addObject("reviewlist", reviewService.reviewListProcess(rdto));
		mav.setViewName("/detail/detail");
		
		System.out.println(dto.getAddress());
		
		return mav;
	}
	
//	@RequestMapping(value = "/detail.do")
//	public ModelAndView detailReviewList (ReviewDTO dto, ModelAndView mav) {
//		
//		mav.addObject("reviewlist", reviewService.reviewListProcess(dto));
//		mav.setViewName("/detail/detail");
//		
//		return mav;
//	}
//	
//	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
//	public String writeProExcute(ReviewDTO dto, HttpServletRequest req, HttpSession session, RedirectAttributes ratt) {
//		MultipartFile file = dto.getFilename();
//		
//		if(!file.isEmpty()) {
//			UUID random = FileUpload.saveCopyFile(file, req);
//			dto.setUpload(random + "_" + file.getOriginalFilename());
//		}
//		
//		dto.setIp(req.getRemoteAddr());
//
//		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
//		dto.setMemb_id(authInfo.getMemb_id());
//
//		reviewService.insertProcess(dto);
//		
//		
//		return "redirect:/detail/detail.do";
//	}
}
