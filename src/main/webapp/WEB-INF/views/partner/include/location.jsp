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
				                    <li data-location-sub='입주기업 소개'><a href="<c:url value='/partner/list' />">입주기업 소개</a></li>
				                    <li data-location-sub='졸업기업 소개'><a href="<c:url value='/partner/graduate/list' />">졸업기업 소개</a></li>
                            		<li data-location-sub='소개 영상'><a href="<c:url value='/partner/media/list' />">소개 영상</a></li>
                            		<li data-location-sub='기업 활동'><a href="<c:url value='/partner/activity/list' />">기업 활동</a></li>
                            		<li data-location-sub='기업 커뮤니티'><a href="<c:url value='/partner/community/list' />">기업 커뮤니티</a></li>
				                </ul>
				            </li>
				        </ul>
			        </div>
			    </div>
			</div> <!--inner div 끝-->
		</div><!-- location div 끝 -->
	</div>