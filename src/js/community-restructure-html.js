//restructure some html elements for better layout
ZK.restructureHTML = function($) {    
    if($('.IdeaExchangePage').length || $('.IdeaPage').length) {
        $('.lia-message-idea .lia-message-heading').each(function(){
            $(this).find('.lia-message-subject').prependTo(this);
            $(this)[0].style.paddingTop = "0";
        });
    }
}

ZK.removeEmptyParagraphs = function($) {
    var paragraphs = jQuery('p');
    paragraphs.each(function() {
        var jThis = jQuery(this);
        if (jThis.html() == '&nbsp;') {
            jThis.remove();
        }
    });
}

ZK.moveBlogOptionMenu = function($) {
    var optionmenu = jQuery('.BlogArticlePage .lia-message-view-blog-topic-message .lia-quilt-row-header');
    optionmenu.each(function() {
        var jThis = jQuery(this);
        var header = jThis.closest('.lia-quilt-blog-article-page').find('.lia-quilt-row-header .lia-blog-article-page-article-subject');
        header.each(function() {
            header.append(jThis);
        });
    });
}