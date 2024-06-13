<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

			<div class="left-menu">
                <div id="left">
                	<h2><span>PARTNERS · GRADUATES</span><br>입주기업 · 졸업기업</h2>
                    <ul id="lm">
                        <li data-location-sub='기업 실적'><a href="<c:url value='/partner/management' />">기업 실적</a></li>
                        <li data-location-sub='입주기업 소개'><a href="<c:url value='/partner/list' />">입주기업 소개</a></li>
                        <li data-location-sub='졸업기업 소개'><a href="<c:url value='/partner/graduate/list' />">졸업기업 소개</a></li>
                        <li data-location-sub='소개 영상'><a href="<c:url value='/partner/media/list' />">소개 영상</a></li>
                        <li data-location-sub='기업 활동'><a href="<c:url value='/partner/activity/list' />">기업 활동</a></li>
                    </ul>
                </div>
            </div>