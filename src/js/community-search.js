ZK.moveSortSpan = function($) {
    var sortDivs = jQuery('.SearchPage .search-result-sorting');
    if (sortDivs.length) {
        sortDivs.each(function() {
            var jThis = jQuery(this);
            var filters = jThis.closest('.lia-quilt-message-search').find('.lia-quilt-search-page-thread-filters .lia-quilt-column-alley.lia-quilt-column-alley-single');
            var filterlabel = "<div class='search-result-filter-label'>Filter op: </div>";
            if (filters.length) {
                filters.prepend(jThis);
                if (filters.find('.search-result-filter-label').length === 0) {
                    filters.prepend(filterlabel);
                }
            }
        });
    }
}

ZK.refreshPageAfterFilterClick = function($) {
    jQuery("body").on('DOMSubtreeModified', '.lia-content .lia-ajax-loader-feedback', function(e) {
        setTimeout(function(){ZK.moveSortSpan($)}, 1000);
    });
}
