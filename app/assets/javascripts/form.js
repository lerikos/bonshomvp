function check(selector) {
  $(selector + ' label').addClass('up');
  if ($(selector + ' input').val().length > 0) {
    $(selector + ' label').addClass('up');
    $(selector + ' input').removeClass('failed');
    $(selector + ' .error-msg').empty();
  }
  else {
    $(selector + ' label').removeClass('up');
  }
}

function checkTextArea(selector) {
  $(selector + ' label').addClass('up');
  if ($(selector + ' textarea').val().length > 0) {
    $(selector + ' label').addClass('up');
    $(selector + ' textarea').removeClass('failed');
    $(selector + ' .error-msg').empty();
  }
  else {
    $(selector + ' label').removeClass('up');
  }
}

$(document).ready(function(){
  pageReady();
})

function pageReady () {
  if ($('.form').length > 0) {
    if ($('.username').length > 0) { check('.username'); }
    if ($('.firstname').length > 0) { check('.firstname'); }
    if ($('.lastname').length > 0) { check('.lastname'); }
    if ($('.email').length > 0) { check('.email'); }
    if ($('.password').length > 0) { check('.password'); }
  }

  if ($('.alert-actions').length > 0) {
    if ($('.title').length > 0) { check('.title'); }
    if ($('.issue').length > 0) { checkTextArea('.issue'); }
    if ($('.action').length > 0) { checkTextArea('.action'); }
    if ($('.source').length > 0) { check('.source'); }
  }

  if ($('.product-actions').length > 0) {
    if ($('.name').length > 0) { check('.name'); }
    if ($('.description').length > 0) { checkTextArea('.description'); }
  }

  $('.add-new-tag').click(function(){
    $('.tag-creator').removeClass('out');
  })

  $('.tag-creator .tag-name').keyup(function(){
    if ($('.tag-creator .tag-name').val().length > 0) {
      $('.tag-creator .form-submit').removeAttr('disabled')
    }
    else {
      $('.tag-creator .form-submit').attr('disabled', 'disabled')
    }
  })

  $('.tag-editor .tag-name').keyup(function(){
    if ($('.tag-editor .tag-name').val().length > 0) {
      $('.tag-editor .form-submit').removeAttr('disabled')
    }
    else {
      $('.tag-editor .form-submit').attr('disabled', 'disabled')
    }
  })
}
