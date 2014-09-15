$(function() {
  var $b = $('body.home');
  
  var slides = $b.find('#main-features-slides > li');
  var currentSlide = slides.first();
  var timer = null;
  var manualControl = false;
  
  function goToSlide(slide, animate) {
    if (animate) {
      slide.css({position: 'absolute', 'z-index': 1, opacity: 0, top: 0, left: 0}).show();
      slide.animate({opacity: 1}, {duration: 200, complete: function() {
        slides.not(slide).hide();
        slide.css({position: 'static', 'z-index': 'auto', opacity: 'initial', top: 'auto', left: 'auto'});
      }});
    } else {
      slides.hide();
      slide.show();
    }
    $('#main-features > ul > li').removeClass('current')
    $('#main-features > ul > li[data-target="#' + slide.attr('id') + '"]').addClass('current');
  }
  
  function startSlideshowTimer() {
    timer = setTimeout(function() {
      if (currentSlide.is(':last-child')) {
        currentSlide = slides.first();
      } else {
        currentSlide = currentSlide.next();
      }
      goToSlide(currentSlide, true);
      if (!manualControl) {
        startSlideshowTimer();
      }
    }, 5000);
  }
  
  startSlideshowTimer();
  
  $b.find('#main-features > ul > li').click(function() {
    manualControl = true;
    if (timer) {
      clearTimeout(timer);
    }
    goToSlide(
      $($(this).attr('data-target')),
      true
    );
  });
  
  goToSlide(currentSlide, false);
});