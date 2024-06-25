<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    	<footer class="footer">
		    <div class="container p-b-60">
		        <div class="row">
		
		            <div class="col-sm-12 col-lg-3 footer-right">
		                <div id="family-site">
		                        <div class="family_guide"> 
		                            <ul>
		                                <li>
		                                    <button title="패밀리사이트 메뉴 열기">
		                                        패밀리사이트 바로가기
		                                    </button>
		                                    <ul>
		                                        <!-- <li>
		                                            <a href="https://www.hanam.go.kr/www/index.do" target="_blank">하남시청</a>
		                                        </li>
		                                        <li>
		                                            <a href="https://www.hnart.or.kr/" target="_blank">하남 문화재단</a>
		                                        </li>
		                                        <li>
		                                            <a href="http://www.hanamrehab.or.kr/front/main/main.php" target="_blank">하남 장애인복지관</a>
		                                        </li>
		                                        <li>
		                                            <a href="http://hanament.com/main/main.php" target="_blank">하남 기업인협의회</a>
		                                        </li>
		                                        <li>
		                                            <a href="http://www.holthanam.or.kr/?" target="_blank">하남시 종합사회복지관</a>
		                                        </li>
		                                        <li>
		                                            <a href="https://www.hnchildcare.or.kr/?" target="_blank">하남시 유아종합지원센터</a>
		                                        </li>   -->                  
		                                    </ul>
		                                </li>
		                            </ul>
		                        </div>
		                </div>
		            </div>
		
		
		            <div class=" col-sm-12 col-lg-9 footer-left">
		
		                <div class="">
		                    <div class="wrap-link-footer">
		                        <ul class="col-left">
		                            <li><a href="https://www.huic.co.kr/www/contents.do?key=78" style="color:#ffa646">개인정보처리방침</a></li>
		                            <li><a href="https://www.huic.co.kr/www/contents.do?key=205">이메일무단수집거부</a></li>
		                            <li><a href="https://www.huic.co.kr/www/selectBbsNttList.do?bbsNo=30&key=194">홈페이지개선요구</a></li>
		                        </ul>
		                    </div>
		                </div>
		
		                <p>
		                    [12902] 경기도 하남시 미사강변한강로 177 KDB산업은행 IT센터 3층 하남스타트업캠퍼스
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>TEL. 031)790-9591</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>FAX. 031)795-3310</span>
		                </p>
		                <p class="copy">
		                    copyright &copy; 2021 Hanam Urban Innovation Corporation. All Rights reserved.
		                </p>
		            </div>
		            
		        </div>
		    </div>
		</footer>
	
	
		<!-- Back to top -->
		<div class="btn-back-to-top hov-bg-main" id="myBtn">
			<span class="symbol-btn-back-to-top">
				<img src="<c:url value='/resources/img/top-btn.png' />"  alt="맨 위로 가기">
			</span>
	    </div>
		<script src="<c:url value='/resources/js/slick.js' />"></script>
    	<script src="<c:url value='/resources/js/jquery.easing.1.3.min.js' />"></script>
		<script src="<c:url value='/resources/js/animsition.min.js' />"></script>
		<script src="<c:url value='/resources/js/main.js' />"></script>
		<script src="<c:url value='/resources/js/cmmn.js'/>"></script>
	
	
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
		        $("div.left-menu ul li[data-location-sub='${locationSub}'] a").addClass("hover");
		        
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
		    			
		    			$("#family-site ul li ul").html(htmlArr.join(""));
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