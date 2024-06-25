<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<footer class="footer">
	    <div class="top_ft">
	        <div class="in_1400">
	            <div class="link_wrap">
	                <a href="https://www.huic.co.kr/www/contents.do?key=78">개인정보처리방침</a>
	                <a href="https://www.huic.co.kr/www/contents.do?key=205">이메일무단수집거부</a>
	                <a href="https://www.huic.co.kr/www/selectBbsNttList.do?bbsNo=30&key=194">홈페이지개선요구</a>
	            </div>
	            <div class="ico_wrap">
	                <a href="https://www.youtube.com/channel/UCIT4wZzDZCF2J9ppP6b-6Eg"><img src="<c:url value='/resources/img/youtube_ico.png' />" alt="하남스타트업캠퍼스유튜브"></a>
	                <a href="https://www.instagram.com/hanamstartup"><img src="<c:url value='/resources/img/instagram_ico.png' />" alt="하남스타트업캠퍼스인스타그램"></a>
	            </div>
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
		<!-- 
		<script src="<c:url value='/resources/js/slick.js' />"></script>
    	<script src="<c:url value='/resources/js/jquery.easing.1.3.min.js' />"></script>
		<script src="<c:url value='/resources/js/animsition.min.js' />"></script>
		<script src="<c:url value='/resources/js/main.js' />"></script>
		<script src="<c:url value='/resources/js/cmmn.js'/>"></script>
	 	-->
	
		<script >
	        function openModal(modalname){
		      document.get
		      $(".r-modal").fadeIn(300);
		      $("."+modalname).fadeIn(300);
		    }

	        $(function(){
		        $('#slider-div').slick({
		            slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
		            infinite : true, 	//무한 반복 옵션	 
		            slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
		            slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
		            fade : true,
		            speed : 1000,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		            arrows : false, 		// 옆으로 이동하는 화살표 표시 여부
		            dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
		            autoplay : true,			// 자동 스크롤 사용 여부
		            autoplaySpeed : 5000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		            pauseOnHover : false,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		            pauseOnFocus : false,		// 슬라이드 이동	시 슬라이더에 포커스가 있으면 슬라이더 멈추게 설정
		            vertical : false,		// 세로 방향 슬라이드 옵션
		            dotsClass : "slide-dots", 	//아래 나오는 페이지네이션(점) css class 지정
		            draggable : true, 	//드래그 가능 여부 
		            
		            responsive: [ // 반응형 웹 구현 옵션
		                {  
		                    breakpoint: 960, //화면 사이즈 960px
		                    settings: {
		                        //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
		                        slidesToShow:1
		                    } 
		                },
		                { 
		                    breakpoint: 768, //화면 사이즈 768px
		                    settings: {	
		                        //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
		                        slidesToShow:1
		                    } 
		                }
		            ]
		
		        });
	        
		        $(".r-modal, .close, .gray-btn").on('click',function(){
		  	      $(".r-modal").fadeOut(300);
		  	      $(".modal-con").fadeOut(300);
		  	    });
		        
		        $("div.menu-desktop.gnb ul li[data-location-main='${locationMain}']").addClass("nav-pink");
		        $("aside.left-menu ul li[data-location-sub='${locationSub}'] a").addClass("hover");
		        
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