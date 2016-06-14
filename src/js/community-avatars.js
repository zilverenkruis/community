ZK.avatars = function($) {
    
    //for now only resize avatars when messagelist 
    if ($('.message-list, .CommentList, .lia-message-author-avatar').length) {
        $('.lia-user-avatar-message').each(function(){
            
            $(this).attr('src', $(this).attr('src')
                .replace(/\d\dx\d\d/g, '100x100')
                .replace(/avatar-display-size\/message/g, 'avatar-display-size/profile'));
                
                //prevent flickering
                var av = this;
                
                setTimeout(function(){
                    $(av).css('display', 'block');
                }, 500);            
        });
    }
    
    
    
    
    //add corner to avatars
    var avatars = $('.author-avatar, .item-img-wrapper a, .lia-message-view .UserAvatar');

    $(avatars).each(function(){
        svgCorner = ZK.svgCorner().cloneNode(true);
        // svgCorner = ZK.svgCorner("#D6EFF0").cloneNode(true);
        // svgCorner = ZK.svgCorner("#ddeaf5").cloneNode(true);

        $(this).append(svgCorner);
    });    
}