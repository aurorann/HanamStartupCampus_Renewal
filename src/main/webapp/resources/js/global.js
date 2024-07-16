$(function(){

	/*하위메뉴*/
	$("header nav").mouseenter(function(){
		$("header nav .dep02, header .menu_dummy").stop().slideDown(300);
	});

	$("header nav").mouseleave(function(){
		$("header nav .dep02, header .menu_dummy").stop().slideUp(300);
	});

	/*
	mobile_btn
	*/
	$('.mobile_btn').click(function(){
		$('.mobile_menu').slideToggle();
	});

	/*mobile_menu 하위*/
	$('.mobile_menu button').click(function(){
        if(!$(this).hasClass('active')){
			$('.mobile_menu ul').slideUp();
            $(this).next().stop().slideDown();
			$(this).addClass('active');
        }else{
			$(this).next().stop().slideUp();
			$(this).removeClass('active');
        };
    });

	/*ft 패밀리버튼*/
	$('.family_btn button').click(function(){
		const hasActive = $(this).hasClass('active');
  
		if(!hasActive){
			$(this).addClass('active');
			$('.family_btn ul').stop().slideDown(300);
		}else{
			$(this).removeClass('active');
			$('.family_btn ul').stop().slideUp(300);
		}
	 });

	/*search 검색*/
	$('.util a:first-of-type').click(function(){
		if(window.innerWidth > 800){
			$('.search_modal').show();
			$('.modal_dummy').show();
		}else{

		};
	});
	
	$('.top_search_modal button, .modal_dummy').click(function(){
		if(window.innerWidth > 800){
			$('.search_modal').hide();
			$('.modal_dummy').hide();
		}else{
			
		};
	});

	/*search_slide 모바일*/
	$('.util a:first-of-type').click(function(){
		if(window.innerWidth < 800){
			$('.search_slide').slideToggle();
		}else{

		};
	});

});