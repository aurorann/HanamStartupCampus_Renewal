/**
 * 
 * 
 * AUTHOR : Kim Kee Seop (Apeak co.)
 * 
 * 
 */

/*(function ($) {
    "use strict";
    jQuery(document).ready(function() {
        slideDown
        $(".lnb_wrap").stop().slideUp();
        $(".gnb ul li").mouseenter(function(){
            
        $(".lnb_wrap").stop().slideDown();
        });
        $(".lnb_wrap").mouseleave(function(){
            $(".lnb_wrap").stop().slideUp();
        });
        
        function openModal(modalname){
            document.get
            $("#r-modal").fadeIn(300);
            $("."+modalname).fadeIn(300);
        }

        $("#r-modal, .close").on('click',function(){
            $("#r-modal").fadeOut(300);
            $(".modal-con").fadeOut(300);
        });
    });

})(jQuery);*/

// https://github.com/uxitten/polyfill/blob/master/string.polyfill.js
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart
if (!String.prototype.padStart) {
    String.prototype.padStart = function padStart(targetLength,padString) {
        targetLength = targetLength>>0; //truncate if number or convert non-number to 0;
        padString = String((typeof padString !== 'undefined' ? padString : ' '));
        if (this.length > targetLength) {
            return String(this);
        }
        else {
            targetLength = targetLength-this.length;
            if (targetLength > padString.length) {
                padString += padString.repeat(targetLength/padString.length); //append to original to ensure we are longer than needed
            }
            return padString.slice(0,targetLength) + String(this);
        }
    };
}

if (!String.prototype.endsWith) {
  String.prototype.endsWith = function(searchString, position) {
      var subjectString = this.toString();
      if (typeof position !== 'number' || !isFinite(position) || Math.floor(position) !== position || position > subjectString.length) {
        position = subjectString.length;
      }
      position -= searchString.length;
      var lastIndex = subjectString.indexOf(searchString, position);
      return lastIndex !== -1 && lastIndex === position;
  };
}

function sessionLogout() {
	$("form#logout").submit();
}

function goToTotalSearchView(formEl) {
	if(formEl.keyword.trim() === "") {
		alert("검색어를 입력해주세요.");
		return false;
	} else {
		return true;
	}
}

$(function() {
	$(".board-table .board-contents img").on("click", function() {
		window.open(this.src);
	});
})