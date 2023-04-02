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

    <!-- # include: location start -->
    <%@ include file="./include/location.jsp"%>
    <!-- # include: location end -->
    
   

    <div class="sub-contents">
        <div class="inner">
            <!-- # include: side-menu start -->
            <%@ include file="./include/side-menu.jsp"%>
            <!-- # include: side-menu end -->
            
            <div class="right-contents col-lg-9">
                <!-- # include: title-box start -->
                <%@ include file="./include/title-box.jsp"%>
                <!-- # include: title-box end -->

                <div class="col-lg-12 r-contents program-box">
                    <ul>
                        <li>
                            <div class="col-lg-4 program-title">
                                <h1 style="color:#008c91;">스타트업 전문교육</h1>
                            </div>
                            <div class="col-lg-8 program-text" style="margin-bottom:20px;">
                                <p><strong>입주기업의 Needs를 반영한 커리큘럼 구성 및 운영</strong></p>
                            </div>

                            <table class="table table-pc">
                                <thead>
                                    <tr>
                                        <th style="width:20%; background:#92CE57; color:#fff;">수요조사</th>
                                        <th style="width:20%; background:#46C6A2; color:#fff;">연간 커리큘럼 구성</th>
                                        <th style="width:20%; background:#3AC6CB; color:#fff;">교육효과</th>
                                        <th style="width:20%; background:#24AACC; color:#fff;">교육방법</th>
                                        <th style="width:20%; background:#1784BE; color:#fff;">교육대상</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            • 설문 등을 통한 입주기업의<br>교육수요 조사<br>
                                        </td>
                                        <td>
                                            • 입주기업의 Needs와<br>필수교육 프로그램을 연계한<br>커리큘럼 구성<br>
                                        </td>
                                        <td>
                                            • 학습을 통한 전문성 함양<br>
                                            • 비즈니스의 새로운<br>방향성 체득
                                        </td>
                                        <td>
                                            • 이론, 현장실무 사례학습 등<br>
                                            • 스타트업필수실무교육<br>(오프라인자체운영)<br>
                                            • 온라인창업실습교육<br>
                                            • 맞춤형 전문특화교육
                                        </td>
                                        <td>
                                            • 창업 7년이내의<br>하남시 소재 기업 임직원 또는 하남시 거주 중인 예비창업자
                                        </td>
                                        
                                    </tr>
                                    
                                </tbody>
                            </table>

                            <div style="width:100%; text-align:center; padding:15px 0;">
                                <img src="<c:url value='/resources/img/education.png' />" alt="창업경진대회" width="450">
                            </div>

                            <table class="table table-mobile">
                                <tbody>
                                    <tr>
                                        <th style="width:20%; background:#92CE57; color:#fff;">수요조사</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            • 설문 등을 통한 입주기업의 교육수요 조사<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width:20%; background:#46C6A2; color:#fff;">연간 커리큘럼 구성</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            • 입주기업의 Needs와 필수교육 프로그램을 연계한 커리큘럼 구성<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width:20%; background:#3AC6CB; color:#fff;">교육효과</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            • 학습을 통한 전문성 함양<br>
                                            • 비즈니스의 새로운 방향성 체득
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width:20%; background:#24AACC; color:#fff;">교육방법</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            • 이론, 현장실무 사례학습 등<br>
                                            • 스타트업필수실무교육 (오프라인자체운영)<br>
                                            • 온라인창업실습교육<br>
                                            • 맞춤형 전문특화교육
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width:20%; background:#1784BE; color:#fff;">교육대상</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            • 창업 7년이내의 하남시 소재 기업 임직원 또는 하남시 거주 중인 예비창업자
                                        </td>
                                    </tr>
                                </tbody>
                               
                            </table>
                           
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