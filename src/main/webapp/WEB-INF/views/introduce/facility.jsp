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
	
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/sub1-2.css' />">

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
		    <div class="right-contents col-lg-9">
		        <!-- # include: title-box start -->
		        <%@ include file="./include/title-box.jsp"%>
		        <!-- # include: title-box end -->
		
            <div class="container_wrap">
                <div class="guide1">
                    <div class="left_content"><img src="<c:url value="/resources/img/sub_img/map.png" />" alt="조직도"></div>
                    <div class="right_content">
                        <div>
                            <h3>캠퍼스 공간 명칭</h3>
                            <ul>
                                <li><span>1</span>입주실(10)</li>
                                <li><span>2</span>공용키친</li>
                                <li><span>3</span>회의실</li>
                                <li><span>4</span>공용커뮤니티</li>
                                <li><span>5</span>공용오피스</li>
                                <li><span>6</span>운영사무실</li>
                                <li><span>7</span>외부회의실</li>
                                <li><span>8</span>창고</li>
                            </ul>
                        </div>
                    </div>
                </div><!--guide1-->

                <div class="guide2">
                    <h3>시설 개요</h3>

                    <table>
                        <thead>
                            <tr>
                                <th style="width:20%">분류</th>
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
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>회의실 2 (외부회의실)</td>
                                <td>이용 시 운영사무실과 협의 필요</td>
                            </tr>
                            <tr>
                                <td rowspan="2">공유공간</td>
                                <td>공유키친</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>공유오피스</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>운영사무실</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                        </tbody>
                    </table>
                </div><!--guide2-->

                <div class="guide3">
                    <h3>공간 별 이미지</h3>

                    <ul class="hongbo-list">
                    <!-- 
                        <li><img src="img/sub_img/guide_img1.png" alt="입구">입구</li>
                        <li><img src="img/sub_img/guide_img2.png" alt="인포데스크 이미지월">인포데스크 이미지월</li>
                        <li><img src="img/sub_img/guide_img3.png" alt="공유오피스 (좌측방향)">공유오피스 (좌측방향)</li>
                        <li><img src="img/sub_img/guide_img4.png" alt="공유오피스 (우측방향)">공유오피스 (우측방향)</li>
                        <li><img src="img/sub_img/guide_img5.png" alt="공유키친">공유키친</li>
                        <li><img src="img/sub_img/guide_img6.png" alt="회의실 1">회의실 1</li>
                        <li><img src="img/sub_img/guide_img7.png" alt="회의실 2 (외부회의실)">회의실 2 (외부회의실)</li>
                        <li><img src="img/sub_img/guide_img8.png" alt="입주업체 사무실 외부">입주업체 사무실 외부</li>
                        <li><img src="img/sub_img/guide_img9.png" alt="입주업체 사무실 내부">입주업체 사무실 내부</li>
                        <li><img src="img/sub_img/guide_img10.png" alt="공유오피스 1">공유오피스 1</li>
                        <li><img src="img/sub_img/guide_img11.png" alt="공유오피스 2">공유오피스 2</li>
                        <li><img src="img/sub_img/guide_img12.png" alt="공유오피스 3">공유오피스 3</li>
                         -->
                    </ul>
                </div><!--guide3-->
            </div><!--contents-->
		
		
		
		
		

		        
		        
		    </div><!-- right-contents div 끝 -->
		</main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script>
		$(document).ready(function(){
			var urlContext = '<c:url value="/resources/img/sub_img" />';
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
					image: "guide_img1.png"	
			 	},
			 	{
			 		description: "인포데스크 이미지월",
					image: "guide_img2.png"	
			 	},
			 	{
			 		description: "공유오피스 (좌측 방향)",
					image: "guide_img3.png"	
			 	},
			 	{
			 		description: "공유오피스 (우측 방향)",
					image: "guide_img4.png"	
			 	},
			 	// {
			 	// 	description: "휴게실",
				// 	image: "gallery_restroom02.jpg"	
			 	// },
			 	{
			 		description: "공유키친",
					image: "guide_img5.png"
			 	},
			 	{
			 		description: "회의실 1",
					image: "guide_img6.png"	
			 	},
			 	{
			 		description: "회의실 2 (외부회의실)",
					image: "guide_img7.png"	
			 	},
			 	{
			 		description: "입주업체 사무실 외부",
					image: "guide_img8.png"
			 	},
			 	{
			 		description: "입주업체 사무실 내부",
					image: "guide_img9.png"	
			 	},
			 	{
			 		description: "공유오피스 1",
					image: "guide_img10.png"	
			 	},
			 	{
			 		description: "공유오피스 2",
					image: "guide_img11.png"	
			 	},
			 	{
			 		description: "공유오피스 3",
					image: "guide_img12.png"	
			 	},
			 	
			 	/*
				 	{
				 		description: "",
						image: ".jpg"	
				 	},
			 	*/
			 	
			].map(function(el) {
				return '<li>'+
					'<img src="' + urlContext + '/' + el.image + '" alt="' + el.description + '">' + el.description + 
				'</li>';
				
				
				
				
			})
			$("ul.hongbo-list").html(htmlStringArr.join(""));
		});
		

	
	</script>
	<!-- extension end -->
	

</body>
</html>