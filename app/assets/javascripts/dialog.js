document.addEventListener("DOMContentLoaded", function(){
  let open = document.getElementById("open");
  let close = document.getElementById("close");
  let modal = document.querySelector("dialog");
    open.addEventListener("click", function(e){
      modal.showModal();
      e.preventDefault();
    }, false);
    close.addEventListener("click", () => modal.close());
    document.addEventListener("click", ({
      target
    }) => target === modal && modal.close());
  }, false);