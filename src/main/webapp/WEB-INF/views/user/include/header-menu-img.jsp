<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
    <div class="sub_bnr_wrap">
	    <div class="sub_bnr sub_bnr6">
	        <h2>${locationMain}</h2>
	    </div>
        <ul class="route">
            <li>
                <a href="<c:url value='/home' />" class="route_home"><img src="<c:url value='/resources/img/route_home_ico.png' />" alt="홈"></a>
            </li>
            <li>
                <button>${locationMain}</button>
                <ul class="dep01">
                    <li><a href="<c:url value='/introduce/greeting' />">• 캠퍼스 소개</a></li>
                    <li><a href="<c:url value='/program/supporting' />">• 주요사업</a></li>
                    <li><a href="<c:url value='/partner/management' />">• 기업소개</a></li>
                    <li><a href="<c:url value='/announce/notice/list' />">• 알림마당</a></li>
                    <li><a href="<c:url value='/newsletter/list' />">• 뉴스레터</a></li>
                    <sec:authorize ifAnyGranted="ROLE_USER">
	                    <li><a href="<c:url value='/user/partner/notice/list' />">• 입주기업 전용공간</a></li>
                    </sec:authorize>
                    <sec:authorize ifAnyGranted="ROLE_ADMIN">
	                    <li><a href="<c:url value='/admin/webpage/introduce/profile/edit/form' />">• 관리자 메뉴</a></li>
                    </sec:authorize>
                </ul>
            </li>
            <li>
                <button class="m-side-menu"></button>
                <ul class="dep01">
					<li data-location-sub='마이페이지'><a href="<c:url value='/user/mypage' />">마이페이지</a></li>
					<li data-location-sub='공지사항'><a href="<c:url value='/user/partner/notice/list' />">공지사항</a></li>
					<li data-location-sub='입주기업 커뮤니티'><a href="<c:url value='/user/community/list' />">입주기업 커뮤니티</a></li>
					<li data-location-sub='서식 자료실'><a href="<c:url value='/user/file/list' />">서식 자료실</a></li>
					<li data-location-sub='회의실 예약 및 현황'><a href="<c:url value='/book/place' />">회의실 예약 및 현황</a></li>
					<li data-location-sub='기업 소식 업로드'><a href="<c:url value='/user/partner/activity/write/form' />">기업 소식 업로드</a></li>
                </ul>
            </li>
        </ul>
	</div>