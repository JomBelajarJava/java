require(['gitbook'], function(gitbook) {
    gitbook.events.on('page.change', function() {
        ga('set', 'location', window.location.href);
        ga('send', 'pageview');
    });
});
