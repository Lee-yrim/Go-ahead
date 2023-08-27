package common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import memb.dto.AuthInfo;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {
	
	public AuthCheckInterceptor() {}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
			if(authInfo != null) {
				return true;
			}
		}	
		
		response.sendRedirect(request.getContextPath() + "/memb/login.do");
		//로그인 하고 오라고 로그인페이지로 보냄
		
		System.out.println(request.getContextPath());		
		return false;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		System.out.println("afterCompletion");
		// 콘솔에서 확인
		
		super.afterCompletion(request, response, handler, ex);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("postHandle");
		// 콘솔에서 확인

		super.postHandle(request, response, handler, modelAndView);
	}
}
