<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
			<!-- 
			<div class="left-menu">
                <div id="left">
                	<h2><span>ANNOUNCE</span><br>알림마당</h2>
                    <ul id="lm">
                        <li data-location-sub='공고'><a href="<c:url value='/announce/notice/list' />">공고</a></li>
                        <li data-location-sub='바이오 정책 · 지원'><a href="<c:url value='/announce/agency/list' />">바이오 정책 · 지원</a></li>
                        <li data-location-sub='자주 묻는 질문'><a href="<c:url value='/announce/faq/list' />">자주 묻는 질문</a></li>
                    </ul>
                </div>
            </div>
             -->
	        <aside class="left-menu">
	            <h3>알림마당</h3>
	            <ul>
					<li data-location-sub='공지사항'><a href="<c:url value='/announce/notice/list' />">공지사항</a></li>
					<li data-location-sub='사업공고'><a href="<c:url value='/announce/agency/list' />">사업공고</a></li>
					<li data-location-sub='보도자료'><a href="<c:url value='/announce/promotion/list' />">보도자료</a></li>
					<li data-location-sub='자주 묻는 질문'><a href="<c:url value='/announce/faq/list' />">자주 묻는 질문</a></li>
	            </ul>
	        </aside>