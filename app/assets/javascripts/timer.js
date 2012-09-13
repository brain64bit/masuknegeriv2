$(function(){
  // Timer
  setTimeout(run_timer, 0);
  var working_time = 0;
  
  function run_timer() {
    setTimeout(run_timer, 1000);
    
    var hours = Math.floor(working_time / (3600));
    var divisor_for_minutes = working_time % (3600);
    var minutes = Math.floor(divisor_for_minutes / 60);
    var divisor_for_seconds = divisor_for_minutes % 60;
    var seconds = Math.ceil(divisor_for_seconds);
    
    $('.latih-inner .hour span:nth-child(1)').html(Math.floor(hours / 10));
    $('.latih-inner .hour span:nth-child(2)').html(hours % 10);
    $('.latih-inner .minutes span:nth-child(1)').html(Math.floor(minutes / 10));
    $('.latih-inner .minutes span:nth-child(2)').html(minutes % 10);
    $('.latih-inner .second span:nth-child(1)').html(Math.floor(seconds / 10));
    $('.latih-inner .second span:nth-child(2)').html(seconds % 10);

    
    
    $("#exercise_answer_working_time").val(working_time);
    working_time++;
  }
});