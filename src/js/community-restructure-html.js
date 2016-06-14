//restructure some html elements for better layout
ZK.restructureHTML = function($) {    
    if($('.IdeaExchangePage').length || $('.IdeaPage').length) {
        $('.lia-message-idea .lia-message-heading').each(function(){
            $(this).find('.lia-message-subject').prependTo(this);
            $(this)[0].style.paddingTop = "0";
        });
    }
}