//needs svgcorner
ZK.avatars = function($) {

    //hide avatars and change size
    var avatars = $('.lia-panel-message-root .lia-message-author-avatar');
    var messRootPadding = parseInt($('#messageview .lia-panel-message-root').css('padding-top').slice(0, -2));


    function positionLikes(messAvatar, messageRoot, topPos) {
        $(messageRoot)
            .find('.lia-component-kudos')
            .css({
                'top': topPos + 'px',
                //,'visibility' : 'visible'
                'visibility': 'visible'
            })
            // .fadeTo( "slow" , 1.0, function() {
            // // Animation complete.
            // });  
            //$(this).attr('src'));
    };

    $(avatars).each(function(){
        var messAvatar = this;
        // console.log('hide this: ', messAvatar);
        $(this).css({
                'visibility': 'hidden'
        });
        var messageRoot  = $(messAvatar).closest('.lia-panel-message-root');

        //console.log($(this).find('.lia-user-avatar-message'));
        var img = $(this).find('.lia-user-avatar-message');

        $(img).attr('src', $(img).attr('src').replace(/\d\dx\d\d/g, '115x115')); 

        var topPos = $(messAvatar).outerHeight() + messRootPadding;

        positionLikes(messAvatar, messageRoot, topPos);        
    });


    $(avatars).each(function(){
        svgCorner = ZK.svgCorner().cloneNode(true);

        $(this).children('.lia-component-common-widget-user-avatar')[0].appendChild(svgCorner);
    });


    //make avatars visible
    $(avatars).each(function() {
        $(this)
            .css('visibility', 'visible')
            .fadeTo( "slow" , 1.0, function() {
            
            });           
    });
            
};