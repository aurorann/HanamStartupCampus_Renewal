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


<body>
	
	<!-- # common: header-menu start -->
    <%@ include file="/WEB-INF/header-menu.jsp"%>
    <!-- # common: header-menu end -->   
    
    <div class="search_modal">
        <div class="top_search_modal">
            <h3>전체 검색</h3>
            <button><img src="img/back_ico.png" alt="뒤로가기"></button>            
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
   
    <div class="sub_container in_1400" style="margin-top:50px;">
		<!-- # include: side-menu start -->
		<%@ include file="./include/side-menu.jsp"%>
		<!-- # include: side-menu end -->
		<main>
			<!-- # include: title-box start -->
			<%@ include file="./include/title-box.jsp"%>
			<!-- # include: title-box end -->
			<!-- 
                    <div class="sm-main-box pink-bar flex-end">
                        <div class="result-count">
                            <p class="result-text" style="margin-right: 5px">
                                <em class="search-word">'${keyword}'</em> 에 대한 총 <em id="search-score">0</em> 건의 검색 결과가 있습니다.
                            </p>
                        </div>
                        	<form onsubmit="return searchPostListAllByKeyword(this);">
	                            <input type="text" id="keyword" name="keyword" value="${keyword}">
	                            <button type="submit" class="search-btn">검색</button>
                            </form>
                    </div>
                     -->
                    
		            <div class="search_wrap">
		                <ul class="page_info">
		                    <li><span class="page_keyword">'${keyword}'</span>에 대한 총<span class="page_count" id="search-score">0</span>건의 검색 결과가 있습니다.</li>
		                </ul>
		
		                <form class="search_form" onsubmit="return searchPostListAllByKeyword(this);">
		                    <input type="text" name="keyword" placeholder="검색어를 입력하세요" value="${keyword}">
		                    <button type="submit" class="serch_btn">검색</button>
		                </form>
		            </div><!--search_wrap-->
                    
                    
				<div class="container_wrap">
                    <div class="result result_all">
                        <h3>검색된 게시판</h3>
                        <ul>
                            <li><a href="<c:url value='/announce/notice/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">• 공지사항<span id="NOTICE-count">(0)</span></a></li>
                            <li><a href="<c:url value='/announce/announcement/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">• 사업공고<span id="ANNOUNCEMENT-count">(0)</span></a></li>
                            <!-- <li><a href="<c:url value='/announce/agency/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">• 바이오 정책 · 지원<span id="AGENCY-count">(0)</span></a></li> -->
                            <li><a href="<c:url value='/announce/press/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">• 보도자료<span id="PRESS-count">(0)</span></a></li>
                            <!-- 
                            <li><a href="<c:url value='/gallery/promotion/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">• 홍보자료<span id="PROMOTION-count">(0)</span></a></li>
                            <li><a href="<c:url value='/gallery/bio-info/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">• 바이오 소식<span id="BIO-INFO-count">(0)</span></a></li>
                            <li><a href="<c:url value='/introduce/media/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">• 캠퍼스 소개 영상<span id="MEDIA-count">(0)</span></a></li>
                             -->
                            <li><a href="<c:url value='/partner/media/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">• 소개 영상<span id="PARTNER-MEDIA-count">(0)</span></a></li>
                            <li><a href="<c:url value='/partner/activity/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">• 기업 소식<span id="PARTNER-ACTIVITY-count">(0)</span></a></li>
                            <li><a href="<c:url value='/announce/faq/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">• 자주 묻는 질문<span id="FAQ-count">(0)</span></a></li>
                        </ul>
                    </div>
                    
                    <div class="result result1 result_search" id="NOTICE" >
					    <h3 class="result-head">공지사항&nbsp;<span class="count">(0)</span></h3>
					    <ul>
					    </ul>
					</div>
                    
                    <div class="result result1 result_search" id="ANNOUNCEMENT" >
					    <h3 class="result-head">사업공고&nbsp;<span class="count">(0)</span></h3>
					    <ul>
					    </ul>
					</div>
					<!-- 
					<div class="result result1 result_search" id="AGENCY">
					    <h3 class="result-head">바이오 정책 · 지원&nbsp;<span class="count">(0)</span></h3>
					    <ul>
					    </ul>
					</div>
					 -->
					<div class="result result1 result_search" id="PRESS">
					    <h3 class="result-head">보도자료&nbsp;<span class="count">(0)</span></h3>
					    <ul>
					    </ul>
					</div>
					<!-- 
					<div class="result result1 result_search" id="PROMOTION">
					    <h3 class="result-head">홍보자료&nbsp;<span class="count">(0)</span></h3>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1 result_search" id="BIO-INFO">
					    <h3 class="result-head">바이오 소식&nbsp;<span class="count">(0)</span></h3>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1 result_search" id="MEDIA">
					    <h3 class="result-head">캠퍼스 소개 영상&nbsp;<span class="count">(0)</span></h3>
					    <ul>
					    </ul>
					</div>
					 -->
					<div class="result result1 result_search" id="PARTNER-MEDIA">
					    <h3 class="result-head">소개 영상&nbsp;<span class="count">(0)</span></h3>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1 result_search" id="PARTNER-ACTIVITY">
					    <h3 class="result-head">기업 소식&nbsp;<span class="count">(0)</span></h3>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1 result_search" id="FAQ">
					    <h3 class="result-head">자주 묻는 질문&nbsp;<span class="count">(0)</span></h3>
					    <ul>
					    </ul>
					</div>
				</div>
            </main><!-- right-contents div 끝 -->
		</div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script>
		$(function(){
			$.ajax({
				type : 'GET',
				cache: false,
				url : '<c:url value="/search/toatal/post/list" />',
				data: {
					keyword: "${keyword}"
				},
				success : function(res) {
					console.log(res);
					if(res.length === 0) return; 
					var category = ["NOTICE", "ANNOUNCEMENT", "AGENCY", "PRESS", "PROMOTION", "BIO-INFO", "MEDIA", "PARTNER-MEDIA", "PARTNER-ACTIVITY", "FAQ"];
					
					var html = {
						NOTICE: [],
						ANNOUNCEMENT: [],
						AGENCY: [],
						PRESS: [],
						PROMOTION: [],
						"BIO-INFO": [],
						MEDIA: [],
						"PARTNER-MEDIA": [],
						"PARTNER-ACTIVITY": [],
						FAQ: []
					};
					
					var count = {
						NOTICE: [],
						ANNOUNCEMENT: [],
						AGENCY: [],
						PRESS: [],
						PROMOTION: [],
						"BIO-INFO": [],
						MEDIA: [],
						"PARTNER-MEDIA": [],
						"PARTNER-ACTIVITY": [],
						FAQ: []
					}
					
					var link = {
						    NOTICE: ["<c:url value='/announce/notice/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    ANNOUNCEMENT: ["<c:url value='/announce/announcement/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    AGENCY: ["<c:url value='/announce/agency/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    PRESS: ["<c:url value='/announce/press/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    PROMOTION: ["<c:url value='/gallery/promotion/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    "BIO-INFO": ["<c:url value='/gallery/bio-info/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    MEDIA: ["<c:url value='/introduce/media/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    "PARTNER-MEDIA": ["<c:url value='/partner/media/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    "PARTNER-ACTIVITY": ["<c:url value='/partner/activity/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    FAQ:["<c:url value='/announce/faq/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"]
						};
					
					
					
					res.every(function(post) {
						var CATE = post.writerIp
						
						if(html[CATE].length < 5) {
							var titleString = (post.title.length > 35) ?
									post.title.slice(0, 35) + "..."
									: post.title;
							
							var contentString = filterXSS(post.content, _WHITELIST);
							if(contentString.length > 150) {
								contentString = contentString.slice(0, 130) + "...";
							} else {
								contentString = contentString.slice(0, contentString.length - 20) + "...";
							}
							
							var location = link[CATE][0] + post.seqId + link[CATE][1];
							html[CATE].push('<li><a href="' + location + '">' +
								'<div class="text_box">' +
					            '<h4>' + titleString + '</h4>' +
					            '<p>' + contentString + '</p>' +
					            '</div>' +
					            '<time> ' + moment(post.createdAt).format("YYYY-MM-DD HH:mm").slice(2) + ' </time>' +
					        '</a></li>');
						}
						
						count[CATE].push(post.seqId);

						return true;
					}) && category.every(function(cate) {
						$("#" + cate + "-count").html("(" + count[cate].length + ")")
						$("#" + cate + " span.count").html("(" + count[cate].length + ")");
						$("#" + cate +" ul").html(html[cate].join(""));
						return true;
					})
					$("#search-score").html(res.length);
				},
				error : function(error) {
					alert('게시물을 불러오지 못했습니다, 관리자에게 문의해주세요.');
				}
			});
		})

	</script>
	<!-- extension end -->
	

</body>
</html>