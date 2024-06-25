$(function(){

	$("header nav").mouseenter(function(){
		$("header nav .dep02, header .menu_dummy").stop().slideDown(300);
	});

	$("header nav").mouseleave(function(){
		$("header nav .dep02, header .menu_dummy").stop().slideUp(300);
	});

});