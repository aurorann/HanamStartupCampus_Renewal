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
                            <div class="col-lg-4 program-title">
                                <h1 style="color:#853c1c;">액셀러레이팅 프로그램</h1>
                                <h1 class="program-icon program-icon2"></h1>
                            </div>
                            <div class="col-lg-8 program-text">
                                <p><strong>- 사업금액</strong><span>업체별 최대 500만원, 액셀러레이터 지원(10개 스타트업)</span></p>
                                <p><strong>- 사업내용</strong><span>액셀러레이터 선발을 통한 총 10개 스타트업 육성 지원</span></p>
                                <p><strong>- 사업방법</strong><span>바이오헬스 전문 액셀러레이터 선발 위탁 추진</span></p>
                                <p><strong>- 사업종류</strong><span>BM 진단 및 개선, 성장단계별 액셀러레이팅, 유망바이어 발굴 등</span></p>
                                <p><strong>- 액셀러레이팅 프로그램 운영계획</strong></p>
                                    <ul class="circle-icon mg-top-30">
                                        <li><p>엑셀러레이터 모집<br/>공고 및 선정</p></li>
                                        <li><p>지원기업 모집<br/>공고 및 선정<br/>(스타트업 매칭)</p></li>
                                        <li><p>액셀러레이팅<br/>프로그램 운영</p></li>
                                        <li><p>데모데이</p></li>
                                        <li><p>프로그램<br/>운영 성과 보고</p></li>
                                    </ul>
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