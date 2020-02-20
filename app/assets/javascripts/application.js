// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require Chart.min
//= require jquery.raty
//= require tagsinput
//= require rails-ujs
//= require activestorage
//= require data-confirm-modal

//= require_tree .

$(function () {
  $('#nav_user-menu').on('mouseover',function(){
      $(this).css('background-color','grey');
  });
  $('#nav_user-menu').on('mouseout',function(){
      $(this).css('background-color','white');
  });
  $('#nav_user-menu').click(function () {
      $('.nav_user-menu').slideToggle('fast');
  });
});

$(function(){
    setTimeout("$('.alert').fadeOut('slow')", 7000)
  })

$(function(){
    setTimeout("$('.auto-hide').fadeOut('slow')", 1500)
  })