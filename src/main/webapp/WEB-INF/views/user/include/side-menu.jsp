<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

			<div class="left-menu">
                <div id="left">
                	<h2><span>PARTNERS ONLY</span><br>입주기업 전용공간</h2>
                	<form id="logout_side" method="POST" action="<c:url value='/user/logout' />">
                       	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form>
                    <ul id="lm">
                        <li data-location-sub='마이페이지'><a href="<c:url value='/user/mypage' />">마이페이지</a></li>
                        <li data-location-sub='입주기업 알림공간'><a href="<c:url value='/user/partner/notice/list' />">입주기업 알림공간</a></li>
                        <li data-location-sub='회의실 예약 및 현황'><a href="<c:url value='/book/place' />">회의실 예약 및 현황</a></li>
                        <li data-location-sub='기업 활동 글쓰기'><a href="<c:url value='/user/partner/activity/write/form' />">기업 활동 글쓰기</a></li>
                        <li><a href="javascript:void(0);" onclick="logout_side.submit();">로그아웃</a></li>
                    </ul>
                </div>
            </div>