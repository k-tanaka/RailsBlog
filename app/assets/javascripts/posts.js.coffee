$ ->
    $('textarea').autoResize({
        animateDuration : 300,
        extraSpace : 40
    });

    $('textarea').trigger('change');
