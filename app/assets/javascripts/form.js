function check(selector) {
  $(selector + ' label').addClass('up');
  if ($(selector + ' input').val().length > 0) {
    $(selector + ' label').addClass('up');
  }
  else {
    $(selector + ' label').removeClass('up');
  }
}
$(document).ready(function(){
  if ($('.form').length > 0) {
    check('.username');
    check('.firstname');
    check('.lastname');
    check('.email');
    check('.password');
  }
})
