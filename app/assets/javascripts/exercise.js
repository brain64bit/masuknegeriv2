//= require jquery-ui

$(function(){
  // Change subject from exercise
  $("#subject_id").change(function() {
    $("#changeSubject").submit();
  });
  
  // badge notification
  $('div.badge-notification').dialog({
    width: 280,
    buttons: {
			"Tutup": function() {
				$( this ).dialog( "close" );
			}
		}
  });
  
  // post on facebook feed
  $('a.share-on-fb-btn').live('click', function(event) {
    ahmy = $(this)
    var url = $(this).data('url')
    var image_url = $(this).data('image_url')
    var title = $(this).data('title')
    var caption = $(this).data('caption')
    var description = $(this).data('description')
    //console.log(url, image_url, title, caption, description);
    postToFeed(url, image_url, title, caption, description)
    return false
  });
  
  //report form
  $('#report-btn').live('click', function(event) {
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