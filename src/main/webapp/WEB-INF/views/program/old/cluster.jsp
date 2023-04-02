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
                                <h1 style="color:#783232;">클러스터 협의체 운영</h1>
                                <h1 class="program-icon program-icon4"></h1>
                            </div>
                            <div class="col-lg-8 program-text">
                                <p><strong>- 사업내용</strong><span>전략산업별 산·학·연·관·정 참여하는 협의회 운영(협력추진)<br>/ 정책개발 발굴 및 제안 등</span></p>
                                <p><strong>- 사업방법</strong><span>협의회 위원회 운영 및 회의 실시 등</span>
                                    <img src="<c:url value='/resources/img/sub/program-icon4.png' />" style="margin-top: 20px;" alt="클러스터 협의체 설명 이미지">
                                </p>
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