$(function() {
 
  // .menu-triggerクリック時に行われる処理
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });
 
 });