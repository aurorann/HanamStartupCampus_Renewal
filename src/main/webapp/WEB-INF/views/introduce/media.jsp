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

                <div class="col-lg-12 r-contents">
                   
                    <div class="col-lg-12" style="margin:0; padding:0;">
                        <h3 class="m-title"><img src="<c:url value='/resources/img/sub-title.png' />">&nbsp;&nbsp;하남스타트업캠퍼스 소개 동영상</h3>
                    </div>

                    <div class="">

                        <div class="hongbo-body"> 
                            <ul class="hongbo-list"> 
                                <li class="hongbo-item">
                                    <a href="" class="hongbo-img">
                                        <div class="ent-logo">
                                            <div class="ent-logo-detail">
                                                <img src="<c:url value='/resources/img/sub/video-ex.png' />">
                                            </div>
                                        </div>
                                    </a>
                                    <div class="caption"> 
                                        <a href="">
                                        <strong>영상 제목 1</strong>
                                        <small>| 2021-01-26 |</small>
                                        </a>
                                    </div>
                                </li> 

                                <li class="hongbo-item">
                                    <a href="" class="hongbo-img">
                                        <div class="ent-logo">
                                            <div class="ent-logo-detail">
                                                <img src="<c:url value='/resources/img/sub/video-ex.png' />">
                                            </div>
                                        </div>
                                    </a>
                                    <div class="caption"> 
                                        <a href="">
                                        <strong>영상 제목 2</strong>
                                        <small>| 2021-01-26 |</small>
                                        </a>
                                    </div>
                                </li> 

                            </ul> 
                            
                        </div>

                        <div class="page-wrap">
                         <nav aria-label="Page navigation example">
                            <ul class="pagination">
                              <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                  <span aria-hidden="true"><img src="<c:url value='/resources/img/arrow_left_sm.png' />"></span>
                                </a>
                              </li>
                              <li class="page-item active"><a class="page-link" href="#">1</a></li>
                              <li class="page-item"><a class="page-link" href="#">2</a></li>
                              <li class="page-item"><a class="page-link" href="#">3</a></li>
                              <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                  <span aria-hidden="true"><img src="<c:url value='/resources/img/arrow_right_sm.png' />"></span>
                                </a>
                              </li>
                            </ul>
                          </nav>
                        </div>
                        
                    </div>

                



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