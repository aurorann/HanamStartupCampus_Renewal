$(function(){

	/*하위메뉴*/
	$("header nav").mouseenter(function(){
		$("header nav .dep02, header .menu_dummy").stop().slideDown(300);
	});

	$("header nav").mouseleave(function(){
		$("header nav .dep02, header .menu_dummy").stop().slideUp(300);
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
	
});