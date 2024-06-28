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
    }
    var swiper = new Swiper("#new_tab1", newsSwiperOptions);
    var swiper = new Swiper("#new_tab2", newsSwiperOptions);
    var swiper = new Swiper("#new_tab3", newsSwiperOptions);

    /*business_swiper*/
    var swiper = new Swiper(".business_swiper", {
        slidesPerView: 4,
        spaceBetween: 40,
        loop:true,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

    /*ent_introduce_swiper*/
    var swiper = new Swiper(".ent_introduce_swiper", {
        slidesPerView: 5,
        spaceBetween: 30,
        loop:true,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        autoplay: {
            delay:2500,
            disableOnInteraction:false,
        },
    });

    /*bio_swiper*/
    var swiper = new Swiper(".bio_swiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop:true,
        effect:'fade',
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
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