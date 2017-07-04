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
};

ZK.constructReplyButton = function($) {
    if (jQuery('.ForumTopicPage .lia-paging-pager .lia-paging-page-previous a.lia-link-navigation').length > 0) {
        var rsslink = jQuery('link[type="application/rss+xml"]');
        var topicclosed = jQuery('.outdated-topic-notification').length > 0;
        if (rsslink.length && !topicclosed) {
            var linkurl = rsslink.attr('href'),
                startindexboard = linkurl.indexOf('board.id=') + 9,
                nextamp1 = linkurl.indexOf('&', startindexboard),
                endindexboard = nextamp1 > 0 ? nextamp1 : null,
                startindexmessage = linkurl.indexOf('message.id=') + 11,
                nextamp2 = linkurl.indexOf('&', startindexmessage),
                endindexmessage = nextamp2 > 0 ? nextamp2 : null,
                boardid = endindexboard ?  linkurl.substring(startindexboard, endindexboard) : linkurl.substring(startindexboard),
                messageid = endindexmessage ?  linkurl.substring(startindexmessage, endindexmessage) : linkurl.substring(startindexmessage),
                btn = document.createElement('A');

            btn.href = '/t5/forums/replypage/board-id/'+ boardid +'/message-id/'+ messageid;
            btn.classList.add('lia-button');
            btn.classList.add('lia-button-secondary');
            btn.classList.add('reply-action-link');
            btn.classList.add('lia-action-reply');
            btn.innerHTML = 'Reageren'
            jQuery('.lia-component-reply-list').append(btn);
        }
    }
};

ZK.removeBreadCrumbBoardLink = function($) {
    var breadcrumbboardlink = jQuery('.BreadCrumb ul li.crumb a.lia-breadcrumb-board'),
        breadcrumbcategorylink = jQuery('.BreadCrumb ul li.crumb a.lia-breadcrumb-category');
    if (breadcrumbboardlink.length && breadcrumbcategorylink.length
        && breadcrumbboardlink.text() === breadcrumbcategorylink.text()) {
        breadcrumbboardlink.closest('li.crumb').remove();
    }
};