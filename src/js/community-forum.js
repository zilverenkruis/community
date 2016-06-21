ZK.copyReactTo = function($) {

    var isPage = $(".lia-component-reply-list");
    var reactToButton = $($(".ForumTopicPage .lia-component-reply-button .reply-action-link")[0]);

    // if there are answers already, to copy button under
    if(isPage.length>0){
        reactToButton.clone().appendTo(isPage);
    }

}