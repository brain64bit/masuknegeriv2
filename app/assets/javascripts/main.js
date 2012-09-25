$(document).ready(function(){
// form
    $('input[type="button"], input[type="submit"], input[type="reset"]').addClass('form-button');
    $('input[type="password"]').addClass('form-psw');
    $('input[type="text"]').addClass('form-text');
    $('input[type="radio"]').addClass('form-radio');
    $('input[type="checkbox"]').addClass('form-cbox');
    
    
    //main-nav 
    $('#main-nav li:last').addClass('last-list');
    
    //Carousel
    $('.top-point1').jCarouselLite({
        btnNext: ".point-today .next",
        btnPrev: ".point-today .prev",
        circular: false,
        visible: 4
    });
    $('.top-point2').jCarouselLite({
        btnNext: ".point-nas .next",
        btnPrev: ".point-nas .prev",
        circular: false,
        visible: 4
    });
    
    // List split-2
    $('li:nth-child(even), tbody tr:nth-child(even)').addClass('even-list')
    $('li:nth-child(odd), tbody tr:nth-child(odd)').addClass('odd-list')
    
    // notifikasi
    $('.close-msg').click(function(){
       $(this).parent().fadeOut(); 
    });
    
    // Post Wall
    /*$('.post-action').hide();
    $('.post-wall').hover(function(){
       $(this).children().children().children('.post-action').show();
    }, function(){
       $(this).children().children().children('.post-action').hide();
    });*/
    
    // Messaging 
    $('.set-msg').click(function(){
       $(this).parent().parent().parent().parent().toggleClass('unread');
       return false
    });
    
    // FancyBox
    $('.list-badge a').fancybox({
        'overlayColor' : '#000000' 
    });
    
    if(!(typeof(SCHOOLS) == 'undefined')){
      $("input#student_school_name").autocomplete(SCHOOLS, { matchContains: true });
      $("#records_school_name").autocomplete(SCHOOLS, { matchContains: true, mustMatch: true });
    }
    
    $("select#type").change(function() {
      $("#discussionsFilter").submit();
    });

    $(".datepicker").datepicker();
});