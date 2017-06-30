ZK.copyReactTo = function($) {
    var topicclosed = jQuery('.outdated-topic-notification').length > 0;
    var isPage = jQuery(".lia-component-reply-list");
    var reactToButton = jQuery(".ForumTopicPage .lia-component-topic-message .lia-quilt-row-footer .reply-action-link");
    var reactToButtons = jQuery(".ForumTopicPage .reply-action-link");
    if(!topicclosed && isPage.length && reactToButton.length){
        reactToButton.clone().appendTo(isPage);
    } else if (topicclosed && reactToButtons.length) {
        reactToButtons.remove();
    }
}