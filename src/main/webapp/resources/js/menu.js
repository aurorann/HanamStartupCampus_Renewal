
Gnb = {

	seIndex : null,

	Load : function(i) {
		if( i != null) {
			$("#gnb .menu_list li").eq(i).children("a").children("img").attr("src", $("#gnb .menu_list li").eq(i).children("a").children("img").attr("src").replace(/_off/g, "_on"));
			$("#gnb .submenu").eq(i).slideDown(300);
		}
	},

    depth01: null,

    Init: function() {

        var lnbVal = $("#GnbCode").val();
        if(lnbVal != '' && lnbVal != null) {
            Gnb.depth01 = lnbVal.split(':')[0];
        }
        if(Gnb.depth01 != null) {

            $(".menu_list li img").attr("src", function() {
                var index = $(".menu_list li img").index(this);
                var src = null;
                if(index == Gnb.depth01) {
                    src = $(".menu_list li img").eq(index).attr("src").replace(/_off/g, "_on");
                }else{
                    src = $(".menu_list li img").eq(index).attr("src").replace(/_on/g, "_off");
                }
                return src
            });

    
        }

    },

	CreateGnb: function() {

        Gnb.Init();

		$("#gnb .menu_list li").hover(function() {
			

			$("#gnb .menu_list li").each(function(index) {
				$(this).children("a").children("img").attr("src", $(this).children("a").children("img").attr("src").replace(/_on/g, "_off"));
			});

			$("#gnb .submenu").hide();

	
			var index = $("#gnb .menu_list li").index(this);
			$(this).children("a").children("img").attr("src", $(this).children("a").children("img").attr("src").replace(/_off/g, "_on"));
			$("#gnb .submenu").eq(index).slideDown(300);

		}, function() {
			

			var index = $("#gnb .menu_list li").index(this);
			if($("#gnb .submenu").eq(index).attr("display") == "none") {
				$(this).children("a").children("img").attr("src", $(this).children("a").children("img").attr("src").replace(/_on/g, "_off"));
			}
	
		});


		$("#gnb .submenu ul li").hover(function() {
			var index = $("#gnb .submenu ul li").index(this);
			$(this).children("a").children("img").attr("src", function() {
				return $(this).attr("src").replace(/_off/g, "_on");
			});
		}, function() {
			$(this).children("a").children("img").attr("src", function() {
				return $(this).attr("src").replace(/_on/g, "_off");
			});
		});



		$("#gnb").hover(function() {
		}, function() {
			$("#gnb .menu_list li").each(function(index) {
				$(this).children("a").children("img").attr("src", $(this).children("a").children("img").attr("src").replace(/_on/g, "_off"));
			});
			$("#gnb .submenu").hide();

            Gnb.Init();
		});

		
	}
}


jQuery(function(){

	$('.location_guide > ul > li > button').click(function(e){
		e.preventDefault();
		var $p_obj = $(this).parent();
		var $p_checked = $p_obj.hasClass('active');
		$('.location_guide > ul ul').stop().slideUp(250);
		$('.location_guide > ul > li').removeClass('active');
		$('.location_guide > ul > li > button').attr('title','메뉴 제목');

		if(!$p_checked){
			$(this).next().stop().slideDown(250);
			$p_obj.addClass('active');
			$p_obj.find('>button').attr('title','메뉴열기');
		}
    });
    
    $('.family_guide > ul > li > button').click(function(e){
		e.preventDefault();
		var $p_obj = $(this).parent();
		var $p_checked = $p_obj.hasClass('active');
		$('.family_guide > ul ul').stop().slideUp(250);
		$('.family_guide > ul > li').removeClass('active');
		$('.family_guide > ul > li > button').attr('title','패밀리사이트 바로가기');

		if(!$p_checked){
			$(this).next().stop().slideDown(250);
			$p_obj.addClass('active');
			$p_obj.find('>button').attr('title','패밀리사이트 메뉴열기');
		}
	});
});


