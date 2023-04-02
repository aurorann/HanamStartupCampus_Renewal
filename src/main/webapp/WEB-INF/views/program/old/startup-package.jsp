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
    <%@ include file="../include/script.jsp"%>
    <!-- # include: script end -->
	<!-- # include: stylesheet start -->
	<%@ include file="../include/stylesheet.jsp"%>
	<!-- # include: stylesheet end -->
</head>


<body class="animsition restyle-index">
	
	
	<!-- # common: header-menu start -->
    <%@ include file="/WEB-INF/header-menu.jsp"%>
    <!-- # common: header-menu end -->   

    <!-- # include: location start -->
    <%@ include file="../include/location.jsp"%>
    <!-- # include: location end -->
    
   

    <div class="sub-contents">
        <div class="inner">
            <!-- # include: side-menu start -->
            <%@ include file="../include/side-menu.jsp"%>
            <!-- # include: side-menu end -->
            
            <div class="right-contents col-lg-9">
                <!-- # include: title-box start -->
                <%@ include file="../include/title-box.jsp"%>
                <!-- # include: title-box end -->

                <div class="col-lg-12 r-contents program-box">
                    <ul>
                        <li>
                            <div class="col-lg-4 col-md-12 program-title">
                                <h1 style="color:#23468c;">스타트업 패키지 지원사업</h1>
                                <h1 class="program-icon program-icon1"></h1>
                            </div>
                            <div class="col-lg-8 program-text">
                                <p><strong>- 지원대상</strong><span>창업 7년 이내의 하남시 디지털바이오헬스 분야 스타트업</span></p>
                                <p><strong>- 지원내용</strong><span>업체별 최대 2,000만원(총 소요비용의 70% 이내), 10개 기업 내외</span></p>
                                <p><strong>- 지원방법</strong><span>지원대상 기업 선정, 중간점검 및 결과보고 후 2회 분할지원</span></p>
                                <p><strong>- 지원종류</strong><span>출원・등록비, 기술이전비, 시제품 제작비, 인증마크 취득비</span></p>
                                <p><strong>- 지원내용 및 소요예산</strong></p>
                                    <table class="table-sm">
                                        <thead>
                                        	<tr>
	                                            <th>유형</th>
	                                            <th>내용</th>
	                                            <th>소요예산</th>
	                                        </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
	                                            <td>지식재산권 취득</td>
	                                            <td>지식재산권(발명, 디자인, 상표 등) 출원 및 등록</td>
	                                            <td>
	                                                <small>총 사업비의 70% 이내에서<br>최대 150만원까지 지원</small>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td>기술이전비 지원</td>
	                                            <td>우수기술(특허) 이전</td>
	                                            <td>
	                                                <small>총 사업비의 70% 이내에서<br>최대 500만원까지 지원</small>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td>시제품 제작</td>
	                                            <td>제품 디자인, 시제품 개발 등</td>
	                                            <td>
	                                                <small>총 사업비의 70% 이내에서<br>최대 2000만원까지 지원</small>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td>인증마크 취득</td>
	                                            <td>신제품(NEP), 신기술(NET)등 국내 인증마크 취득</td>
	                                            <td>
	                                                <small>총 사업비의 70% 이내에서<br>최대 500만원까지 지원</small>
	                                            </td>
	                                        </tr>
                                        </tbody>
                                    </table>
                            </div>
                        </li>
                    </ul>
                   


                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </div>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	
	<!-- extension end -->
	

</body>
</html>