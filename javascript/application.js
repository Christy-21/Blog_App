import 'foundation-sites'

// initialize the page
$(document).on('turbo:render', function() {
    onPageLoad();
});
$(document).ready(function () {
    onPageLoad();
});
function onPageLoad() {
    // init foundation
    $(document).foundation();
}
