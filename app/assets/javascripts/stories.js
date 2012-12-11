// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    var _this;
    var next_status;
    var html;
    var html_float_content;
    var document_height = $(document).height()-40;

     $(".slideleft").css("height", document_height);
     $(".float_content").css("height", document_height/2);


    $(".close_nav").bind('click', function(){
        $('.navbar').toggle(500);

    })

    $('.close_group').bind('click', function(){

      //

        $('.group').animate({ },0,function(){
            $('.slideleft').toggle(500);
            $('.float_content_title').css("background-color", "#666");
           $('.all_content').removeClass("span10").addClass("span12")

        });

    })


    $('.open').bind('click',function(){
        $('.new_story').toggle(500);
    })


})
