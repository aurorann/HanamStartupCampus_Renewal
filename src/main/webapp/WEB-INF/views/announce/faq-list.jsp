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

    <!-- # include: location start -->
    <%@ include file="./include/location.jsp"%>
    <!-- # include: location end -->
    
   

    <div class="sub-contents">
        <div class="inner">
            <!-- # include: side-menu start -->
            <%@ include file="./include/side-menu.jsp"%>
            <!-- # include: side-menu end -->
            
            <div class="right-contents col-lg-9">
                <!-- # include: title-box start -->
                <%@ include file="./include/title-box.jsp"%>
                <!-- # include: title-box end -->

                <div class="col-lg-12 r-contents">
                    
                    <div class="sm-main-box pink-bar flex-end">
                        <h3><strong>총 게시물</strong>&nbsp;|&nbsp;<span id="post_count">0건</span></h3>
        
                        <div>
                        	<form id="searchForm" action="<c:url value='/announce/faq/list' />" method="get" action="#" onsubmit="return searchNoticeList(this)">								
	                            <select name="searchType">
	                                <option value="NONE">선택</option>
	                                <option value="title">질문</option>
	                                <option value="content">답변</option>
	                                <option value="titleAndContent">질문 및 답변</option>
	                            </select>
	    
	                            <input type="text" name="keyword" placeholder="검색어를 입력하세요.">
	                            <button type="submit" class="search-btn">검색</button>
                            </form>
                        </div>
        
                    </div>

                    <ul class="board-box common-notice">

                    </ul>

                    <div class="page-wrap">
                        <nav aria-label="Page navigation example">
                           
                         </nav>
                       </div>
                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </div>
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
				url : '<c:url value="/announce/faq/post/list" />',
				data: {
					curPage: (curPage) ? curPage : _VARS.searchOption.curPage,
					keyword: _VARS.searchOption.keyword,
					searchType: _VARS.searchOption.searchType
				},
				success : function(res) {
					var commonPost = res.post;
					var searchOption = res.searchOption.searchOption;
					var page = JSON.parse(res.searchOption.page);
					
					var SEARCH_OPTION = _VARS.searchOption;
					SEARCH_OPTION.boardType = searchOption.boardType;
					SEARCH_OPTION.searchType = searchOption.searchType;
					SEARCH_OPTION.keyword = searchOption.keyword;
					SEARCH_OPTION.curPage = searchOption.curPage;
					_VARS.page = page;
					
					var pageHTML = pagenation(page);
					
					$("#post_count").text(page.listCnt + "건");
					
					var commonArr = [];
					
					commonPost.every(function(el) {
						var titleString = (el.title.length > 45) ?
								el.title.slice(0, 45) + "..."
								: el.title;
						
						var commonHTML = '<li class="board-item">' +
		                    '<strong class="item-nmb">' + el.seqId + '</strong>' +
		                    '<div class="item-label faq-label">' +
		                    '<span class="white-label">자주 묻는 질문</span>' +
		                	'</div>' +
	                            '<div class="item-title">' +
	                            '<span><a href="<c:url value='/announce/faq/view' />/' + el.seqId + '">' + titleString + '</a></span>' +
	                            '</div>' +
	                            '<div class="item-info">' +
	                                '<h5 class="item-view"><strong>조회수</strong> <span>' + el.viewCount + '</span></h5>' +
									'<h5 class="item-end"><strong>등록일</strong> <span>' + el.createdAt.slice(5) + '</span></h5>' +
	                            '</div>' +
	                        '</li>';
	                        
	                    commonArr.push(commonHTML);
		                return true;
					});
					
					$("ul.board-box.common-notice").html(commonArr.join(""));
					
					$('nav[aria-label]').html(pageHTML);
					
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