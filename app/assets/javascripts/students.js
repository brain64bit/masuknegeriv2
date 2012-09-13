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