
ZK.addCornersToNavLink = function() {
    var links = jQuery('.CommunityPage .main-community-nav-2017 .main-nav-item');

    links.each(function(){
        svgCorner = ZK.svgCorner().cloneNode(true);
        jQuery(this).append(svgCorner);
    });
};

