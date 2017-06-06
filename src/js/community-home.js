
ZK.addCornersToNavLink = function() {
    var links = jQuery('.CommunityPage .main-community-nav-2017 .main-nav-item .item-content');

    links.each(function(){
        svgCorner = ZK.svgCorner().cloneNode(true);
        jQuery(this).append(svgCorner);
    });
};

ZK.mainNavItemsSetClick = function() {
    var navitems = jQuery('.main-community-nav-2017 .main-nav-item.has-subnav a.nav-2017-link');
    navitems.each(function() {

        jQuery(this).closest('.nav-2017-link').toggle(function() {
                var jThis = jQuery(this);
                var subnavHeight = jThis.next('.main-community-subnav-2017').height();
                jQuery('.main-nav-item.open a.nav-2017-link').click();
                jQuery(this).closest('.main-nav-item').addClass('open').css('margin-bottom', (subnavHeight + 60) + 'px');
            },
            function() {
                jQuery(this).closest('.main-nav-item').removeClass('open').css('margin-bottom', '20px');
            }
        );
    });
};