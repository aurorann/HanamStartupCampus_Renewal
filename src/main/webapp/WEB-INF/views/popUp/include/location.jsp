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
				                <form id="logout_location" method="POST" action="<c:url value='/user/logout' />">
                                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </form>
				                <ul>
				                    <li><a href="<c:url value='/admin/introduce/media/write/form' />">캠퍼스 소개 영상</a></li>
			                        <li><a href="<c:url value='/admin/announce/notice/write/form' />">알림마당</a></li>
			                        <li><a href="<c:url value='/admin/gallery/press/write/form' />">아카이브</a></li>
			                   		<li><a href="<c:url value='/popUp/popUpList' />">팝업 관리</a></li>
			                   		<li><a href="<c:url value='/admin/partner/notice/list' />">입주기업 관련</a></li>
			                   		<li><a href="<c:url value='/admin/family-site/list' />">패밀리사이트</a></li>
	                                <li><a href="javascript:void(0);" onclick="logout_location.submit();">로그아웃</a></li>
				                </ul>
				            </li>
				        </ul>
			        </div>
			    </div>
			</div> <!--inner div 끝-->
		</div><!-- location div 끝 -->
	</div>