////////////////////////////////////////////////////////////////////////////////////////////////////
// Slider is a basic rotator that handles play, stop, paging, next, back
// it can support any contnent: images, links, embeds, iframes, text, anything you put in a.slide
////////////////////////////////////////////////////////////////////////////////////////////////////
// Example: ////////////////////////////////////////////////////////////////////////////////////////
//
// <div id="slider">
//   <div class="slide">
//     <a href="#"><img /></a>
//   </div>
//   <div class="slide">
//     <object />
//   </div>
//   <div class="slide">
//     <img />
//   </div>
//   <div class="slide">
//     <p>text</p>
//   </div>
// </div>
//
// <script type="text/javascript" src="jquery.slider.js"></script>
// <script type="text/javascript" charset="utf-8">
//   jQuery("#slider").slider()
// </script>
//
////////////////////////////////////////////////////////////////////////////////////////////////////

(function(jQuery) {
  
  var settings, container, timeout // scope these as shared
  
  jQuery.fn.slider = function(options) {
      return this.each(function() {   
          jQuery.slider(jQuery(this), options);
      });
  };
  jQuery.slider = function(div,options) {
    settings = {
        timeout:          5000,
        random_start:     true,
        bullet_label:     "&bull;",
        next_label:       "&raquo;",
        back_label:       "&laquo;",
    };
    if (options) jQuery.extend(settings, options);
    container = div
    // stop auto rotate on hover
    container.hover(jQuery.slider.stop, function(){
      // don't auto rotate if there is an active embed because it's probably a video
      if(jQuery.slider.current_slide().html().indexOf("<object") == -1 &&
         jQuery.slider.current_slide().html().indexOf("<embed") == -1){
         jQuery.slider.play()
      }
    })
    // bullet nav
    jQuery("<ul id='slider_nav'></ul>").insertAfter(container)
    container.find("a.slide").each(function(){
      jQuery("#slider_nav").append("<li class='bullet'>"+settings.bullet_label+"</li>")
    })
    // bullet click
    jQuery("#slider_nav li.bullet").click(function(){
      var i = jQuery("#slider_nav li.bullet").index(jQuery(this))
      jQuery("#slider_nav li.bullet").removeClass("active")
      jQuery(this).addClass("active")
      container.find("a.slide").fadeOut().removeClass("active")
      container.find("a.slide:nth-child("+(i+1)+")").fadeIn().addClass("active")
      jQuery.slider.play()
    })
    // next back nav
    jQuery("#slider_nav").prepend("<li class='back'>"+settings.back_label+"</li>")
    jQuery("#slider_nav").append("<li class='next'>"+settings.next_label+"</li>")
    jQuery("#slider_nav li.next").click(jQuery.slider.next)
    jQuery("#slider_nav li.back").click(jQuery.slider.back)
    // first slide
    container.find("a.slide").hide()
    if(settings.random_start) first = Math.floor(Math.random()*container.find("a.slide").length+1)
    else first = 1
    jQuery.slider.goto(first)
  };
  jQuery.slider.goto = function(position){
    jQuery("#slider_nav li.bullet:eq("+(position-1)+")").click()
  }
  jQuery.slider.stop = function(){
    clearTimeout(timeout)
  }
  jQuery.slider.play = function(){
    jQuery.slider.stop()
    timeout = setTimeout(function(){ jQuery.slider.next() }, settings.timeout)
  }
  jQuery.slider.current_slide = function(){
    return container.find("a.slide.active")
  }
  jQuery.slider.position = function(){
    return container.find("a.slide").index(container.find("a.slide.active"))
  }
  jQuery.slider.next = function(){
    next = jQuery.slider.position() + 2
    if(next > container.find("a.slide").length) next = 1
    jQuery.slider.goto(next)
  }
  jQuery.slider.back = function(){
    back = jQuery.slider.position()
    if(back == 0) back = container.find("a.slide").length
    jQuery.slider.goto(back)
  }

})(jQuery);