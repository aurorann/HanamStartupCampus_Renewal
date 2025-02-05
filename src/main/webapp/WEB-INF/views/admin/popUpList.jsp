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
	
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/mgr.css' />">

</head>


<body class="animsition restyle-index">
	
	<!-- # common: header-menu start -->
    <%@ include file="/WEB-INF/header-menu.jsp"%>
    <!-- # common: header-menu end -->   
	
	<!-- # common: header-menu-img start -->
    <%@ include file="./include/header-menu-img.jsp"%>
    <!-- # common: header-menu-img end -->  
    
	<div class="sub_container in_1400">
	
		<!-- # include: side-menu start -->
		<%@ include file="./include/side-menu.jsp"%>
		<!-- # include: side-menu end -->
		<main>
                <!-- # include: title-box start -->
                <%@ include file="./include/title-box.jsp"%>
                <!-- # include: title-box end -->

                <div class="container_wrap">
					<table class="board_wrap">
						<thead class="board_hd">
							<tr>
								<th width="8%">번호</th>
								<th width="44%">타이틀</th>
								<th width="10%">크기</th>
								<th width="8%">표출</th>
								<th width="10%">표출 기한</th>
								<th width="20%">작성일</th>
							</tr>
						</thead>
						<tbody class="board_body" id="popUpList">
							<tr>
								<td class="board_numb" colspan="10">작성된 팝업이 존재하지 않습니다.</td>
							</tr>
						</tbody>
					</table>
                    
                    <div class="pagination_wrap" id="pager">
                    
					</div>
                    
                    <!-- <button class="btn btn-primary" style="float: right;" onclick="location.href='<c:url value='/popUp/insertPopUpForm' />'">신규 작성</button> -->
	                <button onClick="location.href='<c:url value="/popUp/insertPopUpForm" />'" class="write_btn">신규작성</button>
                </div><!-- r-contents div 끝 -->
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script>
		$(function(){
			
			contentDetail = function(num){
				location.href = "${pageContext.request.contextPath}/popUp/updatePopUpForm?num="+num;
			}
			
			search = function(curPage){
				
				if(!curPage){curPage=1}
				
				$.ajax({
					url:"${pageContext.request.contextPath}/popUp/getPopUpList",
					data: "curPage="+curPage,
					cache: false,
					success: function(result){
						console.log(result);
						
						var list = result.list;
						
						var popUpList = ''
						$.each(list,function(index,item){							
							
							popUpList+=
										'<tr onclick="contentDetail('+item.num+')" style="cursor:pointer">' +
											'<td class="board_numb">' + item.num + '</td>' +
											'<td class="board_title"><a href="#">' + item.title + '</a></td>' +
											'<td>' + item.contentsWidth + ',' + item.contentsHeight + '</td>' +
											'<td>' + item.displayYn + '</td>' +
											'<td>' + item.displayDate + '</td>' +
											'<td>' + moment(item.createdAt).format("YYYY-MM-DD hh:mm:ss").slice(2) + '</td>' +
										'</tr>';
						})
						$('#popUpList').html(popUpList);
						
						
						
						var page = result.pager;
						
						var pageHTML = popupPagenation(page);

						/*
						var pagerContent = "";
						
						
						if(pager.curRange!=1){pagerContent+="<li class='page-item'><a class='page-link' href='javascript:search("+(pager.startPage-1)+")'><</a></li>"}
						for(i=pager.startPage;i<=pager.endPage;i++){
							if(i!=pager.curPage){pagerContent+="<li class='page-item' ><a class='page-link' href='javascript:search("+i+")'>"+i+"</a></li>"}
							if(i==pager.curPage){pagerContent+="<li class='page-item active' ><a class='page-link' href='javascript:search("+i+")'>"+i+"</a></li>"}
						}
						if(pager.curRange!=pager.rangeCnt){pagerContent+="<li class='page-item' ><a class='page-link' href='javascript:search("+(pager.endPage+1)+")'>></a></li>"}
						*/
						
						
						
						$("#pager").html(pageHTML);
					},
					error:function(request,status,error){
					   alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
						
				})
			}
			
			search(1)
		})
	</script>
	<!-- extension end -->
	

</body>
</html>