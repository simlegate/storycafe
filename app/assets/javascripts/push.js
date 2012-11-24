PrivatePub.subscribe("/messages/new", function(data, channel) {
  // $(".brand").append(data.message);
  alert(data.message)
});
