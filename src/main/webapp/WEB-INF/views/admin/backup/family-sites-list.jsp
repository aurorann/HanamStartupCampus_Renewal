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


<body>
	
	
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
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="30%">패밀리사이트 이름</th>
								<th width="50%">사이트 주소</th>
								<th width="20%">관리 기능</th>
							</tr>
						</thead>
						<tbody id="family-site-list" style="color: #666">
							<c:forEach items="${siteList}" var="item">
								<tr class="site-${item.seqId}-el }">
									<td><input class="site-name" value="${item.name}" /></td>
									<td><input class="site-address" value="${item.pageAddress}" style="width: 90%;"/></td>
									<td>
										<button type="button" class="search-btn" onclick="editFamilySite(${item.seqId})" style="margin-right: 10px; font-size: 0.5em; float: none;">수정</button>
		                    			<button type="button" class="search-btn" onclick="removeFamilySite(${item.seqId})" style="font-size: 0.5em; float: none;">삭제</button>
									</td>
								</tr>
							</c:forEach>
							<tr><td colspan="3" style="border-left: 0px; border-right: 0px;"></td></tr>
							<tr id="new-site">
									<td><input class="site-name" /></td>
									<td><input class="site-address"  style="width: 90%;"/></td>
									<td>
		                    			<button type="button" class="search-btn" onclick="addNewFamilySite()" style=" font-size: 0.5em; float: none;">새 사이트 추가</button>
									</td>
								</tr>
						</tbody>
					</table>
                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </div>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script >
		function addNewFamilySite() {
			var data = {
				name: document.querySelector("#new-site .site-name").value,
				pageAddress: document.querySelector("#new-site .site-address").value
			}
			
			confirm("새 패밀리사이트를 추가하시겠습니까?") &&
			$.ajax({
				type : 'POST',
				cache: false,
				url : '<c:url value="/admin/family-site/site/add" />',
				headers : {
					'${_csrf.headerName}' : '${_csrf.token}'
				},
				data: data,
				success : function(result) {
					if(result.count > 0) {
						alert(result.message);
						location.href = '<c:url value="/admin/family-site/list" />';	
					} else {
						alert('새 패밀리사이트 추가 실패, 관리자에게 문의해주세요.');
					}
				},
				error : function(error) {
					alert('새 패밀리사이트 추가 실패, 관리자에게 문의해주세요.');
				},
				statusCode : {
					302 : function(res, statTxt, jqXHR) {
						alert('로그인이 필요한 기능입니다.');
						return false;
					}
				}
			});
		}
		
		function editFamilySite(seqId) {
			var data = {
				seqId: seqId,
				name: document.querySelector(".site-" + seqId + "-el .site-name").value,
				pageAddress: document.querySelector(".site-" + seqId + "-el .site-address").value
			}
			
			confirm("해당 패밀리사이트를 수정하시겠습니까?") &&
			$.ajax({
				type : 'POST',
				cache: false,
				url : '<c:url value="/admin/family-site/site/edit" />/' + seqId,
				headers : {
					'${_csrf.headerName}' : '${_csrf.token}'
				},
				data: data,
				success : function(result) {
					if(result.count > 0) {
						alert(result.message);
						location.href = '<c:url value="/admin/family-site/list" />';	
					} else {
						alert('패밀리사이트 수정 실패, 관리자에게 문의해주세요.');
					}
				},
				error : function(error) {
					alert('패밀리사이트 수정 실패, 관리자에게 문의해주세요.');
				},
				statusCode : {
					302 : function(res, statTxt, jqXHR) {
						alert('로그인이 필요한 기능입니다.');
						return false;
					}
				}
			});
		}
		
		function removeFamilySite(seqId) {
			confirm("해당 패밀리사이트를 삭제하시겠습니까?") &&
			$.ajax({
				type : 'POST',
				cache: false,
				url : '<c:url value="/admin/family-site/site/remove" />/' + seqId,
				headers : {
					'${_csrf.headerName}' : '${_csrf.token}'
				},
				success : function(result) {
					if(result.count > 0) {
						alert(result.message);
						location.href = '<c:url value="/admin/family-site/list" />';	
					} else {
						alert('패밀리사이트 삭제 실패, 관리자에게 문의해주세요.');
					}
				},
				error : function(error) {
					alert('패밀리사이트 삭제 실패, 관리자에게 문의해주세요.');
				},
				statusCode : {
					302 : function(res, statTxt, jqXHR) {
						alert('로그인이 필요한 기능입니다.');
						return false;
					}
				}
			});
		}
	</script>
	<!-- extension end -->
	

</body>
</html>