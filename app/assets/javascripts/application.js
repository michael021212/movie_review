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


//jQuery動くか実験 html => h1.jquery Hello jQuery!
// $(document).ready(function () {
  //   $('.jquery').mouseover(function(){
    //     $(this).css('color','red');
    //   });
    //   $('.jquery').mouseout(function(){
      //     $(this).css('color','black');
      //   });
      // });

KEY = gon.TMDb_KEY; // コントローラで定義した環境変数
fetch(`https://api.themoviedb.org/3/movie/popular?api_key=${KEY}&language=ja-JP&page=1`)
  .then(response => {
    return response.json();
  })
  .then(data => {
    //取得したJSONデータの処理
    console.log(data); //cosoleに表示(なくてもok)

    data.results.map(movie => {
      container = document.getElementById('app');

      const div = document.createElement('div');
      div.setAttribute('class', 'item');

      const row = document.createElement('a');
      row.setAttribute('class', 'set');
      row.setAttribute('href', `/movies/${movie.id}`);

      const poster = document.createElement('img');
      // poster.setAttribute('width', '100%');
      poster.setAttribute('alt', 'サンプル');
      poster.src = `https://image.tmdb.org/t/p/w200/${movie.poster_path}`;

      const title = document.createElement('h4');
      title.setAttribute('class', 'title');
      title.textContent = movie.title;

      const genre_ids = document.createElement('p');
      genre_ids.setAttribute('class', 'genre_ids');
      genre_ids.textContent = movie.genre_ids;

      const post = document.createElement('a');
      post.setAttribute('class', 'post');
      post.setAttribute('href', `/reviews/new?movie_id=${movie.id}`);
      post.textContent = 'レビュー';

      const total_score = document.createElement('p');
      total_score.setAttribute('class', 'total_score');
      total_score.textContent = `平均スコア ${gon.total_score}`;

      container.appendChild(div);
      div.appendChild(row);
      row.appendChild(poster);
      // row.appendChild(title);
      row.appendChild(genre_ids);
      div.appendChild(post);
      div.appendChild(total_score);
    })
  })
  .catch(error => {
    //エラー発生時の処理
    console.log('error');
  });

// URLパラメータ文字列を取得する
// var param = location.search
// console.log(param);

movie_id = gon.movie_id //moviesコントローラーで定義した変数を代入
total_score_avg = gon.total_score_avg //moviesコントローラーで定義した変数を代入
fetch(`https://api.themoviedb.org/3/movie/${movie_id}?api_key=${KEY}&language=ja-JP`)
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

    const poster = document.createElement('img');
    poster.src = `https://image.tmdb.org/t/p/w300_and_h450_bestv2/${data.poster_path}`;

    const title = document.createElement('p');
    title.setAttribute('class', 'title');
    title.textContent = data.title;

    const genres = document.createElement('p');
    genres.setAttribute('class', 'genres');
    genres.textContent = data.genres;

    const post = document.createElement('a');
    post.setAttribute('class', 'post');
    post.setAttribute('href', `/reviews/new?movie_id=${movie_id}`);
    post.textContent = 'レビュー';

    const total_score = document.createElement('p');
    total_score.setAttribute('class', 'total_score');
    total_score.textContent = `平均スコア ${total_score_avg}`;

    container.appendChild(row);
    row.appendChild(poster);
    row.appendChild(title);
    row.appendChild(genres);
    row.appendChild(post);
    row.appendChild(total_score);
  })
  .catch(error => {
    //エラー発生時の処理
    console.log('error');
  })