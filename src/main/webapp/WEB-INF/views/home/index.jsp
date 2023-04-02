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
<style>
.board-title {
	cursor: pointer;
}
</style>
</head>

<body>

	<div class="main-wrap">
		<!-- # common: header-menu start -->
		<%@ include file="/WEB-INF/header-menu-index.jsp"%>
		<!-- # common: header-menu end -->

		<div class="main-title">
			<div class="inner">
				<h1>
					<img src="<c:url value='/resources/img/main-title.png' />"
						alt="메인 페이지 타이틀 배경">
				</h1>
				<p>생각, 현실이 되다.</p>
			</div>
		</div>

		<div id="slider-div">
			<div>
				<img src="<c:url value='/resources/img/background1.jpg' />"
					alt="배경1">
			</div>
			<div>
				<img src="<c:url value='/resources/img/background2.jpg' />"
					alt="배경2">
			</div>
			<div>
				<img src="<c:url value='/resources/img/background4.jpg' />"
					alt="배경3">
			</div>
			<div>
				<img src="<c:url value='/resources/img/background5.jpg' />"
					alt="배경4">
			</div>
			<div>
				<img src="<c:url value='/resources/img/background6.jpg' />"
					alt="배경5">
			</div>
			<div>
				<img src="<c:url value='/resources/img/background7.jpg' />"
					alt="배경6">
			</div>
		</div>



		<div class="main-contents">
			<div class="inner">
				<div class="col-lg-12 main-cintents-wrap" style="margin: 0;">

					<div class="col-lg-2 white-box flrst-white-box">
						<div class="m-box-title">
							<h1>캠퍼스 소개</h1>
						</div>

						<div class="m-box-contents">
							<ul class="introduce1">
								<li>
									<!-- <h2>소개 영상</h2>  -->
									<div class="campus-video">
										<a href="<c:url value='/introduce/media/list' />"> <img
											src="<c:url value='/resources/img/campus-video.png' />"
											alt="캠퍼스 소개영상">
										</a>
									</div>
								</li>
								<li>
									<h2>시설 안내</h2>
									<div id="slider-div-sm1"></div>
								</li>
							</ul>
							<button class="more-btn"
								onclick="location.href='<c:url value="/introduce/greeting/" />' ">
								자세히 보기<img src="<c:url value='/resources/img/more-btn.png' />"
									alt="자세히 보기 버튼">
							</button>
							<!--수정!-->
						</div>
					</div>

					<div class="col-lg-2 blue-box" style="padding: 0 9px;">
						<div class="m-box-title">
							<h1>사업 안내</h1>
						</div>
						<div class="m-box-contents">
							<ul class="program-icon">
								<li><a href="<c:url value="/program/supporting" />">
										<div class="icon-box">
											<img src="<c:url value='/resources/img/main-icon7-sm.png' />"
												alt="">
										</div>
										<p>스타트업<br>패키지<br>지원사업</p>
								</a></li>
								<li><a href="<c:url value="/program/accelerating" />">
										<div class="icon-box">
											<img src="<c:url value='/resources/img/main-icon6-sm.png' />"
												alt="">
										</div>
										<p>
											액셀러레이팅<br>프로그램<br>
										</p>
								</a></li>
								<li><a href="<c:url value="/program/training" />">
										<div class="icon-box">
											<img src="<c:url value='/resources/img/main-icon1-sm.png' />"
												alt="">
										</div>
										<p>스타트업<br>전문교육<br>　</p>
								</a></li>
								
								
								<li><a href="<c:url value="/program/competition" />">
										<div class="icon-box">
											<img src="<c:url value='/resources/img/main-icon4-sm.png' />"
												alt="">
										</div>
										<p>하남도시공사<br>창업경진대회</p>
								</a></li>
								<li><a href="<c:url value="/program/empowering" />">
										<div class="icon-box">
											<img src="<c:url value='/resources/img/main-icon8-sm.png' />"
												alt="">
										</div>
										<p>
											투자유치<br>역량 강화<br>프로그램
										</p>
								</a></li>
								<li><a href="<c:url value="/program/networking" />">
										<div class="icon-box">
											<img src="<c:url value='/resources/img/main-icon5-sm.png' />"
												alt="">
										</div>
										<p>
											네트워킹<br>데이<br>　
										</p>
								</a></li>
								
								
								<li><a href="<c:url value="/program/mentoring" />">
										<div class="icon-box">
											<img src="<c:url value='/resources/img/main-icon9-sm.png' />"
												alt="">
										</div>
										<p>
											멘토링<br>프로그램
										</p>
								</a></li>
								<li><a href="<c:url value="/program/membership" />">
										<div class="icon-box">
											<img src="<c:url value='/resources/img/main-icon2-sm.png' />"
												alt="">
										</div>
										<p>
											스타트업<br>캠퍼스<br>멤버쉽
										</p>
								</a></li>
							</ul>
						</div>
					</div>

					<div class="col-lg-2 white-box">
						<div class="m-box-title">
							<h1>입주기업</h1>
						</div>

						<div class="m-box-contents">
							<ul class="introduce1">
								<li>
									<h2>입주기업 현황</h2>
									<div id="slider-div-sm2"></div>
								</li>
								<li>
									<h2>입주기업 소개영상</h2>
									<div id="slider-div-sm3"></div>
								</li>
							</ul>
							<button class="more-btn"
								onclick="location.href='<c:url value="/partner/list" />'">
								자세히 보기<img src="<c:url value='/resources/img/more-btn.png'/>"
									alt="자세히 보기 버튼">
							</button>
							<!--수정!-->
						</div>
					</div>

					<div class="col-lg-4 black-box" style="padding: 0;">
						<div id="board-tab">
							<ul class="tabs">
								<li class="active" rel="tab1">공고</li>
								<li rel="tab2">정책 · 지원</li>
							</ul>
							<div class="tab_container">
								<div id="tab1" class="tab_content">
									<table class="tab-table">
										<!-- <tr>
                                                    <td style="width:20%;"><span class="pink-label">주요</span></td>
                                                    <td style="width:60%;"><span class="board-title">하남시 기업 피해사례 신고센터 ...</span></td>
                                                    <td style="width:20%;"><small>2020-01-14</small></td>
                                                </tr> -->
									</table>
									<button class="more-btn"
										onclick="location.href = '<c:url value="/announce/notice/list" />'">
										자세히 보기<img src="<c:url value='/resources/img/more-btn.png' />"
											alt="자세히 보기 버튼">
									</button>
								</div>
								<!-- #tab1 -->
								<div id="tab2" class="tab_content">
									<table class="tab-table">
									</table>
									<button class="more-btn"
										onclick="location.href = '<c:url value="/announce/agency/list" />'">
										자세히 보기<img src="<c:url value='/resources/img/more-btn.png' />"
											alt="자세히 보기 버튼">
									</button>
								</div>
								<!-- #tab2 -->
							</div>
							<!-- .tab_container -->
						</div>
						<!-- #container -->
					</div>

					<!--sns 이동 버튼 추가--->

					<div class="sns-box">
						<div class="sns-title">
							<h1>
								SNS<br>바로가기
							</h1>
						</div>
						<div class="sns-contents">
							<ul>
								<li><a href="https://www.instagram.com/hanamstartup"><img
										src="<c:url value='/resources/img/hn-instagram.png' />"
										alt="하남스타트업캠퍼스인스타그램"></a></li>
								<li><a
									href="https://www.youtube.com/channel/UCIT4wZzDZCF2J9ppP6b-6Eg"><img
										src="<c:url value='/resources/img/hn-youtube.png' />"
										alt="하남스타트업캠퍼스유튜브"></a></li>
							</ul>
						</div>
					</div>

					<!--sns 이동 버튼 추가 끝--->


				</div>
			</div>
		</div>
	</div>

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
			$
					.ajax({
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
							var commonPost = res.post;

							var htmlArr = [];

							fixedPost
									.every(function(el) {
										if (htmlArr.length >= 10)
											return false;
										var titleString = (el.title.length > 15) ? el.title
												.slice(0, 15)
												+ "..."
												: el.title;

										var fixedLabel = "";
										switch (el.level) {
										case "100":
											fixedLabel = '<span class="pink-label">공지</span>'
											break;
										case "101":
											fixedLabel = '<span class="yellow-label">공고</span>'
											break;
										}

										var fixedHTML = '<tr >'
												+ '<td style="width:20%;">'
												+ fixedLabel
												+ '</td>'
												+ '<td style="width:60%;"><span class="board-title" onclick="location.href = \'<c:url value="/announce/notice/view" />/'
												+ el.seqId
												+ '\'">'
												+ titleString
												+ '</span></td>'
												+ '<td style="width:20%;"><small>'
												+ el.contractStartAt
												+ '</small></td>' + '</tr>';
										htmlArr.push(fixedHTML);

										return true;
									});

							commonPost
									.every(function(el) {
										if (htmlArr.length >= 7)
											return false;
										if (el.level === "100"
												|| el.level === "101")
											return true;
										var titleString = (el.title.length > 15) ? el.title
												.slice(0, 15)
												+ "..."
												: el.title;

										var commonLabel = "";
										switch (el.level) {
										case "102":
											commonLabel = '<span class="white-label-odd">일반</span>'
											break;
										case "103":
											commonLabel = '<span class="white-label-odd">일반</span>'
											break;
										}

										var commonHTML = '<tr onclick="location.href = \'<c:url value="/announce/notice/view" />/'
												+ el.seqId
												+ '\'">'
												+ '<td style="width:20%;">'
												+ commonLabel
												+ '</td>'
												+ '<td style="width:60%;"><span class="board-title">'
												+ titleString
												+ '</span></td>'
												+ '<td style="width:20%;"><small>'
												+ el.contractStartAt
												+ '</small></td>' + '</tr>';

										htmlArr.push(commonHTML);
										return true;
									});

							$("div#tab1 .tab-table").html(htmlArr.join(""));
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
										var titleString = (el.title.length > 15) ? el.title
												.slice(0, 15)
												+ "..."
												: el.title;

										var commonHTML = '<tr>'
												+ '<td style="width:20%;"><span class="white-label-odd">소식</span></td>'
												+ '<td style="width:60%;"><span class="board-title" onclick="location.href = \'<c:url value="/announce/agency/view" />/'
												+ el.seqId
												+ '\'">'
												+ titleString
												+ '</span></td>'
												+ '<td style="width:20%;"><small>'
												+ el.createdAt
												+ '</small></td>' + '</tr>';

										htmlArr.push(commonHTML);
										return true;
									});

							$("div#tab2 .tab-table").html(htmlArr.join(""));
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
			$
					.ajax({
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

										var commonHTML = '<div onclick="location.href=\'<c:url value='/partner/view' />/'
												+ el.seqId
												+ '\';" style="cursor: pointer; width: 100%;">'
												+ '<table class="index-table">'
												+ '<thead style="opacity: 0; border: 0 none; height: 0;"><tr style="margin: 0; padding: 0; border: 0 none; height: 0px;"><th style="margin: 0; padding: 0; border: 0 none; height: 0px; width: 30%"></th><th style="margin: 0; padding: 0; border: 0 none; width: 70%; height: 0px;"></th></tr></thead>'
												+ '<tbody><tr><td colspan="2"><div class="ent-logo"><div class="ent-logo-detail">'
												+ '<img src="<c:url value='/upload/partner-represent' />/'
												+ el.profileImage
												+ '"></div></div></td></tr>'
												+ '<tr><th>회사명</th><td>'
												+ el.name
												+ '</td></tr><tr>'
												+ '<th>대표자</th><td>'
												+ el.ceoName
												+ '</td></tr>'
												+ '<tr><th>웹사이트</th><td>'
												+ urlString
												+ '</td></tr>'
												+ '</tbody></table></div>';

										htmlArr.push(commonHTML);
										return true;
									});

							$("div#slider-div-sm2").html(htmlArr.join(""));

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