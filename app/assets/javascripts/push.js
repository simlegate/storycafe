PrivatePub.subscribe("/messages/new", function(data, channel) {
  // $(".brand").append(data.message);
//  alert($("#input_1").val())
    //alert(data.message.content)
    $("#message_list").append("<li>"+data.message.content+"</li>")
//notify();
            
});

$(document).ready(function(){$("#push_1").bind("click",function(){alert("success");window.notify()})})
window.notify = function (){

//function notify(){
  alert("I want to use notification");
  window.open("http://baidu.com","_blank")
  if(window.webkitNotifications){
    // when it is 0 ,have permission
    if(window.webkitNotifications.checkPermission() > 0){
       alert("I");
       window.webkitNotifications.requestPermission(notify)
       //RequestPermission(notify)
       alert("want");
    } else {
        var notification = window.webkitNotifications.createNotification(
          //"/assets/coffe.jpg",
          "http://images.cnblogs.com/cnblogs_com/flyingzl/268702/r_1.jpg",
          "storycoffe",
          "Hello world"
        );
        notification.onerror = function(){alert(222)}
        notification.show();
      }
     } else {alert('not supported!')}

}
            
   
function init() {
            if (window.webkitNotifications) {
                alert("init")
                window.webkitNotifications.requestPermission();
            }
        }

function RequestPermission (callback) {
  window.webkitNotifications.requestPermission(callback);
}

