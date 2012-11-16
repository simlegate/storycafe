// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function() {
    $("#new_story").bind('ajax:beforeSend', function(event,data,status, xhr){
                     alert("sdfg")
                  }).bind('ajax:success',function(event,data){
                      alert(data);
                      $(".table-condensed").append('<tr><td>'+data['user']+'</td><td>'+data['title']+'</td></tr>')
                  })

    $(".title").click(function(){
        $(this).addClass("classname").siblings().removeClass("classname")
    })



    $("#description_content").bind(
        'ajax:beforeSend',
              function(event,data,status, xhr){
                   var FormContent= $("#description-areatext").val();
                      alert(FormContent);
                      if(!FormContent) return;
                                }).bind(
       'ajax:success',
              function(event,data){
                  alert(data)
                    // alert("autosave success!");
              });


    $("#description-areatext").bind("blur",function(){
        alert("sdfgsdfg");
        $("#description_content").submit();
    })



})
