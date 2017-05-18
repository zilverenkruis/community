LITHIUM.jQuery(function($) {

    $.each(['show', 'hide'], function (i, ev) {
        var el = $.fn[ev];
        $.fn[ev] = function () {
            this.trigger(ev);
            return el.apply(this, arguments);
        };
    });

    ZK.restructureHTML($);
    ZK.removeEmptyRows($);
    ZK.removeEmptyStatus($);
    ZK.svgCorner();
    // ZK.shortenMessage($,400);
    // ZK.filterDropdown($);
    // ZK.commentCount($);
    ZK.accordion($);
    // ZK.avatars($);
    ZK.avatars($);
    // ZK.correctBGHeight($);

    // ZK.createFullwidthBG($);
    ZK.scrollTo($);
    ZK.connectSocialButtons($);
    ZK.copyReactTo($)
    ZK.adaptCommentLinks($);
    ZK.moveStatus($);
    ZK.moveKudoButtons($);
    ZK.moveCommentAction($);
    ZK.moveLabelBox($);
    ZK.setMarkerClick($);
    ZK.loadSearchPage($);
    ZK.onHideLoaderFeedback($)

}(LITHIUM.jQuery));