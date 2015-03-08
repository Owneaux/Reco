$(function(){

  function init_widgets() {
    var img_minus_elem_list = $('.ui-li-static .img-minus img');
    var img_plus_elem_list = $('.ui-li-static .img-plus img');
    var img_check_elem_list = $('.ui-li-static .img-check img');
    var i = 0;
    for (i; i < img_minus_elem_list.length; i++) {
      var img = img_minus_elem_list[i];
      $(img).click(function(event) {
        var item_list = $(this).closest('.ui-li-static');
        modify_count_value(item_list, false);
      });
    }
    i = 0;
    for (i; i < img_plus_elem_list.length; i++) {
      var img = img_plus_elem_list[i];
      $(img).click(function(event) {
        var item_list = $(this).closest('.ui-li-static');
        modify_count_value(item_list, true);
      });
    }
    i = 0;
    for (i; i < img_check_elem_list.length; i++) {
      var img = img_check_elem_list[i];
      $(img).click(function(event) {
        var item_list = $(this).closest('.ui-li-static');
        var count_val = get_value_count(item_list);
        var promoter_id = get_promoter_id($(this));
        var path = '/home/checkout/'
        $.ajax({
          type: 'POST',
          url: path,
          data: { promoter: promoter_id, referrals: count_val},
          async: false,
          success: function (data, status) {
            if (status === 'success') {
              set_value_count(item_list, 0);
              val_referrals = get_value_referrals(item_list) + count_val;
              set_value_referrals(item_list, val_referrals);
            }
          },
          error: function (err, data) {
            alert("Error " + err.responseText);
          }
        });
      });
    }
  }

  function get_promoter_id(img) {
    var item_list = $(img).closest('.ui-li-static');
    var promoter_input = $(item_list).find('#promoter_id');
    return $(promoter_input).val();
  }

  function set_value_count(item_list, value) {
    var count_p_element = get_count_p_element(item_list);
    $(count_p_element).text(value);
  }

  function set_value_referrals(item_list, value) {
    var referrals_p_element = get_referrals_p_element(item_list);
    $(referrals_p_element).text(value);
  }

  function get_value_count(item_list) {
    var count_p_element = get_count_p_element(item_list);
    return parseInt($(count_p_element).text());
  }

  function get_value_referrals(item_list) {
    var referrals_p_element = get_referrals_p_element(item_list);
    return parseInt($(referrals_p_element).text());
  }

  function get_count_p_element(item_list) {
    return $(item_list).find('.count-widget p');
  }

  function get_referrals_p_element(item_list) {
    return $(item_list).find('.resume-widget p');
  }

  function modify_count_value(item_list, increment) {
    var count_value = get_value_count(item_list);
    if (increment) {
      count_value = count_value + 1;
    } else {
      if (count_value > 0) {
        count_value = count_value - 1;
      }
    }
    set_value_count(item_list, count_value);
  }

  // function modify_count_value(img, increment) {
  //   var count_value = get_value_count(img);
  //   if (increment) {
  //     count_value = count_value + 1;
  //   } else {
  //     if (count_value > 0) {
  //       count_value = count_value - 1;
  //     }
  //   }
  //   set_value_count(img, count_value);
  // }
  init_widgets();

});