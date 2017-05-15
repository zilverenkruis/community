ZK.moveSortSpan = function($) {
    var sortDivs = jQuery('.SearchPage .search-result-sorting');
    if (sortDivs.length) {
        sortDivs.each(function() {
            var jThis = jQuery(this);
            var filters = jThis.closest('.lia-quilt-message-search').find('.lia-quilt-search-page-thread-filters .lia-quilt-column-alley.lia-quilt-column-alley-single');
            var filterlabel = "<div class='search-result-filter-label'>Filter op: </div>";
            if (filters.length) {
                filters.prepend(jThis);
                filters.prepend(filterlabel);
            }
        });
    }
}
