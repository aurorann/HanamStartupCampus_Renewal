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
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/sub1-3.css' />">

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
                     ${CONTENT}
                     <%--
		            <div class="history">
		                <dl>
		                    <dt>2020</dt>
		                    <dd>
		                        <ul>
		                            <li>
		                                <span>03월</span>
		                                <p>부동산 사용대차 계약체결(하남시↔산업은행)</p>
		                            </li>
		                            <li>
		                                <span>04월</span>
		                                <p>하남스타트업캠퍼스 구축 및 운영협약 체결(하남시↔하남도시공사)</p>
		                            </li>
		                            <li>
		                                <span>06월</span>
		                                <p>인테리어공사 설계용역 체결
		                            </li>
		                            <li>
		                                <span>08월</span>
		                                <p>스타트업캠퍼스 운영 인력 채용(센터장, 수석매니저)</p>
		                            </li>
		                            <li>
		                                <span>11월</span>
		                                <p>운영규정 제정
		                            </li>
		                            <li>
		                                <span>12월</span>
		                                <p>제1회 하남스타트업캠퍼스 창업경진대회 개최</p>
		                            </li>
		                        </ul>
		                    </dd>
		                </dl>
		                <dl>
		                    <dt>2021</dt>
		                    <dd>
		                        <ul>
		                            <li>
		                                <span>01월</span>
		                                <p>제1회 하남스타트업캠퍼스 창업경진대회 입상자 선정</p>
		                            </li>
		                            <li>
		                                <span>02월</span>
		                                <p>캠퍼스 인테리어공사 완공 및 입주기업 선정</p>
		                            </li>
		                            <li>
		                                <span>03월</span>
		                                <p>10개 입주기업 입주
		                            </li>
		                            <li>
		                                <span>05월</span>
		                                <p>바이오산업 육성 업무협약(MOU) 체결<br>(하남도시공사↔건국대학교 LINC + 사업단)</p>
		                            </li>
		                            <li>
		                                <span></span>
		                                <p>하남스타트업캠퍼스 개소식
		                            </li>
		                            <li>
		                                <span>~12월</span>
		                                <p>캠퍼스 지원사업 수행<br>- 사업화 패키지, 전문교육, 액셀러레이팅, 클러스터, 경진대회 등</p>
		                            </li>
		                        </ul>
		                    </dd>
		                </dl>
		                <dl>
		                    <dt>2022</dt>
		                    <dd>
		                        <ul>
		                            <li>
		                                <span>02월</span>
		                                <p>조기 졸업기업 4개사<br>- 앤코어스㈜, ㈜메디인테크, ㈜엘엔로보틱스, ㈜설랩</p>
		                            </li>
		                            <li>
		                                <span>03월</span>
		                                <p>신규 입주기업 4개사<br>- MAZE㈜, ㈜디에이블, ㈜아사달, ㈜소금광산</p>
		                            </li>
		                            <li>
		                                <span>05월</span>
		                                <p>혁신창업기업 성장지원을 위한 업무협약<br>- 하남도시공사 ↔ 신용보증기금 서울동부영업본부</p>
		                            </li>
		                            <li>
		                                <span>06월</span>
		                                <p>중소벤처기업부 아기유니콘 200 육성사업 선정 <br>- ㈜메디인테크, ㈜엘엔로보틱스</p>  
		                            </li>
		                            <li>
		                                <p><span>10월</span>제 3회 하남스타트업캠퍼스 창업경진대회 개최</p>
		                            </li>
		                            <li>
		                                <span>~12월</span>
		                                <p>캠퍼스 지원사업 수행<br>- 사업화 패키지, 전문교육, 액셀러레이팅, 경진대회, 네트워킹 데이, 공감e가득 사업 등</p>
		                            </li>
		                        </ul>
		                    </dd>
		                </dl>
		                <dl>
		                    <dt>2023</dt>
		                    <dd>
		                        <ul>
		                            <li>
		                                <span>02월</span>
		                                <p>졸업기업 3개사<br>- (주)케이닷코리아, (주)등자, 아토플렉스(주)</p>
		                            </li>
		                            <li>
		                                <span>03월</span>
		                                <p>신규 입주기업 3개사<br>- (주)파인더스, 예비창업자 이경진, 예비창업자 이 훈</p>
		                            </li>
		                            <li>
		                                <span>05월</span>
		                                <p>중소벤처기업부 아기유니콘 200 육성사업 선정 <br>- 아토플렉스㈜</p>
		                            </li>
		                            <li>
		                                <span>06월</span>
		                                <p>중소벤처기업부 아기유니콘 200 육성사업 선정 <br>- 아토플렉스㈜</p>
		                            </li>
		                            <li>
		                                <span>10월</span>
		                                <p>혁신 창업기업 발굴 및 성장 지원을 위한 업무협약<br>- 하남도시공사 ↔ 기술보증기금 서울동부지역본부</p>
		                            </li>
		                        </ul>
		                    </dd>
		                </dl>
		            </div><!--history-->
                	 --%>



                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
		</main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	
	<!-- extension end -->
	

</body>
</html>