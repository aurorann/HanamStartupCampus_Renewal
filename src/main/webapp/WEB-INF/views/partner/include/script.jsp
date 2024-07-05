<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

	<script>
		window._VARS = {};
		
		_VARS.searchOption = {
			boardType: "${searchOption.boardType}",
			searchType: "${searchOption.searchType}",
			keyword: "${searchOption.keyword}",
			curPage: Number("${searchOption.curPage}"),
		};
		
		try {
			_VARS.page = JSON.parse('${page}');	
		} catch(error) {
			console.log("page object not found");
		}
		
		function pagenation(page) { // 파라메터 page 객체로 변경하면서 모듈도 수정해야
			if(page) {
				
				var pageContent = "";
			
				pageContent += '<ul class="pagination">';
				if(page.curRange!=1) {
					pageContent += 
						'<li class="page-item">' +
				         '<a class="page-link" href="javascript:getPostList(' + (page.startPage-page.rangeSize) + ')" aria-label="Next">' +
				            '<span aria-hidden="true"><img src="<c:url value='/resources/img/arrow_right_sm.png' />"></span>' +
				          '</a>' +
				        '</li>';
				}
				for(i=page.startPage;i<=page.endPage;i++){
					if(i!=page.curPage) {
						pageContent+='<li class="page-item"><a class="page-link" href="javascript:getPostList(' + i + ')">' + i + '</a></li>';
					}
					if(i==page.curPage) {
						pageContent+='<li class="page-item active"><a class="page-link" href="javascript:void(0);">' + i + '</a></li>';
					}
				}
				if(page.curRange!=page.rangeCnt) {
					pageContent += 
						'<li class="page-item">' +
						  '<a class="page-link" href="javascript:getPostList(' + (page.curRange*page.rangeSize+1) + ')" aria-label="Next">' +
				            '<span aria-hidden="true"><img src="<c:url value='/resources/img/arrow_right_sm.png' />"></span>' +
				          '</a>' +
				        '</li>';
				}
				pageContent += '</ul>';
				
				return pageContent;	
			} else {
				return '';
			}
		}
		
		function newPagenation(page) { 
			if(page) {
				
				var pageContent = "";
			
				pageContent += '<ol>' +
				                    '<li><a href="javascript:getPostList(1)" class="page_Pprev">처음페이지</a></li>' +
				                    '<li><a href="javascript:getPostList(' + (page.curPage - 1) + ')" class="page_prev">이전페이지</a></li>';
				/*                    
				if(page.curRange!=1) {
					pageContent += 
						'<li>' +
				         '<a class="page_numb" href="javascript:getPostList(' + (page.startPage-page.rangeSize) + ')" aria-label="Next">' +
				            '<span aria-hidden="true"><img src="<c:url value='/resources/img/arrow_right_sm.png' />"></span>' +
				          '</a>' +
				        '</li>';
				}
				*/
				for(i=page.startPage;i<=page.endPage;i++){
					if(i!=page.curPage) {
						pageContent+='<li><a href="javascript:getPostList(' + i + ')" class="page_numb">' + i + '</a></li>';
					}
					if(i==page.curPage) {
						pageContent+='<li><a href="javascript:void(0);" class="page_numb active">' + i + '</a></li>';
					}
				}
				/*
				if(page.curRange!=page.rangeCnt) {
					pageContent += 
						'<li>' +
						  '<a class="page_numb" href="javascript:getPostList(' + (page.curRange*page.rangeSize+1) + ')" aria-label="Next">' +
				            '<span aria-hidden="true"><img src="<c:url value='/resources/img/arrow_right_sm.png' />"></span>' +
				          '</a>' +
				        '</li>';
				}
				*/
						if(page.curPage==page.pageCnt){
							pageContent+='<li><a href="javascript:void(0);" class="page_next">다음페이지</a></li>';
						}else{
							pageContent+='<li><a href="javascript:getPostList(' + (page.curPage + 1) + ')" class="page_next">다음페이지</a></li>';

						}
				pageContent +=  '<li><a href="javascript:getPostList(' + (page.pageCnt) + ')" class="page_Nnext">마지막페이지</a></li>' +
							'</ol>';
				
				return pageContent;	
			} else {
				return '';
			}
		}
		
	</script>
	