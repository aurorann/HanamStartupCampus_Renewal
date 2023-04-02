<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

			<div class="left-menu">
                <div id="left">
                	<h2><span>Archive</span><br>아카이브</h2>
                    <ul id="lm">
                        <li data-location-sub='보도자료'><a href="<c:url value='/gallery/press/list' />">보도자료</a></li>
                        <li data-location-sub='홍보자료'><a href="<c:url value='/gallery/promotion/list' />">홍보자료</a></li>
                        <li data-location-sub='바이오 소식'><a href="<c:url value='/gallery/bio-info/list' />">바이오 소식</a></li>
                    </ul>
                </div>
            </div>