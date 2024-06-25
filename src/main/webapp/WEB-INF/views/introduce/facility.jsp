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

    <div class="sub_container in_1400">
	    <!-- # include: side-menu start -->
	    <%@ include file="./include/side-menu.jsp"%>
	    <!-- # include: side-menu end -->
		<main>
		    <div class="right-contents col-lg-9">
		        <!-- # include: title-box start -->
		        <%@ include file="./include/title-box.jsp"%>
		        <!-- # include: title-box end -->
		
		        <div class="col-lg-12 r-contents">
		            
		            <div class="col-lg-12" style="margin:0; padding:0;">
		                <h3 class="m-title"><img src="<c:url value="/resources/img/sub-title.png" />" alt="제목 아이콘">&nbsp;&nbsp;캠퍼스 평면도</h3> <!--수정!-->
		                <div class="col-lg-7">
		                    <img src="<c:url value="/resources/img/sub/sub1-3-1.png" />" alt="캠퍼스 평면도 이미지"><!--수정!-->
		                </div>
		
		                <div class="col-lg-5">
		                    <img src="<c:url value="/resources/img/sub/sub1-3-2.png" />" alt="캠퍼스 각 실 명칭"><!--수정!-->
		                </div>
		            </div>
		
		            <div class="col-lg-12" style="margin:0; padding:0;">
		                <h3 class="m-title mg-top-60"><img src="<c:url value="/resources/img/sub-title.png" />" alt="제목 아이콘">&nbsp;&nbsp;시설 개요</h3><!--수정!-->
		
		                <table class="table ">
		                    <thead>
		                        <tr>
		                            <th>분류</th>
		                            <th>명칭</th>
		                            <th>비고</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <tr>
		                            <td rowspan="4">입주실</td>
		                            <td>A타입</td>
		                            <td>2~3인실</td>
		                        </tr>
		                        <tr>
		                            <td>B타입</td>
		                            <td>4~5인실</td>
		                        </tr>
		                        <tr>
		                            <td>C타입</td>
		                            <td>6~7인실</td>
		                        </tr>
		                        <tr>
		                            <td>D타입</td>
		                            <td>8~9인실</td>
		                        </tr>
		                        <tr>
		                            <td rowspan="2">회의실</td>
		                            <td>회의실 1 (내부회의실)</td>
		                            <td></td>
		                        </tr>
		                        <tr>
		                            <td>회의실 2 (외부회의실)</td>
		                            <td>이용 시 운영사무실과 협의 필요</td>
		                        </tr>
		                        <tr>
		                            <td rowspan="2">공유공간</td>
		                            <td>공유키친</td>
		                            <td></td>
		                        </tr>
		                        <tr>
		                            <td>공유오피스</td>
		                            <td></td>
		                        </tr>
		                        <tr>
		                        	<td>운영사무실</td>
		                            <td></td>
		                            <td></td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
		
		            <div class="col-lg-12" style="margin:0; padding:0;">
		                <h3 class="m-title mg-top-60"><img src="<c:url value="/resources/img/sub-title.png" />" alt="제목 아이콘">&nbsp;&nbsp;공간 별 이미지</h3><!--수정!-->
		
		                <div class="room-box">
		
		                    <div class="hongbo-body mg-top-30"> 
		                        <ul class="hongbo-list"> 
			
			<li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image02.png" />" alt="하남스타트업캠퍼스 전체 이미지2"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>내용</strong>
		                                </div>
		                            </li>
			
		                            <%-- <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image01.png" />" alt="하남스타트업캠퍼스 전체 이미지1"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>전체 이미지 1</strong>
		                                </div>
		                            </li> 
		
		                            <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image02.png" />" alt="하남스타트업캠퍼스 전체 이미지2"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>전체 이미지 2</strong>
		                                </div>
		                            </li> 
		
		                            <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image03.png" />" alt="하남스타트업캠퍼스 인포데스트 이미지월"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>인포데스크 이미지월</strong>
		                                </div>
		                            </li> 
		
		                            <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image04.png" />" alt="하남스타트업캠퍼스 공유오피스(좌측방향)"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>공유오피스 (좌측 방향)</strong>
		                                </div>
		                            </li> 
		
		                            <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image05.png" />" alt="하남스타트업캠퍼스 공유오피스(우측방향)"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>공유오피스 (우측 방향)</strong>
		                                </div>
		                            </li> 
		                            
		                            <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image06.png" />" alt="하남스타트업캠퍼스 휴게공간"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>휴게공간</strong>
		                                </div>
		                            </li> 
		
		                            <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image07.png" />"  alt="하남스타트업캠퍼스 공유키친"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>공유키친</strong>
		                                </div>
		                            </li> 
		
		                            <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image08.png" />" alt="하남스타트업캠퍼스 회의실 1"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>회의실 1</strong>
		                                </div>
		                            </li> 
		
		                            <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image09.png" />" alt="하남스타트업캠퍼스 회의실 2,3"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>회의실 2,3</strong>
		                                </div>
		                            </li> 
		
		                            <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image10.png" />" alt="하남스타트업캠퍼스 입주업체(사무실)"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>입주업체 (사무실)</strong>
		                                </div>
		                            </li> 
		
		                            <li class="rooms">
		                                    <div class="ent-logo">
		                                        <div class="ent-logo-detail">
		                                            <img src="<c:url value="/resources/img/room/image11.png" />" alt="하남스타트업캠퍼스 운영사무실"><!--수정!-->
		                                        </div>
		                                    </div>
		                                <div class="caption"> 
		                                    <strong>운영사무실</strong>
		                                </div>
		                            </li> --%>
		                        </ul> 
		                    </div>
		                </div>
		            </div>
		        </div><!-- r-contents div 끝 -->
		    </div><!-- right-contents div 끝 -->
		</main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script>
		$(document).ready(function(){
			var urlContext = '<c:url value="/resources/img/room/gallery" />';
			// var urlContext = 'img/room/gallery';
			
			var htmlStringArr = [
			 	/* {
			 		description: "입구 1",
					image: "gallery_entrance01.jpg"	
			 	},
			 	{
			 		description: "입구 2",
					image: "gallery_entrance02.jpg"	
			 	}, */
			 	{
			 		description: "입구",
					image: "gallery_entrance03.jpg"	
			 	},
			 	{
			 		description: "인포데스크 이미지월",
					image: "gallery_infodesk.jpg"	
			 	},
			 	{
			 		description: "공유오피스 (좌측 방향)",
					image: "gallery_share01.jpg"	
			 	},
			 	{
			 		description: "공유오피스 (우측 방향)",
					image: "gallery_share02.jpg"	
			 	},
			 	// {
			 	// 	description: "휴게실",
				// 	image: "gallery_restroom02.jpg"	
			 	// },
			 	{
			 		description: "공유키친",
					image: "gallery_kitchen.jpg"
			 	},
			 	{
			 		description: "회의실 1",
					image: "gallery_meeting01.jpg"	
			 	},
			 	{
			 		description: "회의실 2 (외부회의실)",
					image: "gallery_meeting03.jpg"	
			 	},
			 	{
			 		description: "입주업체 사무실 외부",
					image: "gallery_office_partner01.jpg"
			 	},
			 	{
			 		description: "입주업체 사무실 내부",
					image: "gallery_office_partner02.jpg"	
			 	},
			 	{
			 		description: "공유오피스 1",
					image: "gallery_restarea02.jpg"	
			 	},
			 	{
			 		description: "공유오피스 2",
					image: "gallery_restarea04.jpg"	
			 	},
			 	{
			 		description: "공유오피스 3",
					image: "gallery_restarea01.jpg"	
			 	},
			 	
			 	/*
				 	{
				 		description: "",
						image: ".jpg"	
				 	},
			 	*/
			 	
			].map(function(el) {
				return '<li class="rooms">' +
				    '<div class="ent-logo">' +
				        '<div class="ent-logo-detail">' +
				            '<img src="' + urlContext + '/' + el.image + '" alt="' + el.description + '">' +
				        '</div>' +
				    '</div>' +
					'<div class="caption">' + 
					    '<strong>' + el.description + '</strong>' +
					'</div>' +
				'</li>';				
			})
			$("ul.hongbo-list").html(htmlStringArr.join(""));
		});
		
		/* <li class="rooms">
		    <div class="ent-logo">
		        <div class="ent-logo-detail">
		            <img src="<c:url value="/resources/img/room/image02.png" />" alt="하남스타트업캠퍼스 전체 이미지2"><!--수정!-->
		        </div>
		    </div>
			<div class="caption"> 
			    <strong>내용</strong>
			</div>
		</li> */
	
	</script>
	<!-- extension end -->
	

</body>
</html>