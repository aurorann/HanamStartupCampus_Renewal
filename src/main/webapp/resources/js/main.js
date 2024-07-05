$(function(){

    /*메인 슬라이더*/
    var swiper = new Swiper(".mySwiper", {
        loop : true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });

    /*news_swiper*/
    const newsSwiperOptions = {
        slidesPerView: 3,
        spaceBetween: 40,
        loop:true,
        observer: true,
        observeParents: true,
        autoplay: {
            delay:4000,
            disableOnInteraction:false,
        },
    }
    var swiper = new Swiper("#new_tab1", newsSwiperOptions);
    var swiper = new Swiper("#new_tab2", newsSwiperOptions);
    var swiper = new Swiper("#new_tab3", newsSwiperOptions);

    /*business_swiper 사업안내*/
    var swiper = new Swiper(".business_swiper", {
        slidesPerView: 3,
        spaceBetween: 35,
        loop:true,
        navigation: {
            nextEl: ".business_next",
            prevEl: ".business_prev",
        },
    });

    /*guide_swiper 시설안내*/
    var swiper = new Swiper(".guide_swiper", {
        slidesPerView: 1,
        effect:'fade',
        loop:true,
        autoplay: {
            delay:3000,
            disableOnInteraction:false,
        },
    });

    /*ent_introduce_swiper 기업소개*/
    var swiper = new Swiper(".ent_introduce_swiper", {
        slidesPerView: 5,
        spaceBetween: 30,
        loop:true,
        navigation: {
            nextEl: ".ent_introduce_next",
            prevEl: ".ent_introduce_prev",
        },
        autoplay: {
            delay:2500,
            disableOnInteraction:false,
        },
    });
    
    /*하남소식 탭button*/
    $('.news .tab_list button').click(function(){
        var tab = $(this).attr('data-tab');

        $('.news .tab_list button').removeClass('active');
        $('.news_swiper').hide();
        $(this).addClass('active');
        $('#'+tab).fadeIn(400);
     });

});