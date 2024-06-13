<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<li>
    <a href="<c:url value='/introduce/greeting' />">캠퍼스 소개</a>
</li>
<li>
    <a href="<c:url value='/announce/notice/list' />">알림마당</a>
</li>
<li>
    <a href="<c:url value='/program/supporting' />">사업 안내</a>
</li>
<li>
    <a href="<c:url value='/partner/list' />">입주기업 · 졸업기업</a>
</li>
<li>
    <a href="<c:url value='/gallery/press/list' />">아카이브</a>
</li>
<li>
    <a href="<c:url value='/newsletter/list' />">뉴스레터</a>
</li>

<sec:authorize access="isAnonymous()">
	<li>
		<a href="<c:url value='/user/login/form' />">사용자 로그인</a>
	</li>
</sec:authorize>
  	
<sec:authorize ifAnyGranted="ROLE_USER">
  	<li>
     	<a href="<c:url value='/user/partner/notice/list' />">입주기업 알림공간</a>
	</li>
</sec:authorize>
  	
<sec:authorize ifAnyGranted="ROLE_ADMIN">
  <li>
     <a href="<c:url value='/admin/announce/notice/write/form' />">관리자 메뉴</a>
 </li>
</sec:authorize>