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

                <div class="col-lg-12 r-contents program-box">
                    <ul>
                        <li>
                            <div class="col-lg-4 program-title">
                                <h1 style="color:#008c91;">멘토링 프로그램</h1>
                            </div>
                            <div class="col-lg-8 program-text" style="margin-bottom:20px;">
                                <p>
                                    <strong>각 분야별 외부 전문가 Pool 연계를 통한 입주기업 애로사항 해결</strong>
                                </p>
                                <p>
                                    <small>전문분야 : 공통(BM, 사업화 진단 등), 경영(회계, 법률 마케팅 등), 기술(바이오헬스, 금속, 지식재산권 등)</small>
                                </p>

                            </div>

                            <table class="table table-pc">
                                <thead>
                                    <tr>
                                        <th style="width:20%; background:#92CE57; color:#fff;">상담신청 및 접수</th>
                                        <th style="width:20%; background:#46C6A2; color:#fff;">기본상담 및 상담 설계</th>
                                        <th style="width:20%; background:#3AC6CB; color:#fff;">멘토링/자문실시</th>
                                        <th style="width:20%; background:#24AACC; color:#fff;">멘토링 사후관리</th>
                                        <th style="width:20%; background:#1784BE; color:#fff;">에로사항 해결</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            • 신청기업 신청서<br>작성 및 제출(상시)<br>
                                        </td>
                                        <td>
                                            • 캠퍼스 전담인력이<br>신청기업 애로사항 파악<br>
                                            • 적합한 전문가 매칭
                                        </td>
                                        <td>
                                            • 심층멘토링/자문<br>
                                            • 결과보고서 제출
                                        </td>
                                        <td>
                                            • 신청기업 대상 멘토링<br>만족도 파악<br>
                                            • 필요시 대내외 지원 프로그램<br>연계 추천<br>
                                        </td>
                                        <td>
                                            • 애로사항 해결
                                        </td>
                                        
                                    </tr>
                                    
                                </tbody>
                            </table>

                            <div style="width:100%; text-align:center; padding:15px 0;">
                                <img src="<c:url value='/resources/img/mentoring.png' />" alt="멘토링 프로그램" width="450">
                            </div>

                            <table class="table table-mobile">
                                <tbody>
                                    <tr>
                                        <th style="width:20%; background:#92CE57; color:#fff;">상담신청 및 접수</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            • 신청기업 신청서 작성 및 제출(상시)<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width:20%; background:#46C6A2; color:#fff;">기본상담 및 상담 설계</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            • 캠퍼스 전담인력이 신청기업 애로사항 파악<br>
                                            • 적합한 전문가 매칭
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width:20%; background:#3AC6CB; color:#fff;">멘토링/자문실시</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            • 심층멘토링/자문<br>
                                            • 결과보고서 제출
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width:20%; background:#24AACC; color:#fff;">멘토링 사후관리</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            • 신청기업 대상 멘토링 만족도 파악<br>
                                            • 필요시 대내외 지원 프로그램 연계 추천<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width:20%; background:#1784BE; color:#fff;">에로사항 해결</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            • 애로사항 해결
                                        </td>
                                    </tr>

                                </tbody>
                                
                            </table>


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