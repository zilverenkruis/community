LITHIUM.jQuery(function($) {

    $.each(['show', 'hide'], function (i, ev) {
        var el = $.fn[ev];
        $.fn[ev] = function () {
            this.trigger(ev);
            return el.apply(this, arguments);
        };
    });

    ZK.restructureHTML($);
    ZK.removeEmptyParagraphs($);
    ZK.removeEmptyRows($);
    ZK.removeEmptyStatus($);
    ZK.moveBlogOptionMenu($);
    // ZK.shortenMessage($,400);
    ZK.displayDotsOnOverflow($);
    // ZK.filterDropdown($);
    // ZK.commentCount($);
    ZK.accordion($);
    // ZK.avatars($);
    ZK.avatars($);
    // ZK.correctBGHeight($);

    // ZK.createFullwidthBG($);
    ZK.scrollTo($);
    ZK.connectSocialButtons($);
    ZK.copyReactTo($);
    ZK.constructReplyButton($);
    ZK.removeBreadCrumbBoardLink($);
    //ZK.adaptCommentLinks($);
    ZK.moveStatus($);
    ZK.moveKudoButtons($);
    ZK.moveCommentAction($);
    ZK.reorderFormElements($);
    ZK.setCheckBoxesForLabels($);
    ZK.styleFileInput($);
    ZK.prepareFilters($);
    ZK.getAvatarsByApiCall($);
    ZK.removeCommentForm($);
    ZK.moveLabelBox($);
    ZK.setMarkerClick($);
    ZK.loadSearchPage($);
    ZK.onHideLoaderFeedback($);
    ZK.addCornersToNavLink($);
    ZK.addCornersToHeaderImage($);
    ZK.displayBlogImages($);
    ZK.showHeaderVideo($);
    ZK.mainNavItemsSetClick($);
    ZK.svgCorner();

}(LITHIUM.jQuery));