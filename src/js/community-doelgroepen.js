
ZK.addCornersToHeaderImage = function() {
    var headerimgs = jQuery('.lia-quilt-category-page-doelgroepen2017 .doelgroep-heading .doelgroep-heading-visual');

    headerimgs.each(function(){
        svgCorner = ZK.svgCorner().cloneNode(true);
        jQuery(this).append(svgCorner);
    });
};

ZK.displayBlogImages = function() {
    var teasers = jQuery('.hidden.blog-teaser');

    teasers.each(function() {
        var spans = jQuery(this).find('p > span');
        spans.each(function(index) {
            if (index === 1) {
                var jThis = jQuery(this);
                var img = new Image;
                img.src = jThis.find('img').attr('src');
                var wrapper = jThis.closest('.item-wrapper.clear-float').find('.blogitem-img-wrapper');
                wrapper.append(img);
                svgCorner = ZK.svgCorner().cloneNode(true);
                wrapper.append(svgCorner);
            }
        });
    });
};

ZK.showHeaderVideo = function() {
    var headervideo = jQuery('.lia-quilt-category-page-doelgroepen2017 .CustomContent .video-container');
    var headerimage = jQuery('.lia-quilt-category-page-doelgroepen2017 .doelgroep-heading .doelgroep-heading-visual img');
    if (headervideo.length && headerimage.length) {
        headerimage.replaceWith(headervideo);
    }
};