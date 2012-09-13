//= require lib/jquery.tokeninput

$(function(){
  $('#message_recipients').tokenInput("/students/list.json", {
    crossDomain: false,
    theme: "facebook"
  });
});
