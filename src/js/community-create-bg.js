ZK.createFullwidthBG = function($) {
    
    var row = $('.lia-quilt-row-main-one');    
    var rowHeight = row.outerHeight(true) + 80 + 'px';
    
    var bg = $('<div />', {
        'class': 'full-width-bg',
        'style': 'height: ' + rowHeight
    });

    $(row).prepend(bg);    
    
}