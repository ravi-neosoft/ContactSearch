$(document).ready(function(){
  $('.testing').on('click', function(e){
    e.preventDefault();
    $($('.number')[0]).append($(this).html());
    var data = {
      num: $($('.number')[0]).html()
    };
    $.ajax({
      url: 'search',
      type: "get",
      data: data
    });
  });
});
