// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    var _this;
    var next_status;
    var html;
    var html_float_content;

    var document_height = $(document).height()-40;
   $(".change_status_icon").bind('ajax:beforeSend', function(event,data,status, xhr){
                                                       alert("change"); })
                           .bind('ajax:success',    function(event,data,status,xhr){
                                                      if( data!="error" && data){
                                                          next_status = $(_this).attr("attr_next_status");
                                                          $o = $("#"+next_status+" table");
                                                          if($o.length >0) {

                                                          html ="<tr><td class='span1 test_id'>"+data.list_id+"</td><td class='span2'>"+data.user_name+"</td>"+
                                                                "<td class='title'> <a href='/stories/"+data.id+"/edit'  data-method='get'>"+data.title+"</a></td>"+
                                                                "<td class='span1'><a href='/stories/change_status?story_id="+data.id+"&status="+(data.status+1)+
                                                                "' attr_next_status="+data.next_status+""+
                                                                "class='change_status_icon' data-remote='true'>["+data.status+"]</a></td></tr>";

                                                          $o.append(html);

                                                       $(_this).parents("tr").siblings().length == 0 ? $(_this).parents(".float_content").remove() : $(_this).parents("tr").remove();

                                                   }else {

                                                         html_float_content ='<div class="span4 well float_content no_margin" id="stories_new" style="height: 390.5px; ">'+
                                                                             ' <div class="span12">'+
                                                                             '  <h4><span class="span1">6</span><span class="span11">new stories</span></h4>'+
                                                                             ' </div>'+
                                                                            ' <table class="table table-condensed table-condensed_story">'+
                                                                              ' <tr>'+
                                                                             '   <td attr_next_status="stories_started" class="span1 test_id">8</td>'+
                                                           '  <td class="span2">lbyronlee@gmail.com</td><td class="title"><a href="/stories/50b0c1911229bcb995000004/edit" data-method="get">3333333333333333333333333</a></td>'+
                                                                            ' </tr>'+
                                                                             ' </table>'+
                                                              '</div>';
                                                           $('#'+next_status).append(html_float_content);
                                                           $(_this).parents("tr").siblings().length == 0 ? $(_this).parents(".float_content").remove() : $(_this).parents("tr").remove();
                                                      }


                                                      }})
                           .bind('click' , function(){
                               _this = this;
                             });


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
