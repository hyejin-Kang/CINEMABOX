//header
$(function(){
   	//sub nav
   	$('.mainnav').mouseover(function(){
      	$(this).children('.subnav').stop().slideDown().css('display','flex');
   	})
   	$('.mainnav').mouseleave(function(){
      	$(this).children('.subnav').stop().slideUp();
   	})
   
   	//scroll에 따른 sticky nav
   	var navOffset = $('#sticky-nav').offset();
   	$(window).scroll(function(){
      	if($(document).scrollTop() > navOffset.top){
        	$("#mainnav-container").addClass("sticky-menu");
      	}else{
         	$("#mainnav-container").removeClass("sticky-menu");
      	}
   	})
	
	//탑배너
	$("#i-close-top-banner").click(function(){
		$("#div-top-banner").slideUp();
	})
});