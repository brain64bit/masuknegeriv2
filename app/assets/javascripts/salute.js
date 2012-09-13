$(function(){
  // salute button
  window.salute_que = [];
  $('a.student-salute-btn').live('click', function(event) {
    function updateText(saluted) {
      if (saluted) {
        //desalute
        var c = original_saluted ? count -1 : count;
        wrapper.removeClass('active')
        salute_count.text(c);
      } else {
        //salute
        wrapper.addClass('active')
        var c = original_saluted ? count : count + 1;
        salute_count.text(c);
      }
    }
  
    var link = $(this),
        href = link.data('url'),
        salute_count = link.parent().find('.student-salutes-count'),
        original_saluted = link.data('saluted'),
        wrapper = link.parents('.salute-me'),
        saluted = link.data('new-saluted'),
        salute_html = salute_count.html(),
        salute_class = wrapper.hasClass('active'),
        count = link.data('count');
      
    if (saluted == null) saluted = original_saluted; 
  
    updateText(saluted);
  
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
        //fallback to original
        link.parent().find('.student-salutes-count').html(salute_html); 
        salute_class ? wrapper.addClass('active') : wrapper.removeClass('active');
      },
      success: function(data, textStatus, xhr) {
        var salute = (data.type==1 ? true : (data.type==-1 ? false : null));
        updateText(!salute);
        link.data('new-saluted', salute);
      }
    }));  
  
    return false;  
  });
});