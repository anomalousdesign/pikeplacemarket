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

	$(".events-index select").change(function(){
		// location.href = location.pathname + "?tag=" + $(this).val()
		if($(".events-index select").val() == "Category") return nil;
		$(".event-item").each(function(){
			c = $(".events-index select").val().toLowerCase().split(" ").join("_")
			if($(this).hasClass(c)) $(this).slideDown(100);
			else $(this).slideUp(100);
		})
	});

	$(".events-index input").keyup(function(){
		// location.href = location.pathname + "?tag=" + $(this).val()
		$(".event-item").each(function(){
			val = new RegExp($(".events-index input").val(), "i")
			if($(this).html().match(val)) $(this).slideDown(100);
			else $(this).slideUp(100);
		})
	});

	$("#directory-search input").keyup(function(){
		// location.href = location.pathname + "?tag=" + $(this).val()
		$("#search-results .results").html("");
		var s = $("#directory-search input").val();
		$("#search-results .search-term").html('"'+s+'"');
		if(s == ""){
			$("#search-results").hide()
		} else {
			$("#search-results").show()
		}
		$(".merchant").each(function(){
			val = new RegExp(s, "i")
			if($(this).text().match(val)){
				$(this).clone().appendTo("#search-results .results");
			}
		});
	});

	$("#quick-search select").change(function(){
		$("#quick-search").submit();
	});

	$(".accordion-heading").click(function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			return true;
		}
		$(this).parent().parent().find(".accordion-heading").removeClass("active");
		$(this).addClass("active");
	});
})
