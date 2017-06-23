jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});

$('#myModal').modal({
    show: 'false'
});

var http = require("http");
setInterval(function() {
    http.get("http://aurorawildlandteam.herokuapp.com");
}, 300000);
