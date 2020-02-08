// $(function(){
//   $(document).on("click", ".like2", function(){ 
//     var product_id = $("#product_id").val(); 
//     $.ajax({
//       type:"POST",
//       url: `/products/${product_id}/likes`,
//       data: {product_id: product_id}, 
//       dataType: "json" 
//     })
//     .done(function(){
//       var bbb = document.getElementsByClassName("like2");
//       bbb[0].textContent = "いいね！" ;
//       bbb[0].className = "unlike2";

//       var likeCount = document.getElementsByClassName("count-up")
//       likeCount[0].textContent = Number(likeCount[0].textContent) + 1
//       likeCount[0].className = "count-down"

//     })
//     .fail(function(){
//       alert("失敗しました"); 
//     })
//   })
// })