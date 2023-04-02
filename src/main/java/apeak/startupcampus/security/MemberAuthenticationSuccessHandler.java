package apeak.startupcampus.security;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import apeak.startupcampus.model.dto.LoginHistoryDTO;
import apeak.startupcampus.service.UserService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;




@Component // id="memberAuthenticationFailureHandler"
public class MemberAuthenticationSuccessHandler extends EgovAbstractServiceImpl implements AuthenticationSuccessHandler {
	
	static final Logger LOGGER = LoggerFactory.getLogger(MemberAuthenticationSuccessHandler.class);
	
	@Resource(name="userService")
	private UserService userService;
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
		Authentication authentication) throws IOException, ServletException {
		LoginHistoryDTO loginHistory = userService.isUserLoginSuccess(true, request);
		
		// FIXME: 계정 정보 설정 후 호출
		try {
			userService.addUserLoginHistory(loginHistory);
			userService.renewUserLoginDate(loginHistory.getUserId());
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			throw new AccessDeniedException(e.getMessage());
		}
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		if(savedRequest!=null) {
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStratgy.sendRedirect(request, response, targetUrl);
		} else {
			redirectStratgy.sendRedirect(request, response, "/");
		}
		

		//request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
	}

}
