$(function(){

    /*메인 슬라이더*/
    var swiper = new Swiper(".main_swiper", {
        loop:true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });

    /*news_swiper*/
    var swiper = new Swiper(".news_swiper", {
        slidesPerView: 3,
        spaceBetween: 40,
        loop:true
    });

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
    });
    
});