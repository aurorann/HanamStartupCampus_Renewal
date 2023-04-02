<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

			<div class="left-menu">
                <div id="left">
                <h2><span>RESERVATION</span><br>시설/공간 예약 </h2>
                    <ul id="lm">
                        <li data-location-sub='예약하기'><a href="<c:url value='/book/place' />">예약하기</a></li>
                        <li data-location-sub='예약현황 보기'><a href="<c:url value='/book/history' />">예약현황 보기</a></li>
                    </ul>
                </div>
            </div>