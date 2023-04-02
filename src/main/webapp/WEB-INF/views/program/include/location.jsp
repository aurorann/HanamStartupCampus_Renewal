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
				                    <li data-location-sub='스타트업 사업화 패키지 지원사업'><a href="<c:url value='/program/supporting' />">스타트업 사업화 패키지 지원사업</a></li>
									<li data-location-sub='액셀러레이팅 프로그램'><a href="<c:url value='/program/accelerating' />">액셀러레이팅 프로그램</a></li>
									<li data-location-sub='스타트업 전문교육'><a href="<c:url value='/program/training' />">스타트업 전문교육</a></li>
									<li data-location-sub='하남도시공사 창업경진대회'><a href="<c:url value='/program/competition' />">하남도시공사 창업경진대회</a></li>
									<li data-location-sub='투자유치 역량 강화 프로그램'><a href="<c:url value='/program/empowering' />">투자유치 역량 강화 프로그램</a></li>
									<li data-location-sub='네트워킹 데이'><a href="<c:url value='/program/networking' />">네트워킹 데이</a></li>
									<li data-location-sub='멘토링 프로그램'><a href="<c:url value='/program/mentoring' />">멘토링 프로그램</a></li>
									<li data-location-sub='스타트업캠퍼스 멤버쉽 프로그램'><a href="<c:url value='/program/membership' />">스타트업캠퍼스 멤버쉽 프로그램</a></li>
				                </ul>
				            </li>
				        </ul>
			        </div>
			    </div>
			</div> <!--inner div 끝-->
		</div><!-- location div 끝 -->
	</div>