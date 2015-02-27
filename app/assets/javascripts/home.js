$(function() {
  $("#btn-signup").on('click', function(event) {
    var selectedvalue = getSelectedElement();
    if (selectedvalue !== "") {
      if (selectedvalue === "business") {
      var path = "/business_users/sign_up"
      } else {
        var path = "/users/sign_up"
      }
      window.location.href = path;
    }
  });

  $("#btn-login").on('click', function(event) {
    var selectedvalue = getSelectedElement();
    if (selectedvalue !== "") {
      if (selectedvalue === "business") {
      var path = "/business_users/sign_in"
      } else {
        var path = "/users/sign_in"
      }
      window.location.href = path;
    }
  });

  function getSelectedElement() {
    var selectedElement = $("#role :radio:checked");
    var value = "";
    if (selectedElement) {
      value = selectedElement.val();
    } else {
      // TODO error
    }
    return value;
  }
});