<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<style>
 .sub-top {
    position:relative;
    width:100%;
    height:270px;
    background:url('<c:url value='/resources/img/sub/sub4-bg.png' />') no-repeat 0 0;
  }

  .sub-title {
    position:relative;
    width:100%;
    background:url('<c:url value='/resources/img/sub/sub4-bg.png' />') no-repeat 0 -90px;
  }
  
    @media (max-width: 1300px) {
		.sub-title {
			background:url('<c:url value='/resources/img/sub/sub4-bg.png' />') no-repeat 0 -90px!important;
		}
	}

</style>