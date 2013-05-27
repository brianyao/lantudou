// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


RP = {
    setup: function() {
        // construct new DOM elements
        $('<label for="filter" class="explanation">' +
          'Restrict to movies suitable for children' +
          '</label>' +
          '<input type="checkbox" id="filter"/>'
         ).insertBefore('#movies').change(RP.filter_adult);
    },
    filter_adult: function () {
        // 'this' is element that received event (checkbox)
        if ($(this).is(':checked')) {
            $('#movies tr.adult').hide();
            //$('#movies tbody tr').each(RP.hide_if_adult_row);
        } else {
            $('#movies tbody tr').show();
        };
    },
    // hide_if_adult_row: function() {
    //     if (! /^G|PG$/i.test($(this).find('td:nth-child(2)').text())) {
    //         $(this).hide();
    //     }
    // }
}
$(RP.setup);       // when document ready, run setup code
