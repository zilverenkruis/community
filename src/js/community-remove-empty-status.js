ZK.removeEmptyStatus = function($) {

    if( $('.lia-message-subject-status').length){
        var items = $('.lia-message-subject-status');
        var item;

        for(var i=0; i<items.length;i++){
            item = items[i];
            if ($(item).text().trim().length == 0){
                $(item).hide();
            }
        }
    }
}