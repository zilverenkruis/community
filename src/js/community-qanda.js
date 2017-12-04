
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
        ZK.avatars($);
    }, 2000);
}

ZK.doDOMProcessingOnNextPage = function($) {
    var target = document.querySelector('.lia-quilt-forum-qanda-topic-page > .lia-quilt-row.lia-quilt-row-main-one');

    if (target !== null) {
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