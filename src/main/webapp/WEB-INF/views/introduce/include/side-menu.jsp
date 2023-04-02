<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

			<div class="left-menu">
                <div id="left">
                	<h2><span>INTRODUCE</span><br>캠퍼스 소개</h2>
                    <ul id="lm">
                        <li data-location-sub='인사말'><a href="<c:url value='/introduce/greeting' />">인사말</a></li>
                        <li data-location-sub='캠퍼스 개요'><a href="<c:url value='/introduce/profile' />">캠퍼스 개요</a></li>
                        <li data-location-sub='시설 안내'><a href="<c:url value='/introduce/facility' />">시설 안내</a></li>
                        <li data-location-sub='소개 영상'><a href="<c:url value='/introduce/media/list' />">소개 영상</a></li>
                        <li data-location-sub='조직 및 연락처'><a href="<c:url value='/introduce/contract' />">조직 및 연락처</a></li>
                        <li data-location-sub='오시는 길'><a href="<c:url value='/introduce/direction' />">오시는 길</a></li>
                    </ul>
                </div>
            </div>
            