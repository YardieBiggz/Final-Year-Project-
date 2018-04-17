// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var slideIndex = 0;
showSlides();

function showSlides() {
 var i;
 var slides = document.getElementsByClassName("mySlides");
 var dots = document.getElementsByClassName("dot");
 for (i = 0; i < slides.length; i++) {
  slides[i].style.display = "none";
 }
 slideIndex++;
 if (slideIndex > slides.length) {
  slideIndex = 1
 }
 for (i = 0; i < dots.length; i++) {
  dots[i].className = dots[i].className.replace(" active", "");
 }
 slides[slideIndex - 1].style.display = "block";
 dots[slideIndex - 1].className += " active";
 setTimeout(showSlides, 2500);
 // This allows the image to Change every 2.5 seconds
}
};
