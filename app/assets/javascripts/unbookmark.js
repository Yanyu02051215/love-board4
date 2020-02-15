$(function(){
  $(document).on("click", ".bookmark2", function(){ 
    var question_id = $("#question_id").val(); 
    $.ajax({
      type:"DELETE",
      url: `/bookmarks/${question_id}`,
      data: {question_id: question_id}, 
      dataType: "json" 
    })
    .done(function(){
      var aaa = document.getElementsByClassName("bookmark2");
      aaa[0].textContent = "ブックマーク" ;
      aaa[0].className = "bookmark";

    })
    .fail(function(){
      alert("失敗しました"); 
    })
  })
})