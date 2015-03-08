// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.mobile
//= require jqm-spinbox
//= require growl
// require_tree .

$(function() {

  $(document).on('pageshow', 'div[data-role*="page"]', function () {
    (function () {
      // alert('pageshow');
      // var script = document.createElement('script');
      // script.type = 'text/javascript';
      // script.async = true;
      // script.src = '/path/to/new/include.js';
      // var s = document.getElementsByTagName('script')[0];
      // s.parentNode.insertBefore(script, s);
  })();
});

});
