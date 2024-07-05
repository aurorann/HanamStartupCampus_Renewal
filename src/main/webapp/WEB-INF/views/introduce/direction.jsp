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
			<div class="right-contents col-lg-9">
				<!-- # include: title-box start -->
				<%@ include file="./include/title-box.jsp"%>
				<!-- # include: title-box end -->

				<div class="col-lg-12 r-contents">

					<div class="col-lg-12" style="margin: 0; padding: 0;">
						<h3 class="m-title">
							<img src="<c:url value='/resources/img/sub-title.png' />">&nbsp;&nbsp;오시는
							길
						</h3>
					</div>

					<div class="col-lg-12" style="margin: 0; padding: 0;">


						<div id="daumRoughmapContainer1589243645354"
							class="root_daum_roughmap root_daum_roughmap_landing"
							style="width: 100%; margin: 0 0 30px 0; z-index: 0;"></div>

						<script class="daum_roughmap_loader_script"
							src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

						<script>
                            new daum.roughmap.Lander({
                                "timestamp" : "1589243645354",
                                "key" : "yaoo",
                                "mapHeight" : "360", 
                            }).render();
                        </script>


						<table class="table map-table">
							<tbody>
								<tr>
									<th>상세 주소</th>
									<td>[12902] 경기도 하남시 미사강변한강로 177 KDB산업은행 IT센터 3층 하남스타트업캠퍼스<br>
										<strong>대표 전화번호</strong>&nbsp;031)790-9591&nbsp;/&nbsp;<strong>대표
											FAX</strong>&nbsp;031)795-3310
									</td>
								</tr>
								<tr>
									<th><img
										src="<c:url value='/resources/img/sub/sub1-6-1.png' />"><br>
										자가용 이용 시</th>
									<td>올림픽대로 > 미사IC > 미사대로에서 700m > KDB산업은행 IT센터</td>
								</tr>
								<tr>
									<th><img
										src="<c:url value='/resources/img/sub/sub1-6-2.png' />"><br>
										대중교통(버스)<br />이용 시</th>
									<td><strong>1. 서울 방면</strong>&nbsp;:&nbsp;노선버스 1-4, 83,
										89, 3000 / 마을버스 3, 3-1, 10 승차<br /> <strong>2. 하남시청
											방면</strong>&nbsp;:&nbsp;노선버스 9304, 81 / 마을버스 10, 50 승차<br />
									<br /> <strong>※ KDB산업은행 IT센터 앞 정류장</strong>&nbsp;:&nbsp;미사강변
										한신더휴(28091, 28531) 하차</td>
								</tr>
								<tr>
									<th><img
										src="<c:url value='/resources/img/sub/sub1-6-3.png' />"><br>
										지하철 이용 시</th>
									<td><strong style="color: #01a34c">잠실역</strong>&nbsp;:&nbsp;광역환승센터
										지하 정류장(24050)에서 9302 승차 <br> <strong
										style="color: #01a34c">강변역</strong>&nbsp;:&nbsp;테크노마트 앞 강변역
										정류장(05267)에서 9304 승차 <br> <br> <strong
										style="color: #8936e0">강동역</strong>&nbsp;:&nbsp;강동역(중)
										정류장(25012)에서 1-4 승차 <br> <strong style="color: #8936e0">상일동역</strong>&nbsp;:&nbsp;상일동역
										8번 출구 정류장(25134)에서 81, 83 승차 <br> <strong
										style="color: #8936e0">미사역</strong>&nbsp;:&nbsp;미사역 4번 출구
										정류장(28530)에서 10, 3, 3-1, 1-4, 89, 83 승차</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- r-contents div 끝 -->
			</div>
			<!-- right-contents div 끝 -->
		</main>
	</div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->

	<!-- extension start -->

	<!-- extension end -->


</body>
</html>