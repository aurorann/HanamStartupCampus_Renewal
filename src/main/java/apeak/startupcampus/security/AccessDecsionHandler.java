package apeak.startupcampus.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

public class AccessDecsionHandler extends EgovAbstractServiceImpl implements AccessDeniedHandler {

	public static final Logger LOGGER = LoggerFactory.getLogger(AccessDecsionHandler.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException ade) throws IOException, ServletException {
		
		LOGGER.debug("AccessDenided");
		
		LOGGER.info("Exceiption : {}",ade);
		LOGGER.info("LocalizedMessage : {}",ade.getLocalizedMessage());
		LOGGER.info("Message : {}",ade.getMessage());
		LOGGER.info("StackTrace : {}",ade.getStackTrace());		
		
		 request.setAttribute("errorMessage",ade.getMessage());
		 //request.getRequestDispatcher("/WEB-INF/views/sign/loginForm.jsp").forward(request, response);
		
	}
}
