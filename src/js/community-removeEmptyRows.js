ZK.removeEmptyRows = function($) {
    
        $('.lia-quilt-column-alley-single.lia-mark-empty').parent().parent().remove();
    
        var emptyReplies = $('.ForumTopicPage .lia-component-reply-list .linear-message-list');
        if(!$(emptyReplies).children().length) {
            $(emptyReplies).parent().parent().parent().parent().remove();
        }
}