package apeak.startupcampus.security;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.util.matcher.RegexRequestMatcher;

import org.springframework.security.web.util.matcher.RequestMatcher;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


public class CsrfSecurityRequestMatcher extends EgovAbstractServiceImpl implements RequestMatcher {

	private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$");

	private RegexRequestMatcher unprotectedMatcher = new RegexRequestMatcher("/common/.*", null);

	@Override

	public boolean matches(HttpServletRequest request) {
		
		
		if (allowedMethods.matcher(request.getMethod()).matches()) {
			return false;
		}
		

		return !unprotectedMatcher.matches(request);

	}

}