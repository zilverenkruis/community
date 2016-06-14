ZK.scrollTo = function($) {
    "use strict";
    
    $("a[data-scrollto]").on("click", function(e){
        e.preventDefault();
        var target = $('#ideasection');
        var targetName = $(this).data("scrollto");
        target = $(targetName);
        //target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
            $('html, body').animate({
            scrollTop: target.offset().top
            }, 1000);
            return false;
        }          
    });
        
};