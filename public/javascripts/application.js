$(function(){
  $("#exercise_question_question_body_bb").markItUp(settingMarkitup);
  $("#exercise_question_discussion_body_bb").markItUp(settingMarkitup);
  $("#tryout_question_question_body_bb").markItUp(settingMarkitup);
  $("#tryout_question_discussion_body_bb").markItUp(settingMarkitup);

  if(!(typeof(SCHOOLS) == 'undefined')){
    $("input#student_school_name").autocomplete(SCHOOLS, { matchContains: true });
    $("#records_school_name").autocomplete(SCHOOLS, { matchContains: true, mustMatch: true });
  }

  // Timer
  setTimeout(run_timer, 0);
  var minutes = 0;
  var seconds = 0;
  var working_time = 0;

  function run_timer() {
    setTimeout(run_timer, 1000);
    if(minutes > 0) {
      time = minutes + " menit " + seconds + " detik";
    } else {
      time = seconds + " detik";
    }
    $("#exerciseStopWatch").text(time);
    $("#exercise_answer_working_time").val(working_time);
    seconds++;
    working_time++;
    if(seconds == 60) {
      seconds = 0;
      minutes++;
    }
  }

  // tryoutTimer
  var secondsLeft = parseInt($("#tryoutTimer").text());
  window.setInterval(
    function(){
      var hour = (secondsLeft / 3600) | 0;
      var minutes = ((secondsLeft % 3600) / 60) | 0;
      var seconds = secondsLeft % 60;
      if(hour < 10){ hour = "0" + hour; }
      if(minutes < 10){ minutes = "0" + minutes; }
      if(seconds < 10){ seconds = "0" + seconds; }
      $("#tryoutTimer").html(hour + " : " + minutes + " : " + seconds);
      secondsLeft--;
  }, 1000);

  // jump question tryout
  $("#subject_id, #page").bind("change", function(){
    $("#jumpQuestionForm").submit();
  });

  // Change subject from exercise
  $("#subject_id").change(function() {
    $("#changeSubject").submit();
  });

  // ajax for universities & majors
  var request = function(options) {
    $.ajax($.extend({ url : options.url, type : options.type }, options));
    return false;
  };
 
  // kl ubah universitas
  $("#student_university1, #student_university2, #student_university3").live("change", function() {
    var major_number;
    var element_id = $(this).attr("id");
    if (element_id == "student_university1") {
      major_number = 1;
    } else if (element_id == "student_university2") {
      major_number = 2;
    } else if (element_id == "student_university3") {
      major_number = 3;
    }
    if ($("#student_program_id :selected").text() == "IPC") {
    return request({ url: "/majors", type: "get", data: { univ_id: $(this).val(), 
      major_number: major_number } }); 
    } else {
    return request({ url: "/majors", type: "get", data: {
      program_id: $("#student_program_id").val(), univ_id: $(this).val(), major_number: major_number } }); 
    }
  });

  // kl ubah program
  $("#student_program_id").live("change", function() {
    if ($("#student_program_id :selected").text() == "IPC") {
      $("#student_university3, #student_major3").removeAttr("disabled");
      return request({ url: "/majors", type: "get", data: {
        univ1_id: $("#student_university1").val(), univ2_id: $("#student_university2").val(), 
        univ3_id: $("#student_university3").val() } }); 
    } else {
      $("#student_university3, #student_major3").attr("disabled", "disabled");
      return request({ url: "/majors", type: "get", data: {
        program_id: $(this).val(), univ1_id: $("#student_university1").val(),
        univ2_id: $("#student_university2").val() } }); 
    }
  });

  // disable if not IPC
  if ($("#student_program_id :selected").text() != "IPC") {
    $("#student_university3, #student_major3").attr("disabled", "disabled");
  }

  //Tool Tips
  $('#grade a').tipsy({fade: true});
	$('#point a').tipsy({fade: true});
	$('th.name a').tipsy({fade: true});
	$('th.score a').tipsy({fade: true});
	$('.reportQuestion').tipsy({fade: true, gravity: 'w'});

  // Filter pembahasan soal
  $("select#type").change(function() {
    $("#discussionsFilter").submit();
  });

  // google analytics
  try {
  var pageTracker = _gat._getTracker("UA-12425854-2");
  pageTracker._setDomainName(".masuknegeri.com");
  pageTracker._trackPageview();
  } catch(err) {}
  
  // salute button
  window.salute_que = [];
  $('a.student-salute-btn').live('click', function(event) {
    function updateText(saluted) {
      if (saluted) {
        //desalute
        salute_text.text('Salute:');
        var c = original_saluted ? count -1 : count;
        salute_count.text(c);
      } else {
        //salute
        salute_text.text('Desalute:');
        var c = original_saluted ? count : count + 1;
        salute_count.text(c);
      }
    }
    
    var link = $(this),
        href = link.data('url'),
        salute_text = link.find('.student-salutes-text'),
        salute_count = link.parent().find('.student-salutes-count'),
        original_saluted = link.data('saluted'),
        saluted = link.data('new-saluted'),
        link_html = link.html(),
        count = link.data('count');
        
    if (saluted == null) saluted = original_saluted; 
    
    updateText(saluted, salute_text, salute_count);
    
    link.data('new-saluted', !saluted);

    // cancel all like que
    $.each(window.salute_que, function(index,xhr) {
      xhr.abort();
      window.salute_que.pop(xhr);
    });
    
    window.salute_que.push($.ajax({
      url: href,
      type: 'POST',
      dataType: 'json',
      error: function(xhr, textStatus, errorThrown) {
        link.html(link_html); //fallback to original
      },
      success: function(data, textStatus, xhr) {
        var salute = (data.type==1 ? true : (data.type==-1 ? false : null));
        updateText(!salute, salute_text, salute_count);
        link.data('new-saluted', salute);
      }
    }));  
    
    return false;  
  });
  
  // message recipient
  $('#message_recipients').tokenInput("/students/list.json", {
    crossDomain: false,
    theme: "facebook"
  });
  
  //report form
  $('#report input[type=submit]').live('click', function(event) {
    $('#question-report-form').dialog({
      width: 400,
      buttons: {
        "Kirim": function() {
          var win = $(this);
          var form = win.find('form').submit(function(){
            win.dialog("close");
          });

          form.submit();
  			},			
  			"Tutup": function() { $(this).dialog( "close" ); }
  		}
    });
    
    return false;
  });
});
