// ZK.adaptCommentLinks = function($) {
//
//     var targets = jQuery("[id^='commentsLink']");
//     var currentTarget,
//         tempStr;
//
//     jQuery.each(targets,function( index, value ) {
//
//         currentTarget = $(targets[index]);
//         tempStr = currentTarget.html();
//         if(tempStr.length>0){
//             tempStr = tempStr.split("(");
//             currentTarget.html(tempStr[0]);
//         }
//     });
// };

ZK.moveLabelBox = function($) {
    var labelBox = jQuery('.IdeaExchangePage .lia-content .lia-message-view-idea-message-item .LabelsForArticle');
    if (labelBox.length) {
        labelBox.each(function() {
            var jThis = jQuery(this);
            var messageByLine = jThis.closest('.lia-quilt-row.lia-quilt-row-row').find('.lia-message-byline.lia-message-byline-author-date.lia-component-byline-author-date');
            if (messageByLine.length) {
                jThis.appendTo(messageByLine);
            }
        });
    }

};

ZK.moveStatus = function($) {
    var status = jQuery('.IdeaExchangePage .MessageStatus');
    if (status.length) {
        status.each(function() {
            var jThis = jQuery(this);
            var subject = jThis.closest('.lia-quilt-column-alley').find('.lia-message-subject');
            if (subject.length) {
                jThis.insertBefore(subject);
            }
        });
    }
};

ZK.moveKudoButtons = function($) {
    var kudos = jQuery('.IdeaExchangePage .lia-message-view-idea-message-item .KudosButton');
    if (kudos.length) {
        kudos.each(function() {
            var jThis = jQuery(this);
            var body = jThis.siblings('.lia-message-body-wrapper ');
            if (body.length) {
                jThis.insertAfter(body);
            }
        });
    }
};

ZK.moveCommentAction = function($) {
    var commentaction = jQuery('.IdeaExchangePage .lia-message-view-idea-message-item .lia-message-comment-action');
    if (commentaction.length) {
        commentaction.each(function() {
            var jThis = jQuery(this);
            var kudos = jThis.siblings('.KudosButton');
            if (kudos.length) {
                jThis.insertBefore(kudos);
            }
        });
    }
};

ZK.prepareFilters = function($) {
    var filters = jQuery('.IdeaExchangePage .ideas-filtering.filter-section > div');
    if (filters.length) {
        filters.each(function() {
            var jThis = jQuery(this);
            var optionlist = jThis.find('ul.lia-list-standard');
            var label = jThis.find('span.lia-panel-heading-bar-title').html();
            if (label.length && optionlist.length) {
                var defaultitem = document.createElement('LI');
                if (optionlist.parent().hasClass('MessageStatusesTaplet')) {
                    defaultitem.classList.add('message-status');
                    defaultitem.classList.add('lia-status');

                } else {
                    defaultitem.classList.add('label');
                    defaultitem.classList.add('odd-row');
                }
                defaultitem.classList.add('default-option');
                defaultitem.innerHTML = label;
                optionlist.prepend(defaultitem);
                if (jThis.next().length === 0) {
                    jThis.insertBefore(jThis.prev());
                };
            }
        });
        console.log(filters.parent('.ideas-filtering.filter-section').length);
        filters.parent('.ideas-filtering.filter-section').append('<div class="filters-label">Filter op: </div>')
    }
};

ZK.getAvatarsByApiCall = function($) {
    var avatarwrappers = jQuery('div.author-avatar.author-avatarbyapicall-wrapper[data-userlogin][data-userid]');
    if (avatarwrappers.length) {
        avatarwrappers.each(function() {
            var jThis = jQuery(this);
            var userlogin = jThis.data('userlogin');
            var userid = jThis.data('userid');
            jQuery.ajax({
                url: "/restapi/vc/users/login/" + userlogin + "/profiles/avatar/size/profile",
                cache: true,
                dataType: "xml"
            }).done(function(data) {
                jQuery(data).find('url').each(function() {
                    var profilelink = document.createElement('A')
                    profilelink.href = '/t5/user/viewprofilepage/user-id/' + userid;
                    profilelink.classList.add('lia-user-profile');

                    var image = document.createElement('IMG');
                    image.src = jQuery(this).text();
                    image.classList.add('lia-user-avatar');

                    profilelink.prepend(image);
                    jThis.prepend(profilelink);
                });
            });
        });
    }
}