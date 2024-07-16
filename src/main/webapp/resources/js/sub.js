$(function(){
    
    /*회의실 예약*/
    $('.check_btns .metting_btn').click(function(){
        $('.metting_modal').show();
        $('.modal_dummy').show();
    });

    $('.check_btns a:first-of-type, .top_metting_modal button, .modal_dummy').click(function(){
        $('.metting_modal').hide();
        $('.modal_dummy').hide();
    });

    /*답글쓰기*/
    $('.write2_btn').on('click', function(e){
        $(this).closest('.comment_talk').next('.comment_wwrite').toggle();
        $(this).closest('.comment_ttalk').next('.comment_wwrite').toggle();
    });

    /*rotate 반응형*/
    $('.sub_bnr_wrap .route button').click(function(){
        if(!$(this).hasClass('active')){
            $(this).addClass('active');
            $(this).next('.sub_bnr_wrap .route .dep01').stop().slideDown();
        }else{
            $(this).removeClass('active');
            $(this).next('.sub_bnr_wrap .route .dep01').stop().slideUp();
        };
    });
});