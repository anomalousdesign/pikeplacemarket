$(function(){
	// Open expand menus for current page
	// $("a[href*='"+location.pathname+"']").addClass("active").parents("li").find(".expand").click()
	if(location.pathname != "/"){
		$("a[href*='"+location.pathname+"']").addClass("active").parents("li").addClass("active")	
	}
})
