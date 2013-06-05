// params hash from query string
var pairs = location.search.replace("?","").split('&');
var params = {};
for(i in pairs){
	var split = pairs[i].split('=');
	params[decodeURIComponent(split[0])] = decodeURIComponent(split[1]);
}

String.prototype.squeeze = function() {
	return this.replace(/\s+/g, ' ').trim();
};

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
			if($(this).text().squeeze().match(val)) $(this).slideDown(100);
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
			if($(this).text().squeeze().match(val)){
				$(this).clone().appendTo("#search-results .results");
			}
		});
	});

	$("select.location").change(function(){
		$("#directory-search input").val($("select.location").val()).keyup();
	});

	$("select.category").change(function(){
		$(".accordion.main .accordion-body").removeClass("in");
		$(".accordion.main .accordion-heading").removeClass("active");

		accordion = $("#accordion-"+$(this).val());
		accordion.find(".accordion-body").addClass("in");
		accordion.find(".accordion-heading").addClass("active");
	});

	$("#quick-search select").change(function(){
		if($(this).val() == "") return false;
		$("#quick-search").submit();
	});

	setTimeout(function(){
		if(params.keyword != "") $("#directory-search input").val(params.keyword.split("+").join(" ")).keyup();
		if(params.location != "") $("#directory-search input").val(params.location.split("+").join(" ")).keyup();
		if(params.category != "") $("select.category").val(params.category).change();
	}, 500);

	$(".accordion-heading").click(function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			return true;
		}
		$(this).parent().parent().find(".accordion-heading").removeClass("active");
		$(this).addClass("active");
	});
})
