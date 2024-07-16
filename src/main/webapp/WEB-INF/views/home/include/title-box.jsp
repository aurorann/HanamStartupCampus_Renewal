<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
						
						<div class="sub_title">
	                        <h3>${locationSub}</h3>
				                <ol>
				                    <li><img src="<c:url value='/resources/img/route_home_ico.png' />" alt="홈"></li>
				                    <li>${locationMain}</li>
				                    <li>${locationSub}</li>
				                </ol>
	                    </div>