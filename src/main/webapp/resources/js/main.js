
(function ($) {


    /*==================================================================
    [ Back to top ]*/
    var windowH = $(window).height()/2;

    $(window).on('scroll',function(){
        if ($(this).scrollTop() > windowH) {
            $("#myBtn").css('display','flex');
        } else {
            $("#myBtn").css('display','none');
        }
    });

    $('#myBtn').on("click", function(){
        $('html, body').animate({scrollTop: 0}, 300);
    });


    /*==================================================================
    [ Fixed Header ]*/
    var menuHeader = $('.container-menu-desktop');
    var posWrapHeader = $('.menu-desktop').height();

    $(window).on('scroll',function(){
        if($(this).scrollTop() >= posWrapHeader) {
            $(menuHeader).addClass('fix-menu-desktop');
        }  
        else {
            $(menuHeader).removeClass('fix-menu-desktop');
        } 
    });


    /*==================================================================
    [ Menu mobile ]*/
    $('.btn-show-menu-mobile').on('click', function(){
        $(this).toggleClass('is-active');
        $('.menu-mobile').slideToggle();
    });

    var arrowMainMenu = $('.arrow-main-menu-m');

    for(var i=0; i<arrowMainMenu.length; i++){
        $(arrowMainMenu[i]).on('click', function(){
            $(this).parent().find('.sub-menu-m').slideToggle();
            $(this).toggleClass('turn-arrow-main-menu-m');
        })
    }

    $(window).resize(function(){
        if($(window).width() >= 992){
            if($('.menu-mobile').css('display') == 'block') {
                $('.menu-mobile').css('display','none');
                $('.btn-show-menu-mobile').toggleClass('is-active');
            }

            $('.sub-menu-m').each(function(){
                if($(this).css('display') == 'block') { console.log('hello');
                    $(this).css('display','none');
                    $(arrowMainMenu).removeClass('turn-arrow-main-menu-m');
                }
            });
                
        }
    });


    $('.mobile-search-box').on('click', function(){
        $(this).toggleClass('is-active');
        $('.mobile-search-slide').slideToggle();
    });



   
    
    /*table tr hover*/

    $('.js-show-grid').on('click', function(){
        $('.js-show-grid').addClass('actived-2');
        $('.js-show-list').removeClass('actived-2');
        $('.js-list').fadeOut();
        $('.js-grid').fadeIn();
    });

    $('.js-show-list').on('click', function(){
        $('.js-show-list').addClass('actived-2');
        $('.js-show-grid').removeClass('actived-2');
        $('.js-grid').fadeOut();
        $('.js-list').fadeIn();
    });
    
    $(".table-hovered tbody tr").mouseover(function(){
        $(this).addClass("t-hover");
        });
        $("tr").mouseout(function(){
        $(this).removeClass("t-hover");
    });

     /*slideDown*/
     $(".lnb_wrap").stop().slideUp();
     $(".gnb ul li").mouseenter(function(){
         
        $(".lnb_wrap").stop().slideDown();
     });
     $(".lnb_wrap").mouseleave(function(){
         $(".lnb_wrap").stop().slideUp();
     });


     /*faq*/
     $(".faq-box dd:not(:first)").css("display","none");
     $(".faq-box dl dt").click(function(){
         if($(this).next().css("display")=="none"){$("dd").slideUp("slow");
        $("+dd",this).slideDown("slow");
        };
     });

     
      /*index 탭*/
     $(".tab_content").hide();
     $(".tab_content:first").show();

     $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#fff");
        $(this).addClass("active").css("color", "#fff");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });


     /*조직도 탭1*/
    $(".tab_content").hide();
     $(".tab_content:first").show();

     $("ul.resume-tabs li").click(function () {
        $("ul.resume-tabs li").removeClass("active");
        $(this).addClass("active");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });

    /*조직도 탭2*/
    $(".tab_content2").hide();
     $(".tab_content2:first").show();

     $("ul.resume-tabs2 li").click(function () {
        $("ul.resume-tabs2 li").removeClass("active");
        $(this).addClass("active");
        $(".tab_content2").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });

       
     



})(jQuery);