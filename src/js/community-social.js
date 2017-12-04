
ZK.connectSocialButtons = function($) {


    if (LITHIUM.jQuery('#message_social').length) {
        var socialMenu = LITHIUM.jQuery('.message_social_container');
        var socialButton = LITHIUM.jQuery(".btn",socialMenu);
        var target = LITHIUM.jQuery(".message_social_sharing",socialMenu);
        var socialLinks = LITHIUM.jQuery("a",target);

        target.hide().slideUp();

        socialButton.on("click",function(e){
            e.preventDefault();
            e.stopPropagation();
            target.slideToggle();
        });

        socialLinks.on("click",function(e){
            // e.preventDefault();
            e.stopPropagation();
            target.slideToggle();
        })
    }

};