<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<body>
	
	
	<!-- # common: header-menu start -->
    <%@ include file="/WEB-INF/header-menu.jsp"%>
    <!-- # common: header-menu end -->   
    
    <main class="in_1400">
        <div class="login_wrap">
            <div class="top_login">
                <h3><img src="<c:url value='/resources/img/login_ico.png' /> " alt="로그인">입주기업 전용 로그인이 필요한 페이지입니다.</h3>
                <p>발급 받으신 아이디와 비밀번호를 입력해 주세요. </p>
            </div>
            <form id="loginForm" method="post" action="<c:url value='/user/login' />">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            	<div class="input-box">
                    <label for="id">아이디</label>
                    <input type="text" name="accountId">
                </div>
                <div class="input-box">
                    <label for="pw">비밀번호</label>
                    <input type="password" name="accountPw">
                </div>
            </form>
        </div>

        <div class="login_btn">
        	<a onclick="loginForm.submit();" href="javascript:void(0);" class="search-btn" style="float: none;display:block; width:200px; margin:0 auto;">로그인</a>
        </div>
    </main>


	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script>
		if(getParameterByName("error") === "denied") {
			alert("잘못된 계정 정보입니다. 입력한 계정 정보를 확인해주세요.");
		}
		
		$(function() {
			$("[name='accountId'], [name='accountPw']").on("keyup", function() {
				if (window.event.keyCode == 13) {
					loginForm.submit();
		        }
			})
		})
	</script>
	<!-- extension end -->
	

</body>
</html>