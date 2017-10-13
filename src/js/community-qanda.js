
ZK.reorderQandACommentBodyWrapperAndAuthorRankDate = function($) {
    var bodywrappers = jQuery('.lia-product-comment-body-wrapper');
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
