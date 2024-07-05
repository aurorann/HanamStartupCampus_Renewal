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
	                        <li id="page_count">페이지 <p><span class="page_count">0</span>/</p></li>
	                    </ul>
	
	                    <form class="search_form" id="searchForm" action="<c:url value='/partner/media/list' />" method="get" action="#" onsubmit="return searchNoticeList(this)">
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
	                    <ul class="gallery_wrap">
	                    	<!-- 
	                        <li>
	                            <a href="#">
	                                <div class="img_box"><img src="img/sub_img/letter_img1.png" alt="6월호"></div>
	                                <h3>(2024년 6월호)하남스타트업캠퍼스 온라인 뉴스레터</h3>
	                                <time datetime="2024-06-12"><img src="img/calendar_ico.png" alt="달력">2024.06.12</time>
	                            </a>
	                        </li>
	                         -->
	                    </ul>
	                </div><!--gallery_wrap 게시판-->

	               <div class="pagination_wrap"></div><!--paging-->
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
				url : '<c:url value="/partner/media/post/list" />',
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
						var titleString = (el.title.length > 28) ?
								el.title.slice(0, 28) + "..."
								: el.title;
	                        
 						var commonHTML = '<li>'+
                    	'<a href="<c:url value='/partner/media/view' />/' + el.seqId + '" class="hongbo-img">' +
                            '<div class="img_box">' +
                            	'<img src="https://img.youtube.com/vi/' + el.youtubeId + '/mqdefault.jpg" alt="동영상 썸네일">' +
                            '</div>'+
                            '<h3>' + titleString + '</h3>'+
                            '<time datetime="2024-06-12"><img src="<c:url value='/resources/img/calendar_ico.png' />" alt="달력">' + el.createdAt + '</time>'+
                    	'</a>'+
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