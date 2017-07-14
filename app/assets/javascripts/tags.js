$(document).ready(function(){
  checkFollowTag();
  checkFollowProduct();
})

function checkFollowTag() {
  $('.tag-item').click(function(e){
    var id = $(this).data('id');
    $.ajax({
      url: '/follow-on-tag',
      dataType:'json',
      method: 'post',
      data: {id: id}
    }).done(function(data){
      if (data['add']) {
        $('.tag-item[data-id="'+String(id)+'"]').addClass('in');
      }
      else {
        $('.tag-item[data-id="'+String(id)+'"]').removeClass('in');
      }
    })
  })
}

function checkFollowProduct() {
  $('.product-item .status').click(function(e){
    var id = $(this).data('id');
    $.ajax({
      url: '/follow-on-product',
      dataType:'json',
      method: 'post',
      data: {id: id}
    }).done(function(data){
      if (data['add']) {
        console.log(data['add'], '.tag-item[data-id='+String(id)+']')
        $('.product-item .status[data-id="'+String(id)+'"]').removeClass('in');
        $('.product-item .status[data-id="'+String(id)+'"]').addClass('added');
      }
      else {
        $('.product-item .status[data-id="'+String(id)+'"]').removeClass('added');
        $('.product-item .status[data-id="'+String(id)+'"]').addClass('in');
      }
    })
  })
}
