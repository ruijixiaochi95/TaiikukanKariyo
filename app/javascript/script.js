document.addEventListener('DOMContentLoaded', () => {
  const loadingAreaGrey = document.querySelector('#loading');
  const loadingText = document.querySelector('#loading p')

  window.addEventListener('load', () => {
    loadingAreaGrey.animate(
      {
        opacity: [1, 0],
        visibility: 'hidden',
      },
      {
        duration: 500,
        delay: 300,
        easing: 'ease',
        fill: 'forwards',
      }
    );
    
    loadingText.animate(
      {
        opacity: [1, 0],
      },
      {
        duration: 300,
        easing: 'ease',
        fill: 'forwards',
      }
    );
  });
});