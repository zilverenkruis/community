
ZK.movePostPageButtons = function($) {
    var buttons = jQuery('.PostPage .lia-quilt-row.lia-quilt-row-standard.lia-form-buttons-empty-left-column');
    console.log(buttons);
    if (buttons.length) {
        buttons.each(function() {
            var jThis = jQuery(this);
            var targetcolumn = jThis.closest('.lia-quilt-column.lia-quilt-column-18.lia-quilt-column-left.lia-input-edit-form-column').next('.lia-quilt-column.lia-quilt-column-06.lia-quilt-column-right.lia-input-edit-form-column').find('.lia-quilt-column-alley-right');
            console.log(jThis.closest('.lia-quilt-column.lia-quilt-column-18.lia-quilt-column-left.lia-input-edit-form-column').next('.lia-quilt-column.lia-quilt-column-06.lia-quilt-column-right.lia-input-edit-form-column'));
            if (targetcolumn.length) {
                jThis.appendTo(targetcolumn);
            }
        });
    }
};