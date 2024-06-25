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

                <div class="col-lg-12 r-contents program-box">
                    <ul>
                        <li>
                            <div class="col-lg-5 col-md-12 program-title">
                                <h1 style="color:#23468c;">스타트업 사업화 패키지 지원사업</h1>
                                <h1 class="program-icon program-icon1"></h1>
                            </div>
                            <div class="col-lg-7 program-text">
                                <p style="line-height: 25px;">
                                    <strong>사업목표</strong>
                                    <span>• 스타트업의 우수기술에 대한 지식재산권 확보를 통해 성장동력 확보</span>
                                    <span>• 스타트업 우수제품에 대한 시제품 제작을 지원하여 신제품 개발 촉진</span>
                                    <span>• 인지도 및 신뢰성 부족으로 판매에 어려움을 겪고 있는 스타트업에게 공인 인증 획득 지원</span>
                                </p>
         
                                <p style="line-height: 25px;">
                                    <strong>사업내용</strong>
                                    <span>• 지원대상 : 스타트업캠퍼스 입주기업, 하남시 건강도시 조성 분야<br>스타트업(창업 7년 이내)</span>
                                    <span>• 지원내용 : 업체별 최대 1,600만원(총 비용의 70% 이내)</span>
                                    <span>• 사업방법 : 대상기업 선정 후 사업 유형 수행기업(기관)에<br>지원 사업비 지급</span>
                                </p>
                                
                                
                            </div>

                            <div class="col-lg-12 program-text">
                                <p><strong>- 지원유형벌 지원 내용 및 규모</strong></p>
                                <table class="table-sm table-pc">
                                    <tr>
                                        <th style="width:15%;">유형</th>
                                        <th style="width:55%;">내용</th>
                                        <th style="width:30%;">지원규모</th>
                                    </tr>
                                    <tr>
                                        <td>지식재산권<br>취득 지원사업</td>
                                        <td>지식재산권(특허, 실용신안, 디자인, 상표 등) 출원</td>
                                        <td>최대 200만원 (총 사업비의 70% 이내)<br>(국내 100만원 이내, 해외 200만원 이내)</td>
                                    </tr>
                                    <tr>
                                        <td>실증비용<br>지원사업</td>
                                        <td>제품 서비스 시장출시를 위한 시장조사, 시험 및 검증 테스트, 책임보험료,<br>실증 시행에 따른 법, 기술 컨설팅 등</td>
                                        <td>최대 800만원 (총 사업비의 70% 이내)</td>
                                    </tr>
                                    <tr>
                                        <td>시제품 제작<br>지원사업 </td>
                                        <td>제품 디자인, 시제품 개발 등</td>
                                        <td>최대 800만원 (총 사업비의 70% 이내)</td>
                                    </tr>
                                    <tr>
                                        <td>인증마크 취득<br>지원사업</td>
                                        <td>신제품(NEP), 신기술(NET), GS(Good Software) 등 국내 인증·마크 </td>
                                        <td>최대 400만원 (총 사업비의 70% 이내)</td>
                                    </tr>
                                    <tr>
                                        <td>마케팅/홍보<br>지원사업 </td>
                                        <td>자사 제품/서비스 국내 광고, 온라인 보도자료, SNS홍보, 온라인 쇼핑몰 입점 등</td>
                                        <td>최대 500만원 (총 사업비의 70% 이내)</td>
                                    </tr>
                                </table>

                                <table class="table-sm table-mobile" style="border-top:none;">
                                    <tr style="border-top:2px solid #000;">
                                        <th>유형</th>
                                    </tr>
                                    <tr>
                                        <td>지식재산권 취득 지원사업</td>
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                    </tr>
                                    <tr>
                                        <td>지식재산권(특허, 실용신안, 디자인, 상표 등) 출원</td>
                                    </tr>
                                    <tr>
                                        <th>지원규모</th>
                                    </tr>
                                    <tr>
                                        <td>최대 200만원 (총 사업비의 70% 이내)<br>(국내 100만원 이내, 해외 200만원 이내)</td>
                                    </tr>

                                    <tr style="border-top:2px solid #000;">
                                        <th>유형</th>
                                    </tr>
                                    <tr>
                                        <td>실증비용<br>지원사업</td>
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                    </tr>
                                    <tr>
                                        <td>제품 서비스 시장출시를 위한 시장조사, 시험 및 검증 테스트, 책임보험료, 실증 시행에 따른 법, 기술 컨설팅 등</td>
                                    </tr>
                                    <tr>
                                        <th>지원규모</th>
                                    </tr>
                                    <tr>
                                        <td>최대 800만원 (총 사업비의 70% 이내)</td>
                                    </tr>

                                    <tr style="border-top:2px solid #000;">
                                        <th>유형</th>
                                    </tr>
                                    <tr>
                                        <td>시제품 제작 지원사업 </td>
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                    </tr>
                                    <tr>
                                        <td>제품 디자인, 시제품 개발 등</td>
                                    </tr>
                                    <tr>
                                        <th>지원규모</th>
                                    </tr>
                                    <tr>
                                        <td>최대 800만원 (총 사업비의 70% 이내)</td>
                                    </tr>
                                    <tr style="border-top:2px solid #000;">
                                        <th>유형</th>
                                    </tr>
                                    <tr>
                                        <td>인증마크 취득 지원사업</td>
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                    </tr>
                                    <tr>
                                        <td>신제품(NEP), 신기술(NET), GS(Good Software) 등 국내 인증·마크 </td>
                                    </tr>
                                    <tr>
                                        <th>지원규모</th>
                                    </tr>
                                    <tr>
                                        <td>최대 400만원 (총 사업비의 70% 이내)</td>
                                    </tr>
                                    <tr style="border-top:2px solid #000;">
                                        <th>유형</th>
                                    </tr>
                                    <tr>
                                        <td>마케팅/홍보 지원사업 </td>
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                    </tr>
                                    <tr>
                                        <td>자사 제품/서비스 국내 광고, 온라인 보도자료, SNS홍보, 온라인 쇼핑몰 입점 등</td>
                                    </tr>
                                    <tr>
                                        <th>지원규모</th>
                                    </tr>
                                    <tr>
                                        <td>최대 500만원 (총 사업비의 70% 이내)</td>
                                    </tr>
                                </table>

                            </div>

                        </li>
                    </ul>
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