
ZK.addCornersToHeaderImage = function() {
    var headerimgs = jQuery('.lia-quilt-category-page-doelgroepen2017 .doelgroep-heading .doelgroep-heading-visual');

    headerimgs.each(function(){
        svgCorner = ZK.svgCorner().cloneNode(true);
        jQuery(this).append(svgCorner);
    });
};