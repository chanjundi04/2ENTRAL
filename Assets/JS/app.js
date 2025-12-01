$(() => {
    $('[data-get]').click(function(e) {
        console.log('Clicked: ', $(this));
        e.stopPropagation();
        const url = $(this).data('get');
        if (url) window.location.href = url;
    });
})