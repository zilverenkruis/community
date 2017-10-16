
ZK.reorderQandACommentBodyWrapperAndAuthorRankDate = function($) {
    var bodywrappers = jQuery('.lia-quilt-forum-qanda-topic-page .lia-product-comment-body-wrapper');
    if (bodywrappers.length) {
        bodywrappers.each(function() {
            var jThis = jQuery(this);
            var nextel = jThis.next();
            if (nextel.hasClass('lia-product-question-author-rank-date')) {
                jThis.before(nextel);
                jThis.find('.lia-menu-navigation-wrapper').css({
                    top: '-80px',
                    right: '-10px'
                });
            }
        });
    }
};

ZK.hideQuestionOnFollowUpPages = function($) {
    var prevlink = jQuery('.lia-quilt-forum-qanda-topic-page a.lia-link-navigation[rel="prev"]');
    if (prevlink.length) {
        var question = jQuery('.ForumQandATopicMessageList > .lia-panel-message');
        if (question.length) {
            question.hide();
        }
    }
}

ZK.runTimedoutAfterMutation = function($) {
    setTimeout(function() {
        ZK.hideQuestionOnFollowUpPages($);
        ZK.reorderQandACommentBodyWrapperAndAuthorRankDate($);
        ZK.avatars($);
    }, 2000);
}

ZK.doDOMProcessingOnNextPage = function($) {
    var target = document.querySelector('.lia-quilt-forum-qanda-topic-page > .lia-quilt-row.lia-quilt-row-main-one');

    if (typeof target !== 'undefined') {
        var observer = new MutationObserver(function(mutations) {
            for (var i=0; i<mutations.length; i++) {
                if (mutations[i].type === 'attributes') {
                    ZK.runTimedoutAfterMutation($);
                    break;
                }
            }
        });

        var config = { attributes: true, childList: true, characterData: true, subtree: true }

        observer.observe(target, config);
    }
}