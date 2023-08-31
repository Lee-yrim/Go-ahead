package memb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.exception.WrongPasswordException;
import memb.dto.AuthInfo;
import memb.dto.MembDTO;
import memb.service.MembService;

@Controller
public class MembController {
	private MembService membService;

	public MembController() {

	}

	public void setMembService(MembService membService) {
		this.membService = membService;
	}

	// 회원가입 페이지 in
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public ModelAndView addMember(ModelAndView mav) {
		mav.setViewName("memb/signup");

		return mav;
	}

	// 회원가입 처리
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String addMember(MembDTO membDTO, HttpSession session) {
		System.out.println(membDTO.getMemb_id());

		// java.lang.String => java.sql.Date
		// 스트링으로 받아온 날짜를 Date값으로 변환하는부분
		membDTO.setBirth(Date.valueOf(membDTO.getSbirth()));

		AuthInfo authInfo = membService.addMembProcess(membDTO);
		session.setAttribute("authInfo", authInfo);

		// java.sql.Date => java.lang.String
		// 생일 출력할때 쓰는부분
		// membDTO.setSbirth(String.valueOf(membDTO.getBirth()));
		// membDTO.setSbirth(membDTO.getBirth().toString());

		return "redirect:/camping.do";
	}

	// 로그인 페이지 in
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginMember() {

		return "memb/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginMember(MembDTO membDTO, HttpSession session, HttpServletResponse resp) {

		try {
			System.out.println(membDTO.getMemb_id());
			System.out.println(membDTO.getMemb_pw());

			AuthInfo authInfo = membService.loginProcess(membDTO);
			session.setAttribute("authInfo", authInfo);

			Cookie rememberCookie = new Cookie("REMEMBER", membDTO.getMemb_id());
			rememberCookie.setPath("/");

			if (membDTO.isRememberId()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				rememberCookie.setMaxAge(0);
			}

			resp.addCookie(rememberCookie);
			System.out.println("login OK");

			return "redirect:/camping.do";
		} catch (WrongPasswordException e) {
			resp.setContentType("text/html; charset = UTF-8");

			try {
				PrintWriter out = resp.getWriter();
				out.print("<script>alert('아이디 또는 비밀번호가 불일치합니다'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		System.out.println("login NO");
		return null;
	}

	// 로그아웃 처리
	@RequestMapping(value = "/logout.do")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		System.out.println("logout OK");

		return "redirect:/camping.do";
	}

	// 마이페이지(회원수정) in
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView updateMemb(ModelAndView mav, HttpSession session) {
		// System.out.println(memb_id);

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		System.out.println("membe_id : " + authInfo.getMemb_id());

		mav.addObject("membDTO", membService.updateMembProcess(authInfo.getMemb_id()));
		mav.setViewName("memb/mypage");

		return mav;
	}

	// 회원수정 처리
	@RequestMapping(value = "/mypage.do", method = RequestMethod.POST)
	public String updateMemb(MembDTO membDTO, HttpSession session) {
		AuthInfo authInfo = membService.updateMembProcess(membDTO);
		session.setAttribute("authInfo", authInfo);

		return "redirect:/mypage.do";
	}

}