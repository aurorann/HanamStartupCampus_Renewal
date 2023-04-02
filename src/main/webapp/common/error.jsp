<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Basic Sample</title>
</head>

<body>
    <script>
    
			[
				[
					"Access is denied",
					(function() {
						confirm("해당 페이지의 열람 권한이 없습니다. 로그인 화면으로 이동하시겠습니까?")
							?(location.href = '<c:url value="/user/login/form" />')
							:(location.href = '<c:url value="/home" />');
						
					})
				]
			].every(function(message) {
				if(message[0] === "${exception.message}") {
					message[1]();
					return true;
				}
			}) === false && (location.href = "<c:url value='/home' />")();
			
			
	</script>
</body>
</html>