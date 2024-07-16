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
	
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/sub2.css' />">

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

            <div class="conts_normal">
                <div>
                    <div class="left_content"><img src="<c:url value='/resources/img/sub_img/주요사업_img1.png' />" alt="주요사업"></div>
                    <div class="right_content">
                        <h3 class="title_bule">스타트업 사업화 패키지 지원사업</h3>
                        <ul>
                            <li class="title_dk">자격기준</li>
                            <li><p>• 스타트업의 우수기술에 대한 지식재산권 확보를 통해 성장동력 확보</p></li>
                            <li><p>• 스타트업 우수제품에 대한 시제품 제작을 지원하여 신제품 개발 촉진</p></li>
                            <li><p>• 인지도 및 신뢰성 부족으로 판매에 어려움을 겪고 있는 스타트업에게 공인인증 획득 지원</p></li>
                        </ul>
                        <ul>
                            <li class="title_dk">사업분야</li>
                            <li><p>• 지원대상 : 스타트업캠퍼스 입주기업, 하남시 건강도시 조성 분야 스타트업 (창업 7년 이내)</p></li>
                            <li><p>• 지원내용 : 업체별 최대 1,600만원(총 비용의 70% 이내)</p></li>
                            <li><p>• 사업방법 : 대상기업 선정 후 사업 유형 수행기업(기관)에지원 사업비 지급</p></li>
                        </ul>
                    </div>
                </div>

                <table>
                    <caption>지원유형별 지원 내용 및 규모</caption>
                    <thead>
                        <tr>
                            <th style="width:15%">유형</th>
                            <th style="width:61%">내용</th>
                            <th style="width:24%">지원규모</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr> 
                            <td>지식재산권<br> 취득 지원사업</td>
                            <td>지식재산권(특허, 실용신안, 디자인, 상표 등) 출원</td>
                            <td>최대 200만원 (총 사업비의 70% 이내) (국내 100만원 이내, 해외 200만원 이내)</td>
                        </tr>
                        <tr>
                            <td>실증비용<br> 지원사업</td>
                            <td>제품 서비스 시장출시를 위한 시장조사, 시험 및 검증 테스트,<br> 책임보험료, 실증 시행에 따른 법, 기술 컨설팅 등</td>
                            <td>최대 800만원 (총 사업비의 70% 이내)</td>
                        </tr>
                        <tr>
                            <td>시제품 제작<br> 지원사업</td>
                            <td>제품 디자인, 시제품 개발 등</td>
                            <td>최대 800만원 (총 사업비의 70% 이내)</td>
                        </tr>
                        <tr>
                            <td>인증마크 취득<br> 지원사업</td>
                            <td>신제품(NEP), 신기술(NET), GS(Good Software) 등 국내 인증·마크</td>
                            <td>최대 400만원 (총 사업비의 70% 이내)</td>
                        </tr>
                        <tr>
                            <td>마케팅/홍보<br> 지원사업</td>
                            <td>자사 제품/서비스 국내 광고, 온라인 보도자료, SNS홍보, 온라인 쇼핑몰 입점 등</td>
                            <td>최대 400만원 (총 사업비의 70% 이내)</td>
                        </tr>
                    </tbody>
                </table><!--테이블-->
            </div><!--conts_normal-->
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