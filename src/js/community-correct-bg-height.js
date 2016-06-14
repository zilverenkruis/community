ZK.correctBGHeight = function($) {
    $('.full-width-bg').each(function(){
      var height = $(this).closest('.lia-quilt-row').outerHeight(true) + 80 + ($(this).css('margin-bottom').slice(0, -2) * -1); 
      $(this).css('height', height + 'px');
    }); 
}