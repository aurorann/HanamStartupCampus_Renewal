<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<!-- 
<div class="inside-menu">
	<div id="you-are-here" class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
		<a data-location-insub='입주기업 정보 관리' href="<c:url value='/admin/partner/list' />" class="btn btn-default" role="button">입주기업 정보 관리</a>
		<a data-location-insub='회의실 예약 및 현황' href="<c:url value='/admin/book/place' />" class="btn btn-default" role="button">회의실 예약 및 현황</a>
		 <a href="<c:url value='/admin/partner/notice/write/form' />" class="btn btn-default" role="button">입주기업 공지사항 글쓰기</a>	      
		<a data-location-insub='기업 실적 수정' href="<c:url value='/admin/webpage/partner/management/edit/form' />" class="btn btn-default" role="button">기업 실적 수정</a>
		<a data-location-insub='소개영상 글쓰기' href="<c:url value='/admin/partner/media/write/form' />" class="btn btn-default" role="button">소개 영상 글쓰기</a>
	</div>
	
	<div id="you-are-here" class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
		<a data-location-insub='입주기업 공지사항' href="<c:url value='/admin/partner/notice/list' />" class="btn btn-default" role="button">입주기업 공지사항</a>
		<a data-location-insub='기업 소식' href="<c:url value='/admin/partner/activity/list' />" class="btn btn-default" role="button">기업 소식</a>
		<a href="<c:url value='/admin/partner/activity/write/form' />" class="btn btn-default" role="button">기업 소식 글쓰기</a>
		<a data-location-insub='입주기업 커뮤니티' href="<c:url value='/admin/user/community/list' />" class="btn btn-default" role="button">입주기업 커뮤니티</a>
		<a data-location-insub='서식 자료실' href="<c:url value='/admin/partner/file/list' />" class="btn btn-default" role="button">서식 자료실</a>
	</div>
	<div id="you-are-here" class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
		<a href="<c:url value='/admin/partner/file/write/form' />" class="btn btn-default" role="button">서식 자료실 글쓰기</a>
		<a href="<c:url value='/admin/partner/news/list' />" class="btn btn-default" role="button">기업 소식</a>
	</div>
</div>
 -->
	<ul class="mgr_btns mgr_btns2" id="you-are-here">
	    <li><button data-location-insub='입주기업 정보 관리'  onclick="location.href='<c:url value='/admin/partner/list' />' ">입주기업 정보 관리</button></li>
	    <li><button data-location-insub='회의실 예약 및 현황' onclick="location.href='<c:url value='/admin/book/place' />' ">회의실 예약 및 현황</button></li>
	    <li><button data-location-insub='기업 실적 수정' onclick="location.href='<c:url value='/admin/webpage/partner/management/edit/form' />' ">기업 실적 수정</button></li>
	    <li><button data-location-insub='소개영상 글쓰기' onclick="location.href='<c:url value='/admin/partner/media/write/form' />' ">소개 영상 글쓰기</button></li>
	</ul>
	<ul class="mgr_btns mgr_btns2" id="you-are-here">
	    <li><button data-location-insub='입주기업 공지사항' onclick="location.href='<c:url value='/admin/partner/notice/list' />' ">입주기업 공지사항</button></li>
	    <li><button data-location-insub='기업 소식' onclick="location.href='<c:url value='/admin/partner/activity/list' />' ">기업 소식</button></li>
	    <li><button data-location-insub='입주기업 커뮤니티' onclick="location.href='<c:url value='/admin/user/community/list' />' ">입주기업 커뮤니티</button></li>
	    <li><button data-location-insub='서식 자료실' onclick="location.href='<c:url value='/admin/partner/file/list' />' ">서식 자료실</button></li>
	</ul>

