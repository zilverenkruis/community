
ZK.reorderFormElements = function($) {
    var buttons = jQuery('.PostPage .lia-quilt-row.lia-quilt-row-standard.lia-form-buttons-empty-left-column');
    if (buttons.length) {
        buttons.each(function() {
            var jThis = jQuery(this);
            var targetcolumn = jThis.closest('.lia-quilt-column.lia-quilt-column-18.lia-quilt-column-left.lia-input-edit-form-column').next('.lia-quilt-column.lia-quilt-column-06.lia-quilt-column-right.lia-input-edit-form-column').find('.lia-quilt-column-alley-right');
            if (targetcolumn.length) {
                jThis.appendTo(targetcolumn);
            }
        });
    }
    jQuery('.lia-form-labels-fieldset-toggle').before(jQuery('.lia-form-attachments-fieldset-toggle'));
};

ZK.setCheckBoxesForLabels = function($) {
    var labels = jQuery('.PostPage .lia-form-labels-fieldset-toggle .predefined-labels ul li, .EditPage .lia-form-labels-fieldset-toggle .predefined-labels ul li');
    var labelinput = jQuery('input#lia-labels');
    var labelinputvalue = labelinput.val();
    labels.each(function() {
        var jThis = jQuery(this);
        var checkbox = document.createElement('input');
        var labellink = jThis.find('a.lia-js-predefined-label');
        var labelname = labellink.attr('name').trim();
        checkbox.type = 'checkbox';
        checkbox.name = 'labelcheckbox';
        checkbox.value = labelname;
        if (labelinputvalue.indexOf(labelname) > -1) {
            checkbox.checked = true;
        }
        jThis.prepend(checkbox);
        jQuery(checkbox).on('click', jQuery.proxy(function() {
            labellink.click();
            if (checkbox.checked) {
                checkbox.checked = false;
            } else {
                checkbox.checked = true;
            }
        }));
        labellink.click(function() {
            if (checkbox.checked) {
                checkbox.checked = false;
            } else {
                checkbox.checked = true;
            }
        });
    });
    if (!jQuery('.main-community-nav').hasClass('isAdmin')) {
        jQuery('#lia-labels').css('height', '1px').css('padding', '0').css('visibility', 'collapse');
    }
};

ZK.styleFileInput = function($) {
    var inputwrapper = jQuery('.MultipleAttachments .lia-new-attachments-field');
    inputwrapper.each(function() {
        var jThis = jQuery(this);
        jThis.addClass('btn btn-normal btn-large');
        var infospan = document.createElement('SPAN');
        infospan.classList.add('infospan');
        infospan.textContent = 'Geen bestand geselecteerd';
        jQuery(infospan).insertAfter(jThis);
        inputwrapper.find('input.lia-form-type-file').each( function() {
            var jThis	 = jQuery(this);
            var infospan = jThis.parent('.lia-new-attachments-field').next('span.infospan');
            jThis.on( 'change', function( e ) {
                var fileName = '';
                if ( this.files && this.files.length > 1 ) {
                    fileName = ( this.getAttribute('data-multiple-caption') || '' ).replace('{count}', this.files.length);
                } else if( e.target.value ) {
                    fileName = e.target.value.split('\\').pop();
                }
                if( fileName ) {
                    infospan.html(fileName);
                }
            });
            jThis.on( 'focus', function(){ jThis.addClass( 'has-focus' ); }).on( 'blur', function(){ jThis.removeClass( 'has-focus' ); });
        });
    });
};