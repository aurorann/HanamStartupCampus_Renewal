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
                                <h1 style="color:#2d452d;">스타트업 전문교육 및<br>창업경진대회</h1>
                                <h1 class="program-icon program-icon3"></h1>
                            </div>
                            <div class="col-lg-8 program-text">
                                <p><strong>- 사업대상</strong><span>창업 7년 이내 창업가 및 예비창업 > 총 10개팀 선정</span></p>
                                <p><strong>- 사업방법</strong><span>창업경진대회 개최를 통해 선정된 스타트업 맞춤 후속지원 / 실질적 사업계획서<br/>작성과 전문가 멘토를 통한 실무중심 교육</span></p>
                                <p><strong>- 사업종류</strong><span>컨설팅, 특허, 인증 등 지원(창업 맞춤형 후속지원)</span></p>
                                <p><strong>- 사업규모</strong><span>10개 스타트업 / 스타트업 교육비</span></p>
                                    <table class="table-sm">
                                    	<thead>
                                    		<tr>
	                                        	<th width="33%;">창업경진대회</th>
	                                            <th width="33%;">우수스타트업 입주 유치</th>
	                                            <th width="33%;">캠퍼스 홍보</th>
	                                        </tr>
                                    	</thead>
                                    	<tbody>
                                    		<tr>
	                                        	<td>
	                                                자격 : 3년 미만 창업자 또는<br/>예비 창업자<br/>
	                                                    분야 : 바이오헬스 및 관련 분야<br/>
	                                                    혜택 : 캠퍼스 우선 입주권 및<br/>　다양한 후속 지원
	                                            </td>
	                                            <td>우수한 스타트업 유치 및 캠퍼스 입주 연계 국내 대회 & 글로벌 대회로 진출</td>
	                                            <td>종합병원, 대학, 협회, 벤처캐피탈, 액셀러레이터, 기업(스타트업) 등 대외적 홍보 및 네트워크 강화</td>
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