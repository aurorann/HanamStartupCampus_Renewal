<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

	<div class="sub-nav">
		<div id="location">
		    <div class="inner">
			    <div class="ly_center_mom">
			        <div class="location_guide">
			            <a href="<c:url value='/home' />" class="location_guide_home"><!-- 홈으로 이동 --></a>
			            <ul>
				            <li>
				                <button title="메뉴열기">
				                    ${locationMain}
				                </button>
				                <ul>
				                    <!-- # common: header-menu start -->
								    <%@ include file="/WEB-INF/location-common.jsp"%>
								    <!-- # common: header-menu end -->
				                </ul>
				            </li>
				
				            <li>
				                <button title="메뉴열기">
				                    ${locationSub}
				                </button>
				                <ul>
				                    <li data-location-sub='예약하기'><a href="<c:url value='/book/place' />">예약하기</a></li>
                                	<li data-location-sub='예약현황 보기'><a href="<c:url value='/book/history' />">예약현황 보기</a></li>
	                                
				                </ul>
				            </li>
				        </ul>
			        </div>
			    </div>
			</div> <!--inner div 끝-->
		</div><!-- location div 끝 -->
	</div>