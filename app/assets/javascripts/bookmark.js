$(function(){
  $(document).on("click", ".bookmark", function(){ 
    var question_id = $("#question_id").val(); 
    $.ajax({
      type:"POST",
      url: `/questions/${question_id}/bookmark`,
      data: {question_id: question_id}, 
      dataType: "json" 
    })
    .done(function(){
      var bbb = document.getElementsByClassName("bookmark");
      bbb[0].textContent = "ブックマーク解除" ;
      bbb[0].className = "bookmark2";

      var likeCount = document.getElementsByClassName("book")
      likeCount[0].className = "my-black"

    })
    .fail(function(){
      alert("失敗しました"); 
    })
  })
})