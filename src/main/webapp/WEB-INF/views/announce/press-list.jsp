<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- # common: head start -->
	<%@ include file="/WEB-INF/head.jsp"%>
    <!-- # common: head end -->

	<!-- # include: script start -->
    <%@ include file="./include/script.jsp"%>
    <!-- # include: script end -->
    
	<!-- # include: stylesheet start -->
	<%@ include file="./include/stylesheet.jsp"%>
	<!-- # include: stylesheet end -->
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/sub4-3.css' />">
</head>


<body class="animsition restyle-index">
	
	<!-- # common: header-menu start -->
    <%@ include file="/WEB-INF/header-menu.jsp"%>
    <!-- # common: header-menu end -->   
	
	<!-- # common: header-menu-img start -->
    <%@ include file="./include/header-menu-img.jsp"%>
    <!-- # common: header-menu-img end --> 
    
    <div class="sub_container in_1400">
		<!-- # include: side-menu start -->
		<%@ include file="./include/side-menu.jsp"%>
		<!-- # include: side-menu end -->
		<main>
			<!-- # include: title-box start -->
			<%@ include file="./include/title-box.jsp"%>
			<!-- # include: title-box end -->

                <div class="container_wrap">
	                <div class="search_wrap">
	                    <ul class="page_info">
	                        <li>전체 <p><span class="page_count" id="post_count">0</span>건</p></li>
	                        <li id="page_count">페이지 <p><span class="page_count">0</span>/0</p></li>
	                    </ul>
	
	                    <form class="search_form" id="searchForm" action="<c:url value='/announce/press/list' />" method="get" action="#" onsubmit="return searchNoticeList(this)">
	                        <select name="searchType">
	                            <option value="NONE">--선택--</option>
	                            <option value="title">제목</option>
	                            <option value="content">내용</option>
	                            <option value="titleAndContent">제목 및 내용</option>
	                        </select>
	                        <input type="text" name="keyword" placeholder="검색어를 입력하세요">
	                        <button type="submit" class="serch_btn">검색</button>
	                    </form>
	                </div><!--search_wrap-->
	                
	                <div class="content_wrap">
	                    <ul class="card_wrap">
	                    	<!-- 
	                        <li>
	                            <a href="#">
	                                <div class="img_box"><img src="img/sub_img/보도자료_img1.png" alt="보도자료"></div>
	                                <div class="card_text">
	                                    <h3>타운카, 럭키박스솔루션과 전략적 파트너십 체결</h3>
	                                    <p>개인 간 차량 공유 플랫폼인 '타운카'가 '럭키박스솔루션'과의 전략적 파트너십을 14일 공식 발표했다. 이번 MOU 체결을 통해 양사는 개인 차량공유 시장의 확대와 서비스의 질적 개선을 위해 협력하며, 차량 제어 및 관제 기술의 혁신을 추진할 계획이다. 타운카는 럭키박스솔루션과</p>
	                                </div>
	                                <time datetime="2024.05.24">2024.05.24</time>
	                            </a>
	                        </li>
	                         -->
	                    </ul><!--card_wrap-->
	                </div><!--content_wrap-->

					<div class="pagination_wrap">
					</div>
					
					<sec:authorize ifAnyGranted="ROLE_ADMIN">
						<a href='<c:url value="/admin/announce/press/write/form" />' class="write_btn">글쓰기</a>
					</sec:authorize>
	
                </div><!-- r-contents div 끝 -->
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script>
		$(function() {	// DOM 객체 init
			updateSearchOption();
		
			(_VARS.searchOption.curPage !== 1) ?
					getPostList(_VARS.searchOption.curPage)
					: getPostList();
		});
		
		function getPostList(curPage) {
			$.ajax({
				type : 'GET',
				cache: false,
				url : '<c:url value="/announce/press/post/list" />',
				data: {
					curPage: (curPage) ? curPage : _VARS.searchOption.curPage,
					keyword: _VARS.searchOption.keyword,
					searchType: _VARS.searchOption.searchType
				},
				success : function(res) {
					console.log(res);
					var commonPost = res.post;
					var searchOption = res.searchOption.searchOption;
					var page = JSON.parse(res.searchOption.page);
					
					var SEARCH_OPTION = _VARS.searchOption;
					SEARCH_OPTION.boardType = searchOption.boardType;
					SEARCH_OPTION.searchType = searchOption.searchType;
					SEARCH_OPTION.keyword = searchOption.keyword;
					SEARCH_OPTION.curPage = searchOption.curPage;
					_VARS.page = page;
					
					var pageHTML = newPagenation(page);
					
					$("#post_count").text(page.listCnt);
					
					var pageCountHTML = '페이지 <p><span class="page_count">' + page.curPage + '</span>/' + page.pageCnt +'</p>';
					$("#page_count").html(pageCountHTML);
					
					var commonArr = [];
					
					commonPost.every(function(el) {
						var titleString = (el.title.length > 35) ?
								el.title.slice(0, 35) + "..."
								: el.title;
						var contentString = filterXSS(el.content, _WHITELIST);
						if(contentString.length > 150) contentString = contentString.slice(0, 150) + "...";
								
						var commonHTML = 
                            '<li>' +
                            '<a href="<c:url value='/announce/press/view' />/' + el.seqId + '">' +
                                '<div class="img_box">'+
	                                //'<img src="<c:url value='/upload/gallery-represent/press' />/' + el.representImage + '" onerror="this.src=\'<c:url value='/resources/img/default.png' />\'">' +
	                                '<img src="<c:url value='/upload/gallery-represent/press/' />' + el.representImage + '" onerror="this.src=\'<c:url value='/resources/img/default.png' />\'">' +
	                                '</div>'+
                                '<div class="card_text">' +
                                    '<h3>' + titleString + '</h3>' +
                                    '<p>' + contentString + '</p>' +
                                '</div>' +
                                '<time datetime="">' + el.createdAt + '</time>' +
                            '</a>' +
                        '</li>';
	                    commonArr.push(commonHTML);
		                return true;
					});
					
					$("div.content_wrap ul").html(commonArr.join(""));
					
					$('div.pagination_wrap').html(pageHTML);
					
					history.replaceState(null, null, getQueryString(SEARCH_OPTION));
				},
				error : function(error) {
					alert('게시물을 불러오지 못했습니다, 관리자에게 문의해주세요.');
				}
			});
		}
	
		function updateSearchOption() {
			var $searchForm = $("#searchForm");
			$("input[name='keyword']", $searchForm).val(_VARS.searchOption.keyword);
			$("select[name='searchType']", $searchForm).val(_VARS.searchOption.searchType);
		}
		
		function searchNoticeList(form) {
			var $form = $(form);
			if($("[name='searchType']", $form).val() === "NONE") {
				alert("검색 옵션을 선택해주세요.");
				return false;
			} else if($("[name='keyword']", $form).val().trim() === "") {
				alert("검색어를 입력해주세요.");
				return false;
			} else {
				return true;
			}
		}

	</script>
	<!-- extension end -->
	

</body>
</html>