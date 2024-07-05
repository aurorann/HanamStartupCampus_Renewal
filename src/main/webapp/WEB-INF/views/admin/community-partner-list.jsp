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
    
    <!-- Extention Start -->
    <!-- Extention End -->
    
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
				    <%@ include file="./include/inside-menu.jsp"%>
				    <!-- 
					<div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
                   		<a href="<c:url value='/admin/partner/list' />" class="btn btn-default" role="button">입주기업 정보 관리</a>
                   		<a href="<c:url value='/admin/book/place' />" class="btn btn-default" role="button">회의실 예약 및 현황</a>
						<a href="<c:url value='/admin/partner/notice/list' />" class="btn btn-default" role="button">입주기업 공지사항</a>
						<a href="<c:url value='/admin/partner/notice/write/form' />" class="btn btn-default" role="button">입주기업 공지사항 글쓰기</a>	      
				    </div>
				    <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
				    	<a href="<c:url value='/admin/webpage/partner/management/edit/form' />" class="btn btn-default" role="button">기업 실적 수정</a>
						<a href="<c:url value='/admin/partner/media/write/form' />" class="btn btn-default" role="button">소개 영상 글쓰기</a>
						<a href="<c:url value='/admin/partner/activity/write/form' />" class="btn btn-default" role="button">기업 활동 글쓰기</a>
						<a href="javascript:void(0);" class="btn btn-default you-are-here" role="button">입주기업 커뮤니티</a>
						<a href="<c:url value='/admin/community/write/form' />" class="btn btn-default" role="button">입주기업 커뮤니티 글쓰기</a>
				    </div>
				    <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
						<a href="<c:url value='/admin/partner/file/list' />" class="btn btn-default" role="button">서식 자료실</a>
						<a href="<c:url value='/admin/partner/file/write/form' />" class="btn btn-default" role="button">서식 자료실 글쓰기</a>
				    </div>
 					 -->
                    <div class="search_wrap">
	                    <ul class="page_info">
	                        <li>전체 <p><span class="page_count" id="post_count">0</span>건</p></li>
	                        <li id="page_count">페이지 <p><span class="page_count">0</span>/0</p></li>
	                    </ul>
	
	                    <form class="search_form" id="searchForm" action="<c:url value='/admin/user/community/list' />" method="get" action="#" onsubmit="return searchCommunityList(this)">
	                        <select name="searchType">
	                            <option value="NONE">--선택--</option>
	                            <option value="title">제목</option>
	                            <option value="content">내용</option>
	                            <option value="titleAndContent">제목 및 내용</option>
                                <option value="writer">작성자</option>
	                        </select>
	                        <input type="text" name="keyword" placeholder="검색어를 입력하세요">
	                        <button type="submit" class="serch_btn">검색</button>
	                    </form>
	                </div><!--search_wrap-->
	                
	                <table class="board_wrap">
	                    <thead class="board_hd">
	                        <tr>
	                            <th class="board_numb">번호</th>
	                            <th class="board_title">제목</th>
	                            <th class="board_view">작성자</th>
	                            <th class="board_start">등록일</th>
	                            <th class="board_end">조회수</th>
	                        </tr>
	                    </thead>
	
	                    <tbody class="board_body community-list">
	                    	<!-- 
	                        <tr>
	                            <td class="board_numb">1</td>
	                            <td class="board_title">
	                                <a href="#">신규 고정 공지사항 게시판입니다.</a>
	                            </td>
	                            <td class="board_view">관리자1</td>
	                            <td class="board_start">2024.04.05</td>
	                            <td class="board_end">200</td>
	                            <td class="board_check"><input type="checkbox"></td>
	                        </tr>
	                         -->
	                    </tbody>
	                </table><!--board_wrap 게시판-->
					<!-- 
					<button type="submit" class="" onclick="location.href='<c:url value="/admin/community/write/form" />';" style="margin-top: 20px;">글쓰기</button>
					 -->
                    <div class="pagination_wrap">
					</div>
	                <a href='<c:url value="/admin/community/write/form" />' class="write_btn">글쓰기</a>

                </div>
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script >
		$(function() {	// DOM 객체 init
			updateSearchOption();
		
			(_VARS.searchOption.curPage !== 1) ?
					getPostList(_VARS.searchOption.curPage)
					: getPostList();
		});
		
		var insideMenu = '입주기업 커뮤니티';
		
		$("ul#you-are-here li button[data-location-insub= '" + insideMenu + "'").addClass("active");
		
		function getPostList(curPage) {
			$.ajax({
				type : 'GET',
				url : '<c:url value="/admin/user/community/post/list" />',
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
					
					var pageHTML = newPagenation(page);
					
					$("#post_count").text(page.listCnt);
					
					var pageCountHTML = '페이지 <p><span class="page_count">' + page.curPage + '</span>/' + page.pageCnt +'</p>';
					$("#page_count").html(pageCountHTML);		
					
					var commonArr = [];
					
					commonPost.every(function(el) {
						var titleString = (el.title.length > 28) ?
								el.title.slice(0, 28) + "..."
								: el.title;
						var writer = el.writerName
						
						if(writer == null){
							writer = "익명"
						}
		                        
								var commonHTML = '<tr>'
									+ '<td class="board_numb">' + el.seqId + '</td>'
									+ '<td class="board_title">'
									+ '<a href="<c:url value='/admin/user/community/view' />/' + el.seqId + '">' + titleString + '</a>'
									+ '</td>'
									+ '<td class="board_view">' + writer + '</td>'
									+ '<td class="board_start">' + moment(el.createdAt).format("YYYY-MM-DD").slice(2) + '</td>'
									+ '<td class="board_end">' + el.viewCount + '</td>'
									+ '</tr>';
	                        
	                    commonArr.push(commonHTML);
		                return true;
					});
					
					$("tbody.board_body.community-list").html(commonArr.join(""));
					
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
		
		function searchCommunityList(form) {
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