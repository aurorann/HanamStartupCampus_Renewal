<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
			<!-- 
			<div class="left-menu">
                <div id="left">
                	<h2><span>ADMIN MENU</span><br>관리자 메뉴</h2>
                	<form id="logout_side" method="POST" action="<c:url value='/user/logout' />">
                       	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form>
                    <ul id="lm">
                        <li data-location-sub='캠퍼스 소개'><a href="<c:url value='/admin/introduce/media/write/form' />">캠퍼스 소개</a></li>
                        <li data-location-sub='알림마당'><a href="<c:url value='/admin/announce/notice/write/form' />">알림마당</a></li>
                        <li data-location-sub='아카이브'><a href="<c:url value='/admin/gallery/press/write/form' />">아카이브</a></li>
                   		<li data-location-sub='팝업 관리'><a href="<c:url value='/popUp/popUpList' />">팝업 관리</a></li>
                   		<li data-location-sub='입주기업 관련'><a href="<c:url value='/admin/partner/notice/list' />">입주기업 관련</a></li>
                   		<li data-location-sub='패밀리사이트'><a href="<c:url value='/admin/family-site/list' />">패밀리사이트</a></li>
                   		<li data-location-sub='뉴스레터'><a href="<c:url value='/admin/newsletter/write/form' />">뉴스레터</a></li>
                        <li><a href="javascript:void(0);" onclick="logout_side.submit();">로그아웃</a></li>
                    </ul>
                </div>
            </div>
             -->
	        <aside class="left-menu">
	            <h3>관리자 메뉴</h3>
				<form id="logout_side" method="POST" action="<c:url value='/user/logout' />">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
	            <ul>
					<li data-location-sub='캠퍼스 소개'><a href="<c:url value='/admin/introduce/media/write/form' />">캠퍼스 소개</a></li>
					<li data-location-sub='알림마당'><a href="<c:url value='/admin/announce/notice/write/form' />">알림마당</a></li>
					<li data-location-sub='아카이브'><a href="<c:url value='/admin/gallery/press/write/form' />">아카이브</a></li>
					<li data-location-sub='팝업 관리'><a href="<c:url value='/popUp/popUpList' />">팝업 관리</a></li>
					<li data-location-sub='입주기업 관련'><a href="<c:url value='/admin/partner/notice/list' />">입주기업 관련</a></li>
					<li data-location-sub='패밀리사이트'><a href="<c:url value='/admin/family-site/list' />">패밀리사이트</a></li>
					<li data-location-sub='뉴스레터'><a href="<c:url value='/admin/newsletter/list' />">뉴스레터</a></li>
<!-- 					<li><a href="javascript:void(0);" onclick="logout_side.submit();">로그아웃</a></li> -->
	            </ul>
	        </aside>