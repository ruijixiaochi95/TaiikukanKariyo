$(document).on('turbolinks:load', function() {
  // 一旦hide()で隠してフェードインさせる
  $('div').hide().fadeIn('slow');
});