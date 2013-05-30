$(function(){
	// Open expand menus for current page
	// $("a[href*='"+location.pathname+"']").addClass("active").parents("li").find(".expand").click()
	if(location.pathname != "/"){
		$("a[href*='"+location.pathname+"']").addClass("active").parents("li").addClass("active")	
	}
	$(".info-thumb").hover(function(){
		$(this).find(".info").animate({height:"120px", "margin-top":"-130px"})
	}, function(){
		$(this).find(".info").animate({height:"35px", "margin-top":"-45px"})
	});

	$(".modal").appendTo("body"); // this fixes modals in strange dom places
})
