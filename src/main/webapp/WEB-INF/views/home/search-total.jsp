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

    <!-- # include: location start -->
    <%-- <%@ include file="./include/location.jsp"%> --%>
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
                        <div class="result-count">
                            <p class="result-text" style="margin-right: 5px">
                                <em class="search-word">'${keyword}'</em> 에 대한 총 <em id="search-score">0</em> 건의 검색 결과가 있습니다.
                            </p>
                        </div>
                        <div>
                        	<form onsubmit="return searchPostListAllByKeyword(this);">
	                            <input type="text" id="keyword" name="keyword" value="${keyword}">
	                            <button type="submit" class="search-btn">검색</button>
                            </form>
                        </div>
                    </div>
                    
                    <div class="result result-all">
                        <span class="result-head">검색된 게시판&nbsp;</span>
                        <ul>
                            <li><a href="<c:url value='/announce/notice/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">공고<small id="NOTICE-count">(0)</small></a></li>
                            <li><a href="<c:url value='/announce/agency/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">바이오 정책 · 지원<small id="AGENCY-count">(0)</small></a></li>
                            <li><a href="<c:url value='/gallery/press/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">보도자료<small id="PRESS-count">(0)</small></a></li>
                            <li><a href="<c:url value='/gallery/promotion/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">홍보자료<small id="PROMOTION-count">(0)</small></a></li>
                            <li><a href="<c:url value='/gallery/bio-info/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">바이오 소식<small id="BIO-INFO-count">(0)</small></a></li>
                            <li><a href="<c:url value='/introduce/media/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">캠퍼스 소개 영상<small id="MEDIA-count">(0)</small></a></li>
                            <li><a href="<c:url value='/partner/media/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">입주기업 소개 영상<small id="PARTNER-MEDIA-count">(0)</small></a></li>
                            <li><a href="<c:url value='/partner/activity/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">기업 활동<small id="PARTNER-ACTIVITY-count">(0)</small></a></li>
                            <li><a href="<c:url value='/announce/faq/list' />?keyword=${keyword}&curPage=1&searchType=titleAndContent">자주 묻는 질문<small id="FAQ-count">(0)</small></a></li>
                        </ul>
                    </div>
                    
                    <div class="result result1" id="NOTICE" >
					    <a></a>
					    <span class="result-head">공고&nbsp;<small class="count">(0)</small></span>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1" id="AGENCY">
					    <a></a>
					    <span class="result-head">바이오 정책 · 지원&nbsp;<small class="count">(0)</small></span>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1" id="PRESS">
					    <a ></a>
					    <span class="result-head">보도자료&nbsp;<small class="count">(0)</small></span>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1" id="PROMOTION">
					    <a></a>
					    <span class="result-head">홍보자료&nbsp;<small class="count">(0)</small></span>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1" id="BIO-INFO">
					    <a ></a>
					    <span class="result-head">바이오 소식&nbsp;<small class="count">(0)</small></span>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1" id="MEDIA">
					    <a></a>
					    <span class="result-head">캠퍼스 소개 영상&nbsp;<small class="count">(0)</small></span><small>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1" id="PARTNER-MEDIA">
					    <a></a>
					    <span class="result-head">입주기업 소개 영상&nbsp;<small class="count">(0)</small></span><small>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1" id="PARTNER-ACTIVITY">
					    <a></a>
					    <span class="result-head">기업 활동&nbsp;<small class="count">(0)</small></span><small>
					    <ul>
					    </ul>
					</div>
					
					<div class="result result1" id="FAQ">
					    <a></a>
					    <span class="result-head">자주 묻는 질문&nbsp;<small class="count">(0)</small></span><small>
					    <ul>
					    </ul>
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
		$(function(){
			$.ajax({
				type : 'GET',
				cache: false,
				url : '<c:url value="/search/toatal/post/list" />',
				data: {
					keyword: "${keyword}"
				},
				success : function(res) {
					if(res.length === 0) return; 
					var category = ["NOTICE", "AGENCY", "PRESS", "PROMOTION", "BIO-INFO", "MEDIA", "PARTNER-MEDIA", "PARTNER-ACTIVITY", "FAQ"];
					
					var html = {
						NOTICE: [],
						AGENCY: [],
						PRESS: [],
						PROMOTION: [],
						"BIO-INFO": [],
						MEDIA: [],
						"PARTNER-MEDIA": [],
						"PARTNER-ACTIVITY": [],
						FAQ: []
					};
					
					var link = {
						    NOTICE: ["<c:url value='/announce/notice/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    AGENCY: ["<c:url value='/announce/agency/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
						    PRESS: ["<c:url value='/gallery/press/view' />/", "?keyword=${keyword}&curPage=1&searchType=titleAndContent"],
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
					            '<span class="result-title">' + titleString + '</span>' +
					            '<p>' + contentString + '</p>' +
					            '<small>| ' + moment(post.createdAt).format("YYYY-MM-DD HH:mm").slice(2) + ' |</small>' +
					        '</a></li>');
						}
						return true;
					}) && category.every(function(cate) {
						$("#" + cate + "-count").html("(" + html[cate].length + ")")
						$("#" + cate + " small.count").html("(" + html[cate].length + ")");
						$("#" + cate +" ul").html(html[cate].join(""));
						return true;
					})
					$("#search-score").html(res.length);
					$(".search-score").html("(" + res.length + ")");
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