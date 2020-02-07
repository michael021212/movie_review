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

//= require_tree .

API_KEY = "3a2bad199fe90fb84b52bdca279bf1bb";

//jQuery動くか実験 html => h1.jquery Hello jQuery!
// $(document).ready(function () {
//   $('.jquery').mouseover(function(){
//     $(this).css('color','red');
//   });
//   $('.jquery').mouseout(function(){
//     $(this).css('color','black');
//   });
// });

fetch('https://api.themoviedb.org/3/movie/popular?api_key=3a2bad199fe90fb84b52bdca279bf1bb&language=en-US&page=1')
  .then(response => {
    return response.json();
  })
  .then(data => {
    //取得したJSONデータの処理
    console.log(data); //cosoleに表示(なくてもok)

    data.results.map(movie => {
      container = document.getElementById('app');
      const row = document.createElement('a');
      row.setAttribute('class', 'item');
      row.setAttribute('href', `/movies/${movie.id}`);

      const title = document.createElement('p');
      title.setAttribute('class', 'title');
      title.textContent = movie.title;

      const genre_ids = document.createElement('p');
      genre_ids.setAttribute('class', 'genre_ids');
      genre_ids.textContent = movie.genre_ids;

      const poster = document.createElement('img');
      poster.setAttribute('width', '100%');
      poster.setAttribute('alt', 'サンプル');
      poster.src = `https://image.tmdb.org/t/p/w300_and_h450_bestv2/${movie.poster_path}`;

      container.appendChild(row);
      row.appendChild(poster);
      row.appendChild(title);
      row.appendChild(genre_ids);
    })
  })
  .catch(error => {
    //エラー発生時の処理
    console.log('error');
  });

// URLパラメータ文字列を取得する
// var param = location.search
// console.log(param);


// function getId(ele){
//   var id_value = ele.id; // eleのプロパティとしてidを取得
//   console.log(id_value); //「id01」
// }

// movie_id = document.getElementById('767');
// movie_id = 767
movie_id = gon.movie_id //moviesコントローラーで定義した変数を代入
fetch(`https://api.themoviedb.org/3/movie/${movie_id}?api_key=3a2bad199fe90fb84b52bdca279bf1bb&language=en-US`)
  .then(response => {
    return response.json();
  })
  .then(data => {
    console.log(data);

    // ルーティングで定義したmoviesコントローラにapiのdataを:contentとして送る
    // $.ajax({
    //   url: "/movies/movie_data",
    //   type: "GET",
    //   data: {content : data},
    //   datatype: "html",
    // });

    container = document.getElementById(movie_id);
    const row = document.createElement('div');
    row.setAttribute('class', 'item');

    const title = document.createElement('p');
    title.setAttribute('class', 'title');
    title.textContent = data.title;

    const genres = document.createElement('p');
    genres.setAttribute('class', 'genres');
    genres.textContent = data.genres;

    const poster = document.createElement('img');
    poster.src = `https://image.tmdb.org/t/p/w300_and_h450_bestv2/${data.poster_path}`;

    container.appendChild(row);
    row.appendChild(poster);
    row.appendChild(title);
    row.appendChild(genres);
  })
  .catch(error => {
    //エラー発生時の処理
    console.log('error');
  })