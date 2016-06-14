ZK.filterDropdown = function($) {
    //idea filters
    $('.lia-component-ideas-widget-statuses, .lia-component-ideas-widget-labels').on('click', function(){
        var that = this;
        $(this)
            .toggleClass('open')
            .find('.lia-panel-content-wrapper').toggleClass('open');
        
    }).on('mouseleave',  function() {
        $(this)
            .removeClass('open')
            .find('.lia-panel-content-wrapper').removeClass('open');                
    });    
}


