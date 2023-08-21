// $(document).on('turbolinks:load', function() {
//   // 一旦hide()で隠してフェードインさせる
//   $('div').hide().fadeIn('slow');
// });
document.addEventListener('turbolinks:load', () => {
  const loadingAreaGrey = document.querySelector('#loading');

  window.addEventListener('load', () => {
    loadingAreaGrey.animate(
      {
        opacity: [1, 0],
        visibility: 'hidden',
      },
      {
        duration: 2000,
        delay: 1200,
        easing: 'ease',
        fill: 'forwards',
      }
    );
  });
});