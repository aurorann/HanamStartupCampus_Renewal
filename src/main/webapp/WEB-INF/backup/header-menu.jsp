<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

    <section class="sub-top">

        <header>
            <!-- Header desktop -->
            <div class="container-menu-desktop">
                
                <div class="wrap-menu-desktop">
                    <div class="limiter-menu-desktop">
                        
                        <!-- Logo desktop -->		
                        <a href="<c:url value='/home' />" class="logo">
                            <img src="<c:url value='/resources/img/logo.png' />" alt="하남스타트업캠퍼스">
                        </a>
    
                        <!-- Menu desktop -->
                        <div class="menu-desktop gnb">
                            <ul class="main-menu">
                                <li class="main-menu-title" data-location-main='캠퍼스 소개'>
                                    <a href="<c:url value='/introduce/greeting' />">캠퍼스 소개</a>
                                </li>
                
                                <li class="main-menu-title" data-location-main='알림마당'>
                                    <a href="<c:url value='/announce/notice/list' />">알림마당</a>
                                </li>
                
                                <li class="main-menu-title" data-location-main='사업 안내'>
                                    <a href="<c:url value='/program/supporting' />">사업 안내</a>
                                </li>
                
                                <li class="main-menu-title" data-location-main='입주기업'>
                                    <a href="<c:url value='/partner/list' />">입주기업 · 졸업기업</a>
                                </li>
                
                                <li class="main-menu-title" data-location-main='아카이브'>
                                    <a href="<c:url value='/gallery/press/list' />">아카이브</a>
                                </li>
                
                                <li class="main-menu-title" data-location-main='뉴스레터'>
                                    <a href="<c:url value='/newsletter/list' />">뉴스레터</a>
                                </li>
                                
                                <sec:authorize access="isAnonymous()">
                                    <li class="main-menu-title" data-location-main='사용자 로그인'>
		                        		<a href="<c:url value='/user/login/form' />">사용자 로그인</a>
		                        	</li>
	                        	</sec:authorize>
	                        	
	                        	<sec:authorize ifAnyGranted="ROLE_USER">
	                        		<li class="main-menu-title" data-location-main='입주기업 전용공간'>
	                        			<a href="<c:url value='/user/partner/notice/list' />">입주기업 전용공간</a>
	                        		</li>
	                        	</sec:authorize>
	                        	
	                        	<sec:authorize ifAnyGranted="ROLE_ADMIN">
	                        		<li class="main-menu-title" data-location-main='관리자 메뉴'>
		                        		<a href="<c:url value='/admin/announce/notice/write/form' />">관리자 메뉴</a>
		                        	</li>
	                        	</sec:authorize>
                            </ul>
                        </div>
                    
                        
                    </div>

                    <div class="search-box">
                        <a href="javascript:openModal('all-search');"></a>
                    </div>

                    <div class="r-modal"></div>
                        <div class="modal-con all-search">
                            <a href="javascript:void(0);" class="close"><img src="<c:url value='/resources/img/close-btn.png'/>" alt="검색창 닫기 버튼"></a>
                            <div class="modal-title">
                                <h3><img src="<c:url value='/resources/img/sub-title.png'/>" alt="타이틀 헤딩 이미지">&nbsp;&nbsp;전체 검색</h3>
                            </div>
                            <div class="con">
                                <h2 class="hidden">전체 검색</h2> 
                                <div class="ent-title">
                                    <h3 class="m-title"><strong>통합검색</strong></h3>
                                    <p>통합 검색 결과를 알 수 있습니다. 궁금하신 내용을 입력해 주세요.</p>
                                </div>
                                	<form action="<c:url value='/search/total/list' />" method="get" onsubmit="return goToTotalSearchView(this);">
                                	<div class="sm-main-box pink-bar">
                                    
										<input type="text" placeholder="검색어를 입력하세요." style="width:70%;" name="keyword">
                                    	<button type="submit" class="search-btn" style="width:20%;">검색</button>
									
                        
                                	</div>
                                </form>
                            </div>
                        </div>
    
                    <!-- <div class="lnb_wrap" style="height: 270px;"> -->
                    <div class="lnb_wrap">
		                <div class="for_line">
		                    <div class="dep02_wrap">
		                        <ul class="dep02">
	                                    <li data-location-sub='인사말'><a href="<c:url value='/introduce/greeting' />">인사말</a></li>
	                                    <li data-location-sub='캠퍼스 개요'><a href="<c:url value='/introduce/profile' />">캠퍼스 개요</a></li>
	                                    <li data-location-sub='시설 안내'><a href="<c:url value='/introduce/facility' />">시설 안내</a></li>
	                                    <li data-location-sub='소개 영상'><a href="<c:url value='/introduce/media/list' />">소개 영상</a></li>
	                                    <li data-location-sub='조직 및 연락처'><a href="<c:url value='/introduce/contract' />">조직 및 연락처</a></li>
	                                    <li data-location-sub='오시는 길'><a href="<c:url value='/introduce/direction' />">오시는 길</a></li>
		                        </ul>
		                        <ul class="dep02">
		                                <li data-location-sub='공고'><a href="<c:url value='/announce/notice/list' />">공고</a></li>
		                                <li data-location-sub='바이오 정책 · 지원'><a href="<c:url value='/announce/agency/list' />">바이오 정책 · 지원</a></li>
		                                <li data-location-sub='자주 묻는 질문'><a href="<c:url value='/announce/faq/list' />">자주 묻는 질문</a></li>
		                        </ul>
		                        <ul class="dep02">
		                            <li data-location-sub='스타트업 사업화 패키지 지원사업'><a href="<c:url value='/program/supporting' />">스타트업 사업화 패키지 지원사업</a></li>
									<li data-location-sub='액셀러레이팅 프로그램'><a href="<c:url value='/program/accelerating' />">액셀러레이팅 프로그램</a></li>
									<li data-location-sub='스타트업 전문교육'><a href="<c:url value='/program/training' />">스타트업 전문교육</a></li>
									<li data-location-sub='하남도시공사 창업경진대회'><a href="<c:url value='/program/competition' />">하남도시공사 창업경진대회</a></li>
									<li data-location-sub='투자유치 역량 강화 프로그램'><a href="<c:url value='/program/empowering' />">투자유치 역량 강화 프로그램</a></li>
									<li data-location-sub='네트워킹 데이'><a href="<c:url value='/program/networking' />">네트워킹 데이</a></li>
									<li data-location-sub='멘토링 프로그램'><a href="<c:url value='/program/mentoring' />">멘토링 프로그램</a></li>
									<li data-location-sub='스타트업캠퍼스 멤버쉽 프로그램'><a href="<c:url value='/program/membership' />">스타트업캠퍼스 멤버쉽 프로그램</a></li>
		                        </ul>
		                        <ul class="dep02">
		                               <li data-location-sub='입주기업 소개'><a href="<c:url value='/partner/list' />">입주기업 소개</a></li>
		                               <li data-location-sub='졸업기업 소개'><a href="<c:url value='/partner/graduate/list' />">졸업기업 소개</a></li>
		                               <li data-location-sub='소개 영상'><a href="<c:url value='/partner/media/list' />">소개 영상</a></li>
		                               <li data-location-sub='기업 활동'><a href="<c:url value='/partner/activity/list' />">기업 활동</a></li>
		                               <li data-location-sub='기업 실적'><a href="<c:url value='/partner/management' />">기업 실적</a></li>
		                               <li data-location-sub='기업 커뮤니티'><a href="<c:url value='/partner/community/list' />">기업 커뮤니티</a></li>
		                        </ul>
		                        <ul class="dep02">
		                                <li data-location-sub='보도자료'><a href="<c:url value='/gallery/press/list' />">보도자료</a></li>
		                                <li data-location-sub='홍보자료'><a href="<c:url value='/gallery/promotion/list' />">홍보자료</a></li>
		                                <li data-location-sub='바이오 소식'><a href="<c:url value='/gallery/bio-info/list' />">바이오 소식</a></li>
		                        </ul>
		                        <ul class="dep02">
		                                <li data-location-sub='뉴스레터'><a href="<c:url value='/newsletter/list' />">뉴스레터</a></li>
		                                <li data-location-sub='구독신청'><a href="https://page.stibee.com/subscriptions/197616">구독신청</a></li>
		                        </ul>
		                        
		                        	<sec:authorize access="isAnonymous()">
		                        	<ul class="dep02">
		                            		<li data-location-sub='로그인'><a href="<c:url value='/user/login/form'/>">로그인</a></li>
		                        	</ul>
		                        	</sec:authorize>
		                        	
		                        	<sec:authorize ifAnyGranted="ROLE_USER">
			                        	<form id="logout" method="POST" action="<c:url value='/user/logout' />">
			                            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			                            </form>
			                        	<ul class="dep02">
				                            	<li data-location-sub='마이페이지'><a href="<c:url value='/user/mypage' />">마이페이지</a></li>
					                            <li data-location-sub='입주기업 알림공간'><a href="<c:url value='/user/partner/notice/list' />">입주기업 알림공간</a></li>
					                            <li data-location-sub='회의실 예약 및 현황'><a href="<c:url value='/book/place' />">회의실 예약 및 현황</a></li>
					                            <li data-location-sub='기업 활동 글쓰기'><a href="<c:url value='/user/partner/activity/write/form' />">기업 활동 글쓰기</a></li>
				                                <li><a href="javascript:void(0);" onclick="logout[0].submit();">로그아웃</a></li>
			                        	</ul>
			                        	</sec:authorize>
			                        	
			                        	<sec:authorize ifAnyGranted="ROLE_ADMIN">
			                        	<form id="logout" method="POST" action="<c:url value='/user/logout' />">
			                            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			                            </form>
			                        	<ul class="dep02">
				                        		<li data-location-sub='캠퍼스 소개'><a href="<c:url value='/admin/introduce/media/write/form' />">캠퍼스 소개</a></li>
						                        <li data-location-sub='알림마당'><a href="<c:url value='/admin/announce/notice/write/form' />">알림마당</a></li>
						                        <li data-location-sub='아카이브'><a href="<c:url value='/admin/gallery/press/write/form' />">아카이브</a></li>
						                   		<li data-location-sub='팝업 관리'><a href="<c:url value='/popUp/popUpList' />">팝업 관리</a></li>
						                   		<li data-location-sub='입주기업 관련'><a href="<c:url value='/admin/partner/notice/list' />">입주기업 관련</a></li>
						                   		<li data-location-sub='패밀리사이트'><a href="<c:url value='/admin/family-site/list' />">패밀리사이트</a></li>
						                   		<li data-location-sub='뉴스레터'><a href="<c:url value='/admin/newsletter/write/form' />">뉴스레터</a></li>
				                                <li><a href="javascript:void(0);" onclick="logout[0].submit();">로그아웃</a></li>
			                        	</ul>
		                        	</sec:authorize>
		                    </div>
		                </div>
		            </div>
    
                </div>	
            </div>
    		 
            <!-- Header Mobile -->
            <div class="wrap-header-mobile">
                <!-- Logo moblie -->		
                <a href="<c:url value='/home' />" class="logo-mobile">
                    <img src="<c:url value='/resources/img/logo-dark.png'/>" alt="하남스타트업캠퍼스 로고">
                </a>
                
                <div class="mobile-search-box">
                    <span></span>
                </div>
                 <!-- Button show menu -->
                <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </div>
            </div>

            <!--모바일 검색 바-->
            <div class="mobile-search-slide">
                <h2 class="hidden">전체 검색</h2> 
                <div class="sm-main-box pink-bar">

                    <input type="text" placeholder="검색어를 입력하세요." style="width:70%; margin:0;">
                    <button type="button" class="search-btn" style="width:20%; margin:0;">검색</button>
        
                </div>
            </div>
    
    
    
             <!-- Menu Mobile -->
             <div class="menu-mobile">
    
                <ul class="main-menu-m bg-main">
                    <li class="bg-main">
                        <a href="<c:url value='/introduce/greeting' />">캠퍼스 소개</a>
                        <ul class="sub-menu-m">
                            <li data-location-sub='인사말'><a href="<c:url value='/introduce/greeting' />">인사말</a></li>
                            <li data-location-sub='캠퍼스 개요'><a href="<c:url value='/introduce/profile' />">캠퍼스 개요</a></li>
                            <li data-location-sub='시설 안내'><a href="<c:url value='/introduce/facility' />">시설 안내</a></li>
                            <li data-location-sub='소개 영상'><a href="<c:url value='/introduce/media/list' />">소개 영상</a></li>
                            <li data-location-sub='조직 및 연락처'><a href="<c:url value='/introduce/contract' />">조직 및 연락처</a></li>
                            <li data-location-sub='오시는 길'><a href="<c:url value='/introduce/direction' />">오시는 길</a></li>
                        </ul>
                        <span class="arrow-main-menu-m">
                            <img class="fa fa-angle-right" src="<c:url value='/resources/img/arrow_down_sm.png'/>" aria-hidden="true" alt="메뉴 열기">
                        </span>
                    </li>
    
                    <li class="bg-main">
                        <a href="<c:url value='/announce/notice/list' />">알림마당</a>
                        <ul class="sub-menu-m">
                            <li data-location-sub='공고'><a href="<c:url value='/announce/notice/list' />">공고</a></li>
                            <li data-location-sub='바이오 정책 · 지원'><a href="<c:url value='/announce/agency/list' />">바이오 정책 · 지원</a></li>
                            <li data-location-sub='자주 묻는 질문'><a href="<c:url value='/announce/faq/list' />">자주 묻는 질문</a></li>
                        </ul>
                        <span class="arrow-main-menu-m">
                            <img class="fa fa-angle-right" src="<c:url value='/resources/img/arrow_down_sm.png'/>" aria-hidden="true" alt="메뉴 열기">
                        </span>
                    </li>
    
                    <li class="bg-main">
                        <a href="<c:url value='/program/supporting' />">사업 안내</a>
                        <ul class="sub-menu-m">
                            <li data-location-sub='스타트업 사업화 패키지 지원사업'><a href="<c:url value='/program/supporting' />">스타트업 사업화 패키지 지원사업</a></li>
							<li data-location-sub='액셀러레이팅 프로그램'><a href="<c:url value='/program/accelerating' />">액셀러레이팅 프로그램</a></li>
							<li data-location-sub='스타트업 전문교육'><a href="<c:url value='/program/training' />">스타트업 전문교육</a></li>
							<li data-location-sub='하남도시공사 창업경진대회'><a href="<c:url value='/program/competition' />">하남도시공사 창업경진대회</a></li>
							<li data-location-sub='투자유치 역량 강화 프로그램'><a href="<c:url value='/program/empowering' />">투자유치 역량 강화 프로그램</a></li>
							<li data-location-sub='네트워킹 데이'><a href="<c:url value='/program/networking' />">네트워킹 데이</a></li>
							<li data-location-sub='멘토링 프로그램'><a href="<c:url value='/program/mentoring' />">멘토링 프로그램</a></li>
							<li data-location-sub='스타트업캠퍼스 멤버쉽 프로그램'><a href="<c:url value='/program/membership' />">스타트업캠퍼스 멤버쉽 프로그램</a></li>
                        </ul>
                        <span class="arrow-main-menu-m">
                            <img class="fa fa-angle-right" src="<c:url value='/resources/img/arrow_down_sm.png'/>" aria-hidden="true" alt="메뉴 열기">
                        </span>
                    </li>
    				
                    <li class="bg-main">
                        <a href="<c:url value='/partner/list' />">입주기업 · 졸업기업</a>
                        <ul class="sub-menu-m">
                            <li data-location-sub='입주기업 소개'><a href="<c:url value='/partner/list' />">입주기업 소개</a></li>
                            <li data-location-sub='졸업기업 소개'><a href="<c:url value='/partner/graduate/list' />">졸업기업 소개</a></li>
                            <li data-location-sub='소개 영상'><a href="<c:url value='/partner/media/list' />">소개 영상</a></li>
                            <li data-location-sub='기업 활동'><a href="<c:url value='/partner/activity/list' />">기업 활동</a></li>
                            <li data-location-sub='기업 실적'><a href="<c:url value='/partner/management' />">기업 실적</a></li>
                            <li data-location-sub='기업 커뮤니티'><a href="<c:url value='/partner/management' />">기업 커뮤니티</a></li>
                        </ul>
                        <span class="arrow-main-menu-m">
                            <img class="fa fa-angle-right" src="<c:url value='/resources/img/arrow_down_sm.png'/>" aria-hidden="true" alt="메뉴 열기">
                        </span>
                    </li>
    
                    <li class="bg-main">
                        <a href="<c:url value='/gallery/press/list' />">아카이브</a>
                        <ul class="sub-menu-m">
                            <li data-location-sub='보도자료'><a href="<c:url value='/gallery/press/list' />">보도자료</a></li>
                            <li data-location-sub='홍보자료'><a href="<c:url value='/gallery/promotion/list' />">홍보자료</a></li>
                            <li data-location-sub='바이오 소식'><a href="<c:url value='/gallery/bio-info/list' />">바이오 소식</a></li>
                        </ul>
                        <span class="arrow-main-menu-m">
                            <img class="fa fa-angle-right" src="<c:url value='/resources/img/arrow_down_sm.png'/>" aria-hidden="true" alt="메뉴 열기">
                        </span>
                    </li>
    				
    				<!-- Secured -->
    				<li class="bg-main">
    					<sec:authorize access="isAnonymous()">
                        	<a href="<c:url value='/user/login/form' />">사용자 로그인</a>
                        	<ul class="sub-menu-m">
	                            <li><a href="<c:url value='/user/login/form' />">로그인</a></li>
	                        </ul>
                        </sec:authorize>
                         <sec:authorize ifAnyGranted="ROLE_USER">
                        	<a href="<c:url value='/user/partner/notice/list' />">입주기업 전용공간</a>
                        	<form id="logout" method="POST" action="<c:url value='/user/logout' />">
                            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                        	<ul class="sub-menu-m">
	                            <li data-location-sub='마이페이지'><a href="<c:url value='/user/mypage' />">마이페이지</a></li>
	                            <li data-location-sub='입주기업 알림공간'><a href="<c:url value='/user/partner/notice/list' />">입주기업 알림공간</a></li>
	                            <li data-location-sub='회의실 예약 및 현황'><a href="<c:url value='/book/place' />">회의실 예약 및 현황</a></li>
	                            <li data-location-sub='기업 활동 글쓰기'><a href="<c:url value='/user/partner/activity/write/form' />">기업 활동 글쓰기</a></li>
                                <li><a href="javascript:void(0);" onclick="logout[0].submit();">로그아웃</a></li>
	                        </ul>
                        </sec:authorize>
                        
                        <sec:authorize ifAnyGranted="ROLE_ADMIN">
                        	<a href="<c:url value='/admin/announce/notice/write/form' />">관리자 메뉴</a>
                        	<form id="logout" method="POST" action="<c:url value='/user/logout' />">
                            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                        	<ul class="sub-menu-m">
                        		<li data-location-sub='캠퍼스 소개'><a href="<c:url value='/admin/introduce/media/write/form' />">캠퍼스 소개</a></li>
		                        <li data-location-sub='알림마당'><a href="<c:url value='/admin/announce/notice/write/form' />">알림마당</a></li>
		                        <li data-location-sub='아카이브'><a href="<c:url value='/admin/gallery/press/write/form' />">아카이브</a></li>
		                   		<li data-location-sub='팝업 관리'><a href="<c:url value='/popUp/popUpList' />">팝업 관리</a></li>
		                   		<li data-location-sub='입주기업 관련'><a href="<c:url value='/admin/partner/notice/list' />">입주기업 관련</a></li>
		                   		<li data-location-sub='패밀리사이트'><a href="<c:url value='/admin/family-site/list' />">패밀리사이트</a></li>
		                   		<li data-location-sub='뉴스레터'><a href="<c:url value='/admin/newsletter/write/form' />">뉴스레터</a></li>
                                <li><a href="javascript:void(0);" onclick="logout[0].submit();">로그아웃</a></li>
	                        </ul>
                        </sec:authorize>
                        
                        <span class="arrow-main-menu-m">
                            <img class="fa fa-angle-right" src="<c:url value='/resources/img/arrow_down_sm.png'/>" aria-hidden="true" alt="메뉴 열기">
                        </span>
                    </li>
					<!-- Secured -->
                    
                    
                </ul>
			</div>
        </header>

        <div class="sub-title">
            <div class="inner">
                <h1>${locationMain}<span class="vertical-bar"> |</span> <span>${locationSub}</span></h1>
            </div>   
        </div>
    </section>