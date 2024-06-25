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
                    <form id="pwChangeForm" action="<c:url value="/user/account/password/change" />">
	                    <div class="ent-title">
	                        <h3 class="m-title"><img src="<c:url value="/resources/img/sub-title.png" />">&nbsp;&nbsp;비밀번호 변경</h3>
	                        <p>기존 비밀번호를 입력해 새 비밀번호를 등록하세요.</p>
	                    </div>
	                    <div class="gray-box">
	                        <div class="input-box">
	                            <label for="pw-before">기존 비밀번호</label>
	                            <input type="password" id="oldPassword" name="oldPassword">
	                        </div>
	                        <div class="input-box">
	                            <label for="pw-new">새 비밀번호</label>
	                            <input type="password" id="newPassword" name="newPassword">
	                        </div>
	                        <div class="input-box">
	                            <label for="pw-new-cf">비밀번호 확인</label>
	                            <input type="password" id="newPasswordConfirm" >
	                        </div>
	                    </div>
	                    
	                    <div class="mg-top-60" style="text-align:center; width:100%;">
			                <ul>
			                    <li><a href="javascript:void(0);" onclick="changePassword()" class="search-btn" style="float: none;display:block; width:200px; margin:0 auto;">비밀번호 변경</a></li>
			                </ul>
			            </div>
                    </form>
                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script>
		if(("${RNUM}") === 1 ) {
			alert("비밀번호가 변경되었습니다.");
		} else if(("${RNUM}") === 0){
			alert("알맞은 비밀번호가 아닙니다. 입력된 비밀번호를 확인해주세요.");
		}
		
		function changePassword() {
			var oldPw = oldPassword.value;
			var newPw = newPassword.value;
			var confirmPw = newPasswordConfirm.value;
			
			if(
				(oldPw.trim() !== "" && newPw.trim() !== "")
				&& (oldPw.length < 100 && newPw.length < 100)
				&& (newPw === confirmPw)
			) {
				$.ajax({
					type : 'POST',
					cache: false,
					url : '<c:url value="/user/account/password/change" />',
					headers : {
						'${_csrf.headerName}' : '${_csrf.token}'
					},
					data: {
						oldPassword: oldPw,
						newPassword: newPw,
						seqId: Number("${SEQ_ID}")
					},
					success : function(result) {
						if(result > 0) {
							alert("비밀번호가 변경되었습니다.");
							location.reload();
						} else {
							alert('비밀번호 변경 실패, 입력한 비밀번호를 확인해주세요.');
						}
					},
					error : function(error) {
						console.log(error);
						alert('비밀번호 변경 실패, 관리자에게 문의해주세요.');
					},
					statusCode : {
						302 : function(res, statTxt, jqXHR) {
							alert('로그인이 필요한 기능입니다.');
							return false;
						}
					}
				})
			} else {
				alert('비밀번호 변경 실패, 입력한 비밀번호를 확인해주세요.')
			}
		}
	</script>
	<!-- extension end -->
	

</body>
</html>
