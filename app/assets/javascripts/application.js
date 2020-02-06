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
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

API_KEY = "3a2bad199fe90fb84b52bdca279bf1bb";

//jQuery動くか実験
$(document).ready(function () {
  $('.jquery').mouseover(function(){
    $(this).css('color','red');
  });
  $('.jquery').mouseout(function(){
    $(this).css('color','black');
  });
});

fetch('https://api.themoviedb.org/3/movie/now_playing?api_key=3a2bad199fe90fb84b52bdca279bf1bb&language=en-US&page=1')


  data.results.map(movie => {
    const row = document.createElement('div');
    row.setAttribute('class', 'item');

    const title = document.createElement('p');
    title.setAttribute('class', 'title');
    title.textContent = movie.title;

    const poster = document.createElement('img');
    poster.src = `https://image.tmdb.org/t/p/w300_and_h450_bestv2/${movie.poster_path}`;

    container.appendChild(row);
    row.appendChild(poster);
    row.appendChild(title);
  });

