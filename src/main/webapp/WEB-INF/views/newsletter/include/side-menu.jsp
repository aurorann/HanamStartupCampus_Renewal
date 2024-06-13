<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

			<div class="left-menu">
                <div id="left">
                	<h2><span>NEWS LETTER</span><br>뉴스레터</h2>
                    <ul id="lm">
                        <li data-location-sub='뉴스레터'><a href="<c:url value='/newsletter/list' />">뉴스레터</a></li>
                        <li data-location-sub='구독신청'><a href="https://page.stibee.com/subscriptions/197616">구독신청</a></li>
                    </ul>
                </div>
            </div>