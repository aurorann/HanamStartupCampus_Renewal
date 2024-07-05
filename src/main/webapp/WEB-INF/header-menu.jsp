<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

        <header>
		<!-- Header desktop -->
			<div class="in_1400">
			    <h1>
			        <a href="<c:url value='/home' />"><img src="<c:url value='/resources/img/logo.png' />" alt="하남스타트업캠퍼스"></a>
			    </h1>
			    <nav>
			        <ul class="dep01">
			            <li>
			                <a href="<c:url value='/introduce/greeting' />">캠퍼스 소개</a>
			                <ul class="dep02">
			                    <li data-location-sub='인사말'><a href="<c:url value='/introduce/greeting' />" class="dep01_name">인사말</a></li>
			                    <li data-location-sub='시설안내'><a href="<c:url value='/introduce/facility' />">시설안내</a></li>
			                    <li data-location-sub='캠퍼스 개요'><a href="<c:url value='/introduce/profile' />">캠퍼스 개요</a></li>
			                    <li data-location-sub='조직도'><a href="<c:url value='/introduce/contract' />">조직도</a></li>
			                    <li data-location-sub='오시는 길'><a href="<c:url value='/introduce/direction' />">오시는 길</a></li>
			                    <li data-location-sub='입주신청'><a href="<c:url value='/introduce/join' />">입주신청</a></li>
			                    <li data-location-sub='홍보 리플렛'><a href="<c:url value='/introduce/leaflet' />">홍보 리플렛</a></li>
			                </ul>
			            </li>
			            <li>
			                <a href="<c:url value='/program/supporting' />">주요사업</a>
			                <ul class="dep02">
	                            <li data-location-sub='스타트업 사업화 패키지 지원사업'><a href="<c:url value='/program/supporting' />" class="dep01_name">스타트업 사업화 패키지 지원사업</a></li>
								<li data-location-sub='액셀러레이팅 프로그램'><a href="<c:url value='/program/accelerating' />">액셀러레이팅 프로그램</a></li>
								<li data-location-sub='스타트업 전문교육'><a href="<c:url value='/program/training' />">스타트업 전문교육</a></li>
								<li data-location-sub='하남도시공사 창업경진대회'><a href="<c:url value='/program/competition' />">하남도시공사 창업경진대회</a></li>
								<li data-location-sub='투자유치 역량 강화 프로그램'><a href="<c:url value='/program/empowering' />">투자유치 역량 강화 프로그램</a></li>
								<li data-location-sub='네트워킹 데이'><a href="<c:url value='/program/networking' />">네트워킹 데이</a></li>
								<li data-location-sub='멘토링 프로그램'><a href="<c:url value='/program/mentoring' />">멘토링 프로그램</a></li>
								<li data-location-sub='스타트업캠퍼스 멤버쉽 프로그램'><a href="<c:url value='/program/membership' />">스타트업캠퍼스 멤버쉽 프로그램</a></li>
			                </ul>
			            </li>
			            <li>
			                <a href="<c:url value='/partner/management' />">기업소개</a>
			                <ul class="dep02">
			                    <li data-location-sub='기업 실적'><a href="<c:url value='/partner/management' />" class="dep01_name">기업실적</a></li>
			                    <li data-location-sub='입주기업 소개'><a href="<c:url value='/partner/list' />">입주기업</a></li>
			                    <li data-location-sub='졸업기업 소개'><a href="<c:url value='/partner/graduate/list' />">졸업기업</a></li>
			                    <li data-location-sub='기업소식'><a href="<c:url value='/partner/activity/list' />">기업소식</a></li>
			                    <li data-location-sub='소개 영상'><a href="<c:url value='/partner/media/list' />">소개영상</a></li>
			                </ul>
			            </li>
			            <li>
			                <a href="<c:url value='/announce/notice/list' />">알림마당</a>
			                <ul class="dep02">
			                    <li data-location-sub='공지사항'><a href="<c:url value='/announce/notice/list' />" class="dep01_name">공지사항</a></li>
			                    <li data-location-sub='사업공고'><a href="<c:url value='/announce/announcement/list' />">사업공고</a></li>
			                    <li data-location-sub='보도자료'><a href="<c:url value='/announce/press/list' />">보도자료</a></li>
			                    <li data-location-sub='자주 묻는 질문'><a href="<c:url value='/announce/faq/list' />">자주하는 질문</a></li>
			                </ul>
			            </li>
			            <li>
			                <a href="<c:url value='/newsletter/list' />">뉴스레터</a>
			                <ul class="dep02">
			                    <li data-location-sub='뉴스레터'><a href="<c:url value='/newsletter/list' />" class="dep01_name">뉴스레터</a></li>
			                    <li data-location-sub='구독신청'><a href="https://page.stibee.com/subscriptions/197616">구독신청</a></li>
			                </ul>
			            </li>
			            <sec:authorize ifAnyGranted="ROLE_USER">
			            <li>
			                <a href="<c:url value='/user/partner/notice/list' />">입주기업 전용공간</a>
			                <ul class="dep02">
			                    <li data-location-sub='마이페이지'><a href="<c:url value='/user/mypage' />" class="dep01_name">마이페이지</a></li>
			                    <li data-location-sub='입주기업 공지사항'><a href="<c:url value='/user/partner/notice/list' />">공지사항</a></li>
			                    <li data-location-sub='입주기업 커뮤니티'><a href="<c:url value='/user/community/list' />">입주기업 커뮤니티</a></li>
			                    <li data-location-sub='서식 자료실'><a href="<c:url value='/user/file/list' />">서식 자료실</a></li>
			                    <li data-location-sub='회의실 예약 및 현황'><a href="<c:url value='/book/place' />">회의실 예약 및 현황</a></li>
			                    <li data-location-sub='기업 소식 업로드'><a href="<c:url value='/user/partner/activity/write/form' />">기업소식 업로드</a></li>
			                </ul>
			            </li>
			            </sec:authorize>
			            <sec:authorize ifAnyGranted="ROLE_ADMIN">
			            <li>
			                <a href="<c:url value='/admin/webpage/introduce/profile/edit/form' />">관리자 메뉴</a>
			                <ul class="dep02">
								<li data-location-sub='캠퍼스 소개'><a href="<c:url value='/admin/webpage/introduce/profile/edit/form' />">캠퍼스 소개</a></li>
								<li data-location-sub='알림마당'><a href="<c:url value='/admin/announce/notice/write/form' />">알림마당</a></li>
								<!-- <li data-location-sub='아카이브'><a href="<c:url value='/admin/gallery/press/write/form' />">아카이브</a></li> -->
								<li data-location-sub='팝업 관리'><a href="<c:url value='/popUp/popUpList' />">팝업 관리</a></li>
								<li data-location-sub='입주기업 관련'><a href="<c:url value='/admin/partner/notice/list' />">입주기업 관련</a></li>
								<li data-location-sub='패밀리사이트'><a href="<c:url value='/admin/family-site/list' />">패밀리사이트</a></li>
								<li data-location-sub='뉴스레터'><a href="<c:url value='/admin/newsletter/list' />">뉴스레터</a></li>
			                </ul>
			            </li>
			            </sec:authorize>
			        </ul>
			    </nav>
			    
		        <sec:authorize access="isAnonymous()">
			    <div class="util">
			        <a href="#"><img src="<c:url value='/resources/img/search_ico.png' />" alt="검색"></a>
			        	<a href="<c:url value='/user/login/form'/>">로그인</a>
	        	</div>
		        </sec:authorize>
		        
		        <sec:authorize ifAnyGranted="ROLE_ADMIN">
				<form id="logout" method="POST" action="<c:url value='/user/logout' />">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			    <div class="util">
			        <a href="#"><img src="<c:url value='/resources/img/search_ico.png' />" alt="검색"></a>
		        	<a href="javascript:void(0);" onclick="logout.submit();">로그아웃</a>
				</div>
		        </sec:authorize>
		        
		        <sec:authorize ifAnyGranted="ROLE_USER">
				<form id="logout" method="POST" action="<c:url value='/user/logout' />">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			    <div class="util">
			        <a href="#"><img src="<c:url value='/resources/img/search_ico.png' />" alt="검색"></a>
		        	<a href="javascript:void(0);" onclick="logout.submit();">로그아웃</a>
				</div>
		        </sec:authorize>
		        
			    <div class="menu_dummy"></div>
			</div>

        </header>
	
	    <div class="search_modal">
	        <div class="top_search_modal">
	            <h3>전체 검색</h3>
	            <button><img src="<c:url value='/resources/img/back_ico.png' />" alt="뒤로가기"></button>            
	        </div>
	        <div class="btm_search_modal">
	            <strong>통합검색</strong>
	            <p>통합 검색 결과를 알 수 있습니다. 궁금하신 내용을 입력해 주세요</p>
	            <form>
	                <input type="text" name="keyword" placeholder="검색어를 입력하세요.">
	                <button type="submit" class="search_btn">검색</button>
	            </form>
	        </div>
	    </div><!--search_modal-->
	    <div class="modal_dummy"></div><!--modal_dummy 검색뒷배경-->
	    
	    
	    
	    
	    
	    
	    