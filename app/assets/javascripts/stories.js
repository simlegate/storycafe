// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
      var _this_story
   $(".change_status_icon").bind('ajax:beforeSend', function(event,data,status, xhr){
                                                       alert("change"); })
                           .bind('ajax:success',    function(event,data,status,xhr){
                                                      if( data!="error" && data){

                                                           $(_this_story).hide();









                                                      }})
                           .bind('click' ,          function(o){
                                                       _this_story = this });

})
