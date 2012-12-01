// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function() {

    // 异步添加story
    $("#new_story").bind('ajax:beforeSend', function(event,data,status, xhr){
      //  var story_title = $("form[class=new_story] input[type=text]").val();
      //                 story_title == "" ? alert("不能为空！") ：  confirm("你确定添加此story？")
                  }).bind('ajax:success',function(event,data){
                      $(".block-stories-new table").append(data)
                  })

    $("#new_project").bind('ajax:beforeSend', function(event,data,status, xhr){
                     alert("new project")
                  }).bind('ajax:success',function(event,data){
                      alert("create project successlly");
                  }).bind('ajax:error',function(event,data,status, xhr){
                       alert("error")
                  })

    // 给每一个story title 添加一个hover 样式
    $(".title").click(function(){
        $(this).addClass("classname").siblings().removeClass("classname")
    })

    //异步更新每一个story 的description
    $("#description_content").bind(
        'ajax:beforeSend',
              function(event,data,status, xhr){
                   var FormContent= $("#description-areatext").val();
              //     alert(FormContent);
                      if(!FormContent) return;
                                }).bind(
       'ajax:success',
              function(event,data,status,xhr){
                  //alert(data)
               //    alert("autosave success!");
              });
     // 给story 的description 的编辑框绑定一个异步自动保存
    $("#description-areatext").bind("blur",function(){
      //  alert("autosave ???");
        $("#description_content").submit();
    })



    // 异步添加group
    $("#new_group").bind('ajax:beforeSend', function(event,data,status, xhr){
                     alert("ajax异步添加group, 点击确认")
                  }).bind('ajax:success',function(event,data){
                      alert(data);
                      $('#myModal').modal('hide')
                      $("#group_list").append('<tr><td><a href="/groups/'+data['_id']+'/edit">'+data['title']+'</a></td></tr>')
                  })


    $("#push").bind('ajax:beforeSend', function(event,data,status, xhr){
                     alert("push")
                  }).bind('ajax:success',function(event,data){
                      alert(data);
                  })


})
