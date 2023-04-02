package apeak.startupcampus.security;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import apeak.startupcampus.model.dto.LoginHistoryDTO;
import apeak.startupcampus.service.UserService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Component // id="memberAuthenticationFailureHandler"
public class MemberAuthenticationFailureHandler extends EgovAbstractServiceImpl implements AuthenticationFailureHandler {
	
	static final Logger LOGGER = LoggerFactory.getLogger(MemberAuthenticationFailureHandler.class);
	
	@Resource(name ="userService")
	private UserService userService;
	
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException auth)
			throws IOException, ServletException {
		request.setAttribute("errorMessage", auth.getMessage());
		
		LoginHistoryDTO loginHistoryDTO = userService.isUserLoginSuccess(false, request);
		try {
			userService.addUserLoginHistory(loginHistoryDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			LOGGER.error(e.getMessage());
			e.printStackTrace();
		}
		redirectStratgy.sendRedirect(request, response, "/user/login/form?error=denied");
		//request.getRequestDispatcher("/WEB-INF/views/error/loginError.jsp").forward(request, response);
	}
}
