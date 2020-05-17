$(document).on('turbolinks:load', function() {
  $(function(){
    var loader = $('.loader-wrap');
    var fadeout = function(){loader.fadeOut();}

    //ページの読み込みが完了したらアニメーションを非表示
    $(window).on('load',fadeout);

    //ページの読み込みが完了してなくても2秒後にアニメーションを非表示にする
    setTimeout(fadeout,2000);
  });
});