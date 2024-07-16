<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<footer class="footer">
	    <div class="top_ft">
	        <div class="in_1400">
	            <a href="https://www.huic.co.kr/www/contents.do?key=78">개인정보처리방침</a>
	            <a href="https://www.huic.co.kr/www/contents.do?key=205">이메일무단수집거부</a>
	            <!-- <a href="https://www.huic.co.kr/www/selectBbsNttList.do?bbsNo=30&key=194">홈페이지개선요구</a> -->
	        </div>
	    </div><!--top_ft-->
	
        <div class="bottom_ft">
            <div class="in_1400">
                <div class="text_wrap">
                    <p>
                        [12902] 경기도 하남시 미사강변한강로 177 KDB산업은행 IT센터 3층 하남스타트업캠퍼스</br>
                        copyright © 2021 Hanam Urban Innovation Corporation. All Rights reserved
                    </p>
                    <div class="tel">
                        TEL. 031)790-9591
                        <span>FAX. 031)8027-76101</span>
                    </div>
                </div>
                <div class="family_btn" id="family-site">
                    <button type="button">패밀리사이트 바로가기</button>
                    <ul>
                    	<!-- 
                        <li><a href="#">하남도시공사</a></li>
                        <li><a href="#">하남시청</a></li>
                        <li><a href="#">하남시 기업인 협의회</a></li>
                        <li><a href="#">건국대 링크플러스사업단</a></li>
                        <li><a href="#">신용보증기금</a></li>
                         -->
                    </ul>
                </div>
            </div>
        </div><!--bottom_ft-->
	</footer>
		<script src="<c:url value='/resources/js/animsition.min.js' />"></script>
		<script src="<c:url value='/resources/js/cmmn.js'/>"></script>
	
		<script >
	        function openModal(modalname){
		      document.get
		      $(".r-modal").fadeIn(300);
		      $("."+modalname).fadeIn(300);
		    }

	        $(function(){
		        $(".r-modal, .close, .gray-btn").on('click',function(){
		  	      $(".r-modal").fadeOut(300);
		  	      $(".modal-con").fadeOut(300);
		  	    });

		        
		        
		        
		        $("div.menu-desktop.gnb ul li[data-location-main='${locationMain}']").addClass("nav-pink");
		        $("aside.left-menu ul li[data-location-sub='${locationSub}'] a").addClass("active");
		        $(".m-side-menu").text("${locationSub}");
		        
		        //관리자 메뉴 inside menu active
		        
		        
		        //var pathname = window.location.pathname;
				
				//$("div.inside-menu a").each(function() {
					//const href = $(this).attr('href');
					//if (href.startsWith(pathname) || href.includes(pathname)) {
						//$(this).addClass("you-are-here");
					//}
				//});
		        
				
		        $.ajax({
		    		type : 'GET',
		    		cache: false,
		    		url : '<c:url value="/family-site/site/list" />',
		    		success : function(res) {
		    			var htmlArr = [];
		    			
		    			res.every(function(el) {
		                    var fixedHTML = '<li><a href="' + el.pageAddress + '" target="_blank">' + el.name + '</a></li>';
		                    htmlArr.push(fixedHTML);
		                    
		                    return true;
		    			});
		    			
		    			$("#family-site ul").html(htmlArr.join(""));
		    		},
		    		error : function(error) {
		    			alert('패밀리사이트 목록을 불러오지 못했습니다, 관리자에게 문의해주세요.');
		    		}
		    	});
	        });
	        </script>
	        
	        <script src="<c:url value='/resources/js/imgmaps.min.js'/>"></script>
	        <script >
		        (function($){
		        	$('img[usemap]').rwdImageMaps();
	            })(jQuery);
		    </script>