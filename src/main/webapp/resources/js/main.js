$(function(){

    /*메인 슬라이더*/
    var mainSwiper = new Swiper(".mySwiper", {
        loop : true,
        effect:'fade',
        observer: true,
        observeParents: true,
        autoplay: {
            delay:4500,
            disableOnInteraction:false,
        },
        navigation: {
            nextEl: ".main_next",
            prevEl: ".main_prev",
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });

    /*news_swiper*/
    /*const newsSwiperOptions = {
        loop:true,
        observer: true,
        observeParents: true,
        autoplay: {
            delay:4000,
            disableOnInteraction:false,
        },
        breakpoints: {
            1280: {
                slidesPerView: 3,
                spaceBetween: 35,
            },
            1024: {
                slidesPerView: 3,
                spaceBetween: 30,
            },
            600: {
                slidesPerView: 2,
                spaceBetween: 25,
            },
            320: {
                slidesPerView: 1,
                spaceBetween: 25,
            },
        },
    }
    var swiper = new Swiper("#new_tab1", newsSwiperOptions);
    var swiper = new Swiper("#new_tab2", newsSwiperOptions);
    var swiper = new Swiper("#new_tab3", newsSwiperOptions);*/
    const newsSwiper = new Swiper(".news_swiper", {
        loop:true,
        observer: true,
        observeParents: true,
        autoplay: {
            delay:4000,
            disableOnInteraction:false,
        },
        breakpoints: {
            1280: {
                slidesPerView: 3,
                spaceBetween: 35,
            },
            1024: {
                slidesPerView: 3,
                spaceBetween: 30,
            },
            600: {
                slidesPerView: 2,
                spaceBetween: 25,
            },
            320: {
                slidesPerView: 1,
                spaceBetween: 25,
            },
        },
    });

    /*business_swiper 사업안내*/
    var businessSwiper = new Swiper(".business_swiper", {
        loop:true,
        observer: true,
        observeParents: true,
        navigation: {
            nextEl: ".business_next",
            prevEl: ".business_prev",
        },
        breakpoints: {
            1024: {
                slidesPerView: 3,
                spaceBetween: 35,
            },
            800: {
                slidesPerView: 3,
                spaceBetween: 25,
            },
            600: {
                slidesPerView: 2,
                spaceBetween: 20,
            },
            480: {
                slidesPerView: 2,
                spaceBetween: 15,
            },
            320: {
                slidesPerView: 1,
                spaceBetween: 10,
            },
        },
    });

    /*guide_swiper 시설안내*/
    var guideSwiper = new Swiper(".guide_swiper", {
        slidesPerView: 1,
        effect:'fade',
        observer: true,
        observeParents: true,
        loop:true,
        autoplay: {
            delay:2500,
            disableOnInteraction:false,
        },
        navigation: {
            nextEl: ".guide_next",
            prevEl: ".guide_prev",
        },
    });

    /*ent_introduce_swiper 기업소개*/
    var entSwiper = new Swiper(".ent_introduce_swiper", {
        loop:true,
        observer: true,
        observeParents: true,
        autoplay: {
            delay:3000,
            disableOnInteraction:false,
        },
        navigation: {
            nextEl: ".ent_introduce_next",
            prevEl: ".ent_introduce_prev",
        },
        breakpoints: {
            1440: {
                slidesPerView: 5,
                spaceBetween: 40,
            },
            1280: {
                slidesPerView: 5,
                spaceBetween: 40,
            },
            1024: {
                slidesPerView: 4,
                spaceBetween: 45,
            },
            800: {
                slidesPerView: 5,
                spaceBetween: 45,
            },
            600: {
                slidesPerView: 4,
                spaceBetween: 40,
            },
            480: {
                slidesPerView: 3,
                spaceBetween: 35,
            },
            320: {
                slidesPerView: 2,
                spaceBetween: 25,
            },
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