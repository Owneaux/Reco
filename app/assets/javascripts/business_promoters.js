$(function() {
  alert('loading business_promoters');
  $('.btn-delete-promoter').click(function(event) {
    var button = event.target;
    var button_class = $(this).attr("class");
    if (typeof button_class != undefined && button_class != null) {
      if (button_class.indexOf('ui-icon-delete') > 0) {
        $(this).removeClass('ui-icon-delete').addClass('ui-icon-check');
        display_images(true)
      } else {
        $(this).removeClass('ui-icon-check').addClass('ui-icon-delete');
        display_images(false)
      }
    }
  });

  function init_click_handler() {
    var img_elem_list = $('.ui-li-has-thumb img');
    var i = 0;
    for (i; i < img_elem_list.length; i++) {
      var img = img_elem_list[i];
      $(img).click(function(event) {
        var id = event.target.id;
        var path = '/business_promoters/' + id
        $.ajax({
          type: 'POST',
          url: path,
          data: { "_method": "delete" },
          async: false,
          success: function (data, status) {
            if (status === 'success') {
              var img = event.target;
              var elemtToRemove = img.closest('.ui-li-has-thumb');
              elemtToRemove.remove();
            }
          },
          error: function (err, data) {
            alert("Error " + err.responseText);
          }
        });
      });
    }
  }

  function display_images(visible) {
    var img_elem_list = $('.ui-li-has-thumb img');
    var btn_elem_list = $('.ui-li-has-thumb .ui-btn');
    var i = 0;
    for (i; i < img_elem_list.length; i++) {
      var img = img_elem_list[i];
      var btn = btn_elem_list[i];
      if (visible) {
        $(img).show();
        $(btn).css("padding-left", "45px");
      } else {
        $(img).hide();
        $(btn).css("padding-left", "15px");
      }
    }
  }

  display_images(false);
  init_click_handler();
});
