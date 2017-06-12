
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
        var spans = jQuery(this).find('span');
        spans.each(function(index) {
            if (index === 1 && this.style.width == '365px') {
                var jThis = jQuery(this);
                var img = new Image;
                img.src = jThis.find('img').attr('src');
                jThis.closest('.item-wrapper.clear-float').find('.blogitem-img-wrapper').append(img);
            }
        });
    });
};