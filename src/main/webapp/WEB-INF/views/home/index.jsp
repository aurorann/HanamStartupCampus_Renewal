<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="ko">
<head>


<!-- # common: head start -->
<%@ include file="/WEB-INF/head.jsp"%>
<!-- # common: head end -->
</head>

<body>
	<!-- # common: header-menu start -->
	<%@ include file="/WEB-INF/header-menu-index.jsp"%>
	<!-- # common: header-menu end -->

    <main>
        <section class="main_swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="txt_title">
                        <strong>Hanam Urban Innovation Corporation</strong>
                        <h2>하남 스타트업 캠퍼스</h2>
                        <span>미래를 창조하고, 새로운 가능성을 위한 든든한 파트너</span>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="txt_title">
                        <strong>Hanam Urban Innovation Corporation</strong>
                        <h2>하남 스타트업 캠퍼스2</h2>
                        <span>미래를 창조하고, 새로운 가능성을 위한 든든한 파트너</span>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="txt_title">
                        <strong>Hanam Urban Innovation Corporation</strong>
                        <h2>하남 스타트업 캠퍼스3</h2>
                        <span>미래를 창조하고, 새로운 가능성을 위한 든든한 파트너</span>
                    </div>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </section><!--main_swiper-->

        <section class="news">
            <div class="in_1400">
                <h3 class="main_title"><span>하남소식</span> 한눈에 보기</h3>
                <div class="tab_list">
                    <button type="button" data-tab="new_tab1" class="active">공지사항</button>
                    <button type="button" data-tab="new_tab2">정책·지원</button>
                    <a href="<c:url value='/announce/notice/list' />" class="more_btn">더보기</a>
                </div>

                <div id="new_tab1" class="news_swiper active">
                    <ul class="swiper-wrapper">
                    	<!-- 
                        <li class="swiper-slide">
                            <a href="#">
                                <strong class="board_label  board_label_Ggongo">주요공고</strong>
                                <h4>
                                    2024 하남스타트업 캠퍼스 맨토링 프로그램 자문위원 모집 공고
                                    <img src="<c:url value='/resources/img/new.png' />" alt="새공고">
                                </h4>
                                <time datetime="2024-05-17"><img src="<c:url value='/resources/img/calendar_ico.png' />" alt="달력">2024.05.17 ~ 2024.05.17</time>
                            </a>
                        </li>
                         -->
                    </ul>
                </div><!--news_swiper 탭1-->
                <div id="new_tab2" class="news_swiper">
                    <ul class="swiper-wrapper">
                    	<!-- 
                        <li class="swiper-slide">
                            <a href="#">
                                <strong class="board_label board_label_Ggongo">주요공고</strong>
                                <h4>
                                    2024 하남스타트업 캠퍼스 맨토링 프로그램 자문위원 모집 공고2
                                    <img src="<c:url value='/resources/img/new.png' />" alt="새공고">
                                </h4>
                                <time datetime="2024-05-17"><img src="<c:url value='/resources/img/calendar_ico.png' />" alt="달력">2024.05.17 ~ 2024.05.17</time>
                            </a>
                        </li>
                         -->
                    </ul>
                </div><!--news_swiper 탭2-->
            </div>
        </section><!--news-->

        <section class="company_letter in_1400">
            <div class="company">
                <div class="main_title_wrap">
                    <h3 class="main_title">입주기업 <span>소개영상</span></h3>
                    <a href="#" class="more_btn">더보기</a>
                </div>
                <iframe width="100%" height="380" src="https://www.youtube.com/embed/rXiGsJTdc6w?si=QpsFg8aQWJw68Chq" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div><!--company-->

            <div class="letter">
                <div class="main_title_wrap">
                    <h3 class="main_title">뉴스레터</h3>
                    <a href="<c:url value='/newsletter/list' />" class="more_btn">더보기</a>
                </div>
                <a href="#">뉴스레터_bg</a>
            </div><!--letter-->
        </section><!--company_letter-->

        <section class="business">
            <div class="in_1400">
                <h3 class="main_title">사업안내</h3>
                <p class="main_article">하남 스타트업 캠퍼스가 추진하는 사업을 소개합니다.</p>

                <div class="business_swiper">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide">
                            <a href="<c:url value='/program/supporting' />">
                                <div class="img_box">
                                    <img src="<c:url value='/resources/img/business_img1.png' />" alt="스타트업 사업화 패키지 지원사업">
                                </div>
                                <h4>스타트업 사업화<br>패키지 지원사업</h4>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="<c:url value='/program/accelerating' />">
                                <div class="img_box">
                                    <img src="<c:url value='/resources/img/business_img2.png' />" alt="액셀러레이팅 프로그램">
                                </div>
                                <h4>액셀러레이팅<br>프로그램</h4>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="<c:url value='/program/training' />">
                                <div class="img_box">
                                    <img src="<c:url value='/resources/img/business_img3.png' />" alt="스타트업 전문교육">
                                </div>
                                <h4>스타트업<br>전문교육</h4>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="c:url value='/program/competition' />">
                                <div class="img_box">
                                    <img src="<c:url value='/resources/img/business_img4.png' />" alt="하남도시공사 창업경진대회">
                                </div>
                                <h4>하남도시공사<br>창업경진대회</h4>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="<c:url value='/program/empowering' />">
                                <div class="img_box">
                                    <img src="<c:url value='/resources/img/business_img1.png' />" alt="투자유치 역량 강화 프로그램">
                                </div>
                                <h4>투자유치 역량<br>강화 프로그램</h4>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="<c:url value='/program/networking' />">
                                <div class="img_box">
                                    <img src="<c:url value='/resources/img/business_img2.png' />" alt="네트워킹 데이">
                                </div>
                                <h4>네트워킹<br>데이</h4>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="<c:url value='/program/mentoring' />">
                                <div class="img_box">
                                    <img src="<c:url value='/resources/img/business_img3.png' />" alt="멘토링 프로그램">
                                </div>
                                <h4>멘토링<br>프로그램</h4>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="<c:url value='/program/membership' />">
                                <div class="img_box">
                                    <img src="<c:url value='/resources/img/business_img4.png' />" alt="스타트업캠퍼스 멤버쉽 프로그램">
                                </div>
                                <h4>스타트업캠퍼스<br>멤버쉽 프로그램</h4>
                            </a>
                        </li>
                    </ul>
                    <div class="swiper-button">
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                        <a href="#" class="more_btn">더보기</a>
                    </div>
                </div>
            </div>
        </section><!--business-->

       <section class="question_bio in_1400">
            <div class="question">
                <div class="main_title_wrap">
                    <h3 class="main_title">자주하는 <span>질문</span></h3>
                    <a href="#" class="more_btn">더보기</a>
                </div>

                <ul class="question_list">
                    <li><a href="#"><span>Q.</span>창업기업 또는 소속 기관정보는 어떻게 등록해야 하나요?</a></li>
                    <li><a href="#"><span>Q.</span>개인으로 회원 가입시 가입자는 대표자로 등록 되나요?</a></li>
                    <li><a href="#"><span>Q.</span>이미 제출한 창업기업 확인 신청서 수정도 가능한가요?</a></li>
                    <li><a href="#"><span>Q.</span>창업기업 확인서는 신청부터 발급까지 소요되는 기간이 어느정도나요?</a></li>
                </ul>
            </div><!--question-->

            <div class="bio">
                <div class="bio_title_wrap">
                    <h3 class="main_title">바이오  <span>정책·지원</span></h3>
                    <div class="swiper-button">
                        <button class="swiper-button-prev"></button>
                        <button class="swiper-button-next"></button>
                        <a href="#" class="more_btn">더보기</a>
                    </div>
                </div>
                 
                <div class="bio_swiper">
                    <div class="swiper-wrapper">
                        <ul class="swiper-slide">
                            <li>
                                <a href="#">
                                    <strong class="board_label board_label_Ggongo">주요공고</strong>
                                    <h4>미국 바이오 시장진출 역량강화 교육 및 컨설팅 프로그램 참여 기업 모집</h4>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <strong class="board_label board_label_Ggongi">주요공지</strong>
                                    <h4>미국 바이오 시장진출 역량강화 교육 및 컨설팅 프로그램 참여 기업 모집</h4>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <strong class="board_label board_label_gongo">공고</strong>
                                    <h4>미국 바이오 시장진출 역량강화 교육 및 컨설팅 프로그램 참여 기업 모집</h4>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <strong class="board_label board_label_gongo">공지</strong>
                                    <h4>미국 바이오 시장진출 역량강화 교육 및 컨설팅 프로그램 참여 기업 모집</h4>
                                </a>
                            </li>
                        </ul>
                        <ul class="swiper-slide">
                            <li>
                                <a href="#">
                                    <strong class="board_label board_label_Ggongo">주요공고</strong>
                                    <h4>조규홍 복지장관 "미래 먹거리 바이오헬스산업, 규제혁신 적극 지원"</h4>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <strong class="board_label board_label_Ggongi">주요공지</strong>
                                    <h4>조규홍 복지장관 "미래 먹거리 바이오헬스산업, 규제혁신 적극 지원"</h4>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <strong class="board_label board_label_gongo">공고</strong>
                                    <h4>조규홍 복지장관 "미래 먹거리 바이오헬스산업, 규제혁신 적극 지원"</h4>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <strong class="board_label board_label_gongo">공지</strong>
                                    <h4>조규홍 복지장관 "미래 먹거리 바이오헬스산업, 규제혁신 적극 지원"</h4>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div><!--bio-->
        </section><!--question_bio-->

        <section class="perf">
            <div class="in_1400">
                <h3 class="main_title">기업실적</h3>
                <p class="main_article">하남의 자랑스러운 영업실적을 보여드립니다.</p>

                <ul class="perf_list">
                    <li>
                        <a href="#">
                            <img src="<c:url value='/resources/img/perf_ico1.png' />" alt="수주실적">
                            <strong>195<span>억</span></strong>
                            <h4>수주실적</h4>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="<c:url value='/resources/img/perf_ico2.png' />" alt="매출실적">
                            <strong>58<span>억</span></strong>
                            <h4>매출실적</h4>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="<c:url value='/resources/img/perf_ico3.png' />" alt="투자유치 실적">
                            <strong>206<span>억</span></strong>
                            <h4>투자유치 실적</h4>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="<c:url value='/resources/img/perf_ico4.png' />" alt="융자및보증 실적">
                            <strong>52<span>억</span></strong>
                            <h4>융자및보증 실적</h4>
                        </a>
                    </li>
                </ul>
            </div>
        </section><!--perf-->

        <section class="ent_introduce in_1400">
            <div class="text_ent">
                <img src="<c:url value='/resources/img/green_ico.png' />" alt="기업소개">
                <p>
                    하남 스타트업 캠퍼스가 제공하는 창업공간과<br>
                    함께 하고 있는스타트업을 소개합니다.
                </p>
            </div>

            <div class="ent_introduce_swiper_wrap">
                <div class="ent_introduce_swiper">
                    <ul class="swiper-wrapper" id="slider-div-sm2">
                    <!-- 
                        <li class="swiper-slide"><a href="#"><img src="img/닉스(주)_logo.png" alt="닉스(주)"></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/(주)스카이런_logo.png" alt="(주)스카이런"></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/메이즈(주)_logo.png" alt="메이즈(주)"></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/(주)타운즈_logo.png" alt="(주)타운즈"></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/(주)소금광장_logo.png" alt="(주)소금광장"></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/(주)고릴라금고.png" alt="(주)고릴라금고"></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/(주)파인더스.png" alt="(주)파인더스"></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/(주)진케어.png" alt="(주)진케어"></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/주식회사 에틱스템.png" alt="주식회사 에틱스템"></a></li>
                     -->
                    </ul>
                </div>
                <div class="swiper-button">
                    <button class="swiper-button-prev"></button>
                    <button class="swiper-button-next"></button>
                    <a href="#" class="more_btn">더보기</a>
                </div>
            </div>
        </section><!--ent_introduce-->
    </main>

	<!-- footer start -->
	<%@ include file="/WEB-INF/footer-index.jsp"%>
	<!-- footer end -->

	<!-- extension start -->
	<script>
		// 24시간 기준 쿠키 설정하기  
		// expiredays 후의 클릭한 시간까지 쿠키 설정  
		function setCookie(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + "=" + escape(value)
					+ "; path=${pageContext.request.contextPath}; expires="
					+ todayDate.toGMTString() + ";"
		}

		// 창닫기  
		function closeWin(winName, expiredays) {
			setCookie(encodeURIComponent(winName), "done", expiredays);
			//var obj = eval("window." + winName);

			/* console.log(winName);
			var url = location.href;
			url = rtnDomainName(url); */

			//window.open("./close.html", winName, "");
		}

		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = encodeURIComponent(cookieName) + "= "
					+ "; expires=" + expireDate.toGMTString();
		}

		function getCookie(cookieName) {
			cookieName = encodeURIComponent(cookieName) + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}

		function rtnDomainName(url) {
			url = url.split('//');
			url = url[1].substr(0, url[1].indexOf('/'));

			return url;
		}

		function openPop(name, content, link, width, height, left, top) {

			var url = location.href;
			url = rtnDomainName(url);

			var reject = getCookie(name);

			height = height * 1 + 30;

			if (!reject) {
				var popOption = "width=" + width + ", height=" + (height - 30)
						+ ", left=" + left + " , top=" + top
						+ ", resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

				var openWin = window.open("", name, popOption);

				openWin.document.getElementsByTagName("head")[0].innerHTML = "<title>"
						+ name
						+ "</title><style>img{max-width:100%}body{margin:0px !important; overflow: hidden;}</style>";

				if (!link || link === "") {
					openWin.document.getElementsByTagName("body")[0].innerHTML = content
							+ '<div id="div_laypopup" style="text-align: right;background-color: black;color: white;height: 30px;font-size: 13px;position: absolute;width: 100%;bottom: 0px;left: 0px;">'
							+ '<input type="checkbox" name="close" value="OK" onclick="javascript:window.opener.closeWin(\''
							+ name + '\', 1);">하루동안 이 창을 열지 않음  </div>';
				} else {
					openWin.document.getElementsByTagName("body")[0].innerHTML = content
							+ '<div id="div_laypopup" style="text-align: right;background-color: black;color: white;height: 30px;font-size: 13px;position: absolute;width: 100%;bottom: 0px;left: 0px;">'
							+ '<a style="color: white;float: left;margin-left: 10px; margin-top:5px;" href="javascript:void(0);"'
							+ 'onclick="(function(){opener.location.href=\''
							+ link
							+ '\'; self.close();})()">[바로가기]</a>'
							+ '<div style="margin-top: 5px;margin-right: 10px;">'
							+ '<input type="checkbox" name="close" value="OK" onclick="javascript:window.opener.closeWin(\''
							+ name
							+ '\', 1);window.close();"><span>하루동안 이 창을 열지 않음  </span>'
							+ '<a style="color: white; margin-left: 10px;margin-top: 5px;" href="javascript:void(0);" onclick="javascript:window.close();">[닫기]</a></div>'
							+ '</div>';

				}

				var imgCnt = $(openWin.document).find('img').length;

				for (var i = 0; i < imgCnt; i++) {
					$(openWin.document).find('img:eq(' + i + ')').attr(
							'src',
							window.location.protocol + "//"
									+ url
									+ $(openWin.document).find(
											'img:eq(' + i + ')').attr('src'));
				}
			}
		}

		$(function() {
			getNoticePostList(1);
			getAgencyPostList(1);
			//getMediaPostList(1);
			getPartnerMediaPostList(1);
			getPartnerInformationList();
			getNewsletterPostList();

			setFacilitySlider();
			initSlider("slider-div-sm0");

			var popList = new Array();

			<c:forEach items="${popUpList}" var="item">
			var pop = {}
			pop.title = '${item.title}';
			pop.contents = '${item.contents}';
			pop.link = '${item.link}';
			if (pop.link.indexOf("http://") < 0
					&& pop.link.indexOf("https://") < 0)
				pop.link = window.location.protocol + "//" + pop.link;
			pop.contents_width = ${item.contentsWidth};
			pop.contents_height = ${item.contentsHeight};
			pop.display_position_x = ${item.displayPositionX};
			pop.display_position_y = ${item.displayPositionY};
			popList.push(pop);
			</c:forEach>

			console.log(popList);

			for (var i = 0; i < popList.length; i++) {
				openPop(popList[i].title, popList[i].contents, popList[i].link,
						popList[i].contents_width, popList[i].contents_height,
						popList[i].display_position_x,
						popList[i].display_position_y);
			}

		})

		function setFacilitySlider() {
			var urlContext = '<c:url value="/resources/img/room/gallery" />';
			// var urlContext = 'img/room/gallery';

			var htmlStringArr = [ {
				description : "입구",
				image : "gallery_entrance03.jpg"
			}, {
				description : "인포데스크 이미지월",
				image : "gallery_infodesk.jpg"
			}, {
				description : "공유오피스 (좌측 방향)",
				image : "gallery_share01.jpg"
			}, {
				description : "공유오피스 (우측 방향)",
				image : "gallery_share02.jpg"
			}, {
				description : "공유키친",
				image : "gallery_kitchen.jpg"
			}, {
				description : "회의실 1",
				image : "gallery_meeting01.jpg"
			}, {
				description : "회의실 2 (외부회의실)",
				image : "gallery_meeting03.jpg"
			}, {
				description : "입주업체 사무실 외부",
				image : "gallery_office_partner01.jpg"
			}, {
				description : "입주업체 사무실 내부",
				image : "gallery_office_partner02.jpg"
			}, {
				description : "공유오피스 1",
				image : "gallery_restarea02.jpg"
			}, {
				description : "공유오피스 2",
				image : "gallery_restarea04.jpg"
			}, {
				description : "공유오피스 3",
				image : "gallery_restarea01.jpg"
			},

			/*
				{
					description: "",
				image: ".jpg"	
				},
			 */

			]
					.map(function(el) {
						return '<div>'
								+ '<img src="'
								+ urlContext
								+ '/'
								+ el.image
								+ '" alt="'
								+ el.description
								+ '" '
								+ 'onclick="location.href=\'<c:url value='/introduce/facility' />\';" style="cursor: pointer;">'
								+ '</div>';
					})
			$("#slider-div-sm1").html(htmlStringArr.join(""));

			initSlider("slider-div-sm1");
		}

		function getNoticePostList(curPage) {
			$.ajax({
						'type' : 'GET',
						cache : false,
						url : '<c:url value="/announce/notice/post/list" />',
						data : {
							curPage : curPage,
							keyword : "",
							searchType : "NONE"
						},
						success : function(res) {
							var fixedPost = res.Fixedpost;
							var commonPost = res.Commonpost;

							var htmlArr = [];

							fixedPost
									.every(function(el) {
										if (htmlArr.length >= 9)
											return false;
										var titleString = (el.title.length > 40) ? el.title
												.slice(0, 40)
												+ "..."
												: el.title;

										var fixedLabel = "";
										switch (el.level) {
										case "100":
											fixedLabel = '<strong class="board_label board_label_Ggongi">주요공지</strong>'
											break;
										case "101":
											fixedLabel = '<strong class="board_label  board_label_Ggongo">주요공고</strong>'
											break;
										}

										var fixedHTML = '<li class="swiper-slide">'
					                            + '<a href = \'<c:url value="/announce/notice/view" />/'
												+ el.seqId
												+ '\'">'
					                            + fixedLabel
					                            + '<h4>'
					                            + titleString
					                            + '<img src="<c:url value='/resources/img/new.png' />\" alt="새공고">'
					                            + '</h4>'
					                            + '<time datetime="2024-05-17">'
					                            + '<img src="<c:url value='/resources/img/calendar_ico.png' />\" alt="달력">'
				                                + el.contractStartAt
				                                + '~'
				                                + el.contractEndAt
					                            + '</time>'
					                            + '</a>'
					                        	+ '</li>';
		
										htmlArr.push(fixedHTML);

										return true;
									});

							commonPost
									.every(function(el) {
										if (htmlArr.length >= 9)
											return false;
										if (el.level === "100"
												|| el.level === "101")
											return true;
										var titleString = (el.title.length > 40) ? el.title
												.slice(0, 40)
												+ "..."
												: el.title;

										var commonLabel = "";
										switch (el.level) {
										case "102":
											commonLabel = '<strong class="board_label board_label_gongo">공지</strong>'
											break;
										case "103":
											commonLabel = '<strong class="board_label board_label_gongo">공고</strong>'
											break;
										}

										var commonHTML = '<li class="swiper-slide">'
				                            + '<a href = \'<c:url value="/announce/notice/view" />/'
											+ el.seqId
											+ '\'">'
				                            + commonLabel
				                            + '<h4>'
				                            + titleString
				                            + '<img src="<c:url value='/resources/img/new.png' />\" alt="새공고">'
				                            + '</h4>'
				                            + '<time datetime="2024-05-17">'
				                            + '<img src="<c:url value='/resources/img/calendar_ico.png' />\" alt="달력">'
			                                + el.contractStartAt
			                                + '~'
			                                + el.contractEndAt
				                            + '</time>'
				                            + '</a>'
				                        	+ '</li>';
										htmlArr.push(commonHTML);
										return true;
									});

							$("div#new_tab1 .swiper-wrapper").html(htmlArr.join(""));
						},
						error : function(error) {
							alert('공지/공고를 불러오지 못했습니다, 관리자에게 문의해주세요.');
						}
					});
		}

		function getAgencyPostList(curPage) {
			$
					.ajax({
						'type' : 'GET',
						cache : false,
						url : '<c:url value="/announce/agency/post/list" />',
						data : {
							curPage : curPage,
							keyword : "",
							searchType : "NONE"
						},
						success : function(res) {
							var commonPost = res.post;

							var htmlArr = [];

							commonPost
									.every(function(el) {
										if (htmlArr.length >= 7)
											return false;
										var titleString = (el.title.length > 40) ? el.title
												.slice(0, 40)
												+ "..."
												: el.title;

										var commonHTML = '<li class="swiper-slide">'
				                            + '<a href = \'<c:url value="/announce/notice/view" />/'
											+ el.seqId
											+ '\'">'
				                            + '<strong class="board_label board_label_gongo">소식</strong>'
				                            + '<h4>'
				                            + titleString
				                            + '<img src="<c:url value='/resources/img/new.png' />\" alt="새공고">'
				                            + '</h4>'
				                            + '<time datetime="2024-05-17">'
				                            + '<img src="<c:url value='/resources/img/calendar_ico.png' />\" alt="달력">'
			                                + el.createdAt
				                            + '</time>'
				                            + '</a>'
				                        	+ '</li>';

										htmlArr.push(commonHTML);
										return true;
									});

							$("div#new_tab2 .swiper-wrapper").html(htmlArr.join(""));
						},
						error : function(error) {
							alert('바이오 정책 · 지원을 불러오지 못했습니다, 관리자에게 문의해주세요.');
						}
					});
		}

		function getMediaPostList(curPage) {
			$
					.ajax({
						'type' : 'GET',
						cache : false,
						url : '<c:url value="/introduce/media/post/list" />',
						data : {
							curPage : curPage,
							keyword : "",
							searchType : "NONE"
						},
						success : function(res) {
							var commonPost = res.post;

							var htmlArr = [];

							commonPost
									.every(function(el) {
										var commonHTML = '<div>'
												+ '<img src="https://img.youtube.com/vi/'
												+ el.youtubeId
												+ '/mqdefault.jpg" alt="캠퍼스 소개영상 썸네일"'
												+ 'onclick="location.href=\'<c:url value='/introduce/media/view' />/'
												+ el.seqId
												+ '\';" style="cursor: pointer;">'
												+ '</div>';
										htmlArr.push(commonHTML);
										return true;
									});

							$("div#slider-div-sm0").html(htmlArr.join(""));

							initSlider("slider-div-sm0");
						},
						error : function(error) {
							alert('캠퍼스 소개 영상을 불러오지 못했습니다, 관리자에게 문의해주세요.');
						}
					});
		}

		function getPartnerInformationList(curPage) {
			$.ajax({
						'type' : 'GET',
						cache : false,
						url : '<c:url value="/partner/information/post/list" />',
						success : function(res) {
							var commonPost = res.post;

							var htmlArr = [];

							commonPost
									.every(function(el) {
										var urlString = (el.homepage.length > 25) ? el.homepage
												.slice(0, 22)
												+ "..."
												: el.homepage;

										var commonHTML = '<li class="swiper-slide">'
												+ '<a href="#">'
												+ '<img src="<c:url value='/upload/partner-represent' />/'
												+ el.profileImage
												+ '" alt="'
												+ el.name
												+ '">'
												+ '</a></li>';
										htmlArr.push(commonHTML);
										return true;
									});

							$("ul#slider-div-sm2").html(htmlArr.join(""));

							initSlider("slider-div-sm2");
						},
						error : function(error) {
							alert('입주기업 정보를 불러오지 못했습니다, 관리자에게 문의해주세요.');
						}
					});
		}

		function getPartnerMediaPostList(curPage) {
			$
					.ajax({
						'type' : 'GET',
						cache : false,
						url : '<c:url value="/partner/media/post/list" />',
						data : {
							curPage : curPage,
							keyword : "",
							searchType : "NONE"
						},
						success : function(res) {
							var commonPost = res.post;

							var htmlArr = [];

							commonPost
									.every(function(el) {
										var commonHTML = '<div>'
												+ '<img src="https://img.youtube.com/vi/'
												+ el.youtubeId
												+ '/mqdefault.jpg" alt="입주영상 소개영상 썸네일"'
												+ 'onclick="location.href=\'<c:url value='/partner/media/view' />/'
												+ el.seqId
												+ '\';" style="cursor: pointer;">'
												+ '</div>';
										htmlArr.push(commonHTML);
										return true;
									});

							$("div#slider-div-sm3").html(htmlArr.join(""));

							initSlider("slider-div-sm3");
						},
						error : function(error) {
							alert('입주기업 소개 영상을 불러오지 못했습니다, 관리자에게 문의해주세요.');
						}
					});
		}
		

		function getNewsletterPostList(curPage) {
			$.ajax({
						'type' : 'GET',
						cache : false,
						url : '<c:url value="/newsletter/post/list" />',
						success : function(res) {
							var commonPost = res.post[0];

							var commonHTML = '<div class="main_title_wrap">'
				                    + '<h3 class="main_title">뉴스레터</h3>'
				                    + '<a href="<c:url value='/newsletter/list' />" class="more_btn">더보기'
				                    + '</a>'
				                	+ '</div>'
				                	+ '<a href="<c:url value='/newsletter/view/' />/'
									+ commonPost.seqId
									+ '">'
				                	+ '뉴스레터_bg'
				                	+ '</a>';

							$("div.letter").html(commonHTML);

						},
						error : function(error) {
							alert('뉴스레터 정보를 불러오지 못했습니다, 관리자에게 문의해주세요.');
						}
					});
		}

		function initSlider(id) {
			$("#" + id)
					.slick(
							{
								slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
								infinite : true, //무한 반복 옵션	 
								slidesToShow : 1, // 한 화면에 보여질 컨텐츠 개수
								slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
								speed : 100, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
								arrows : true, // 옆으로 이동하는 화살표 표시 여부
								autoplay : true, // 자동 스크롤 사용 여부
								autoplaySpeed : 5000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
								pauseOnHover : true, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
								vertical : false, // 세로 방향 슬라이드 옵션
								prevArrow : "<button type='button' class='slick-prev " + id + "-button' style='display: none;'></button>", // 이전 화살표 모양 설정
								nextArrow : "<button type='button' class='slick-next " + id + "-button' style='display: none;'></button>", // 다음 화살표 모양 설정
								draggable : true, //드래그 가능 여부 

								responsive : [ // 반응형 웹 구현 옵션
								{
									breakpoint : 960, //화면 사이즈 960px
									settings : {
										//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
										slidesToShow : 1
									}
								}, {
									breakpoint : 768, //화면 사이즈 768px
									settings : {
										//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
										slidesToShow : 1
									}
								} ]
							}).on("mouseover", function() {
						$("button." + id + "-button").fadeIn(200);
					}).on("mouseleave", function() {
						$("button." + id + "-button").fadeOut(200);
					}).trigger("mouseleave");
		}
	</script>
	<!-- extension end -->


</body>
</html>