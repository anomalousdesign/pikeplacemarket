// HTML5 for IE8
document.createElement("article");  
document.createElement("footer");  
document.createElement("header");  
document.createElement("hgroup");  
document.createElement("nav"); 

// IE 10 doesn't use conditional comments
if(navigator.userAgent.match("MSIE 10")){
	$("head").append('<link href="/ie.css" media="all" rel="stylesheet" type="text/css" />')
}

// params hash from query string
var pairs = location.search.replace("?","").split('&');
var params = {};
for(i in pairs){
	var split = pairs[i].split('=');
	params[decodeURIComponent(split[0])] = decodeURIComponent(split[1]);
}

String.prototype.squeeze = function() {
	return this.replace(/\s+/g, ' ');
};

function fixTitle(){
	var text = $('.fc-center h2').text();
	text.replace('<br - br>', '<br />');
	text = $.parseHTML(text);
	$('.fc-center h2').html(text);
	$('.fc-day-number').wrapInner('<span class="day"></span>');
}

$(document).ready(function(){
	var month = new Array( "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
	/*$('#calendar').fullCalendar({
		eventSources: [
            {
                url: '/events.json',
                type: 'GET',
                data: function() {
                    var cdate = new Date($('#calendar').fullCalendar('getDate'));
                    return {
                        month: cdate.getMonth() + 1,
                        year: cdate.getFullYear(),
                    }
                },
            }
        ],
		header: {
			left:   'prev',
			center: 'title',
			right:  'next'
		},
		titleFormat: 'MMMM<br><p>YYYY</p>',
		columnFormat: "dddd",
		buttonText: {
            prev: month[parseInt(new Date().getMonth(), 10) - 1],
            next: month[parseInt(new Date().getMonth(), 10) + 1]
        },
		eventLimit: true,
		//eventLimitText: "View All",
		views: {
			agenda: {
				eventLimit: 4,
			}
		},
	});
	fixTitle();
	var now = new Date();
	now = now.getMonth();
	var next = now+1;
	var prev = now-1;
	$('.fc-next-button').click(function(){
		if(now == 11){ now = 0; } else { now = now+1; }
		if(now == 11){ next = 0; } else { next = now+1; }
		if(now == 0){ prev = 11; } else if(now == 1){ prev = 0; } else { prev = now-1; }
		$('.fc-next-button').text(month[next]);
		$('.fc-prev-button').text(month[prev]);
		fixTitle();
	});
	$('.fc-prev-button').click(function(){
		if(now == 0){ now = 11; } else { now = now-1; }
		if(now == 11){ next = 0; } else { next = now+1; }
		if(now == 0){ prev = 11; } else { prev = now-1; }
		$('.fc-next-button').text(month[next]);
		$('.fc-prev-button').text(month[prev]);
		fixTitle();
	});*/

	// Open expand menus for current page
	// $("a[href*='"+location.pathname+"']").addClass("active").parents("li").find(".expand").click()
	if(location.pathname != "/"){
		$("a[href$='"+location.pathname+"']").not("footer a").addClass("active").parents("li").addClass("active")	
	}
	$(".info-thumb").hover(function(){
		$(this).find(".info").animate({height:"120px", "margin-top":"-130px"})
	}, function(){
		$(this).find(".info").animate({height:"35px", "margin-top":"-45px"})
	});

	$(".modal").appendTo("body"); // this fixes modals in strange dom places

	// $(".events-index select").change(function(){
	// 	// location.href = location.pathname + "?tag=" + $(this).val()
	// 	if($(".events-index select").val() == "Category") return nil;
	// 	$(".event-item").each(function(){
	// 		c = $(".events-index select").val().toLowerCase().split(" ").join("_")
	// 		if($(this).hasClass(c)) $(this).slideDown(100);
	// 		else $(this).slideUp(100);
	// 	})
	// });

	$(".events-index select").selectbox({
		onChange: function(value, obj){
			// location.href = location.pathname + "?tag=" + $(this).val()
			if(value == "Category") return null;
			$(".event-item").each(function(){
				c = value.toLowerCase().split(" ").join("_")
				if($(this).hasClass(c)) $(this).slideDown(100);
				else $(this).slideUp(100);
			})
		}
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

	// $("#quick-search select").change(function(){
	// 	if($(this).val() == "") return false;
	// 	$("#quick-search").submit();
	// });
	
	$("#quick-search select.location").selectbox({
		onChange: function(value, obj){
			if(value == "") return false;
			location.href = "/directory?location="+value
		}
	});
	
	$("#quick-search select.category").selectbox({
		onChange: function(value, obj){
			if(value == "") return false;
			location.href = "/directory?category="+value
			// $("#quick-search").submit();
		}
	});

	// $("select.location").change(function(){
	// 	$("#directory-search input").val($("select.location").val()).keyup();
	// });
	
	$("#directory-search select.location").selectbox({
		onChange: function(value, obj){
			$("#directory-search input").val(value).keyup();
		}
	});

	// $("select.category").change(function(){
	// 	$(".accordion.main .accordion-body").removeClass("in");
	// 	$(".accordion.main .accordion-heading").removeClass("active");

	// 	accordion = $("#accordion-"+$(this).val());
	// 	accordion.find(".accordion-body").addClass("in");
	// 	accordion.find(".accordion-heading").addClass("active");
	// });

	$("#directory-search select.category").selectbox({
		onChange: function(value, obj){
			$(".accordion.main .accordion-body").removeClass("in");
			$(".accordion.main .accordion-heading").removeClass("active");

			accordion = $("#accordion-"+value);
			accordion.find(".accordion-body").addClass("in");
			accordion.find(".accordion-heading").addClass("active");
		}
	});

	$(".accordion-heading").click(function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			return true;
		}
		$(this).parent().parent().find(".accordion-heading").removeClass("active");
		$(this).addClass("active");
	});

	$("footer .dropdown-menu").addClass("dropup-menu");

	setTimeout(function(){
		if(params.keyword != "" && params.keyword != undefined){
			$("#directory-search input").val(params.keyword.split("+").join(" ")).keyup();
		}
		if(params.location != "" && params.location != undefined){
			$("#directory-search input").val(params.location.split("+").join(" ")).keyup();
		}
		if(params.category != "" && params.category != undefined){
			// $("select.category").val(params.category).change();
			$("[rel="+params.category.split(" ").join("-")+"]").click()
		}
	}, 500);

	$("select").selectbox();

	$("img").error(function(){
		$(this).attr("src", $(this).attr("src").split("cropped").join("original"));
	});

})

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-16887145-1']);
_gaq.push(['_setDomainName', 'pikeplacemarket.org']);
_gaq.push(['_setAllowLinker', true]);
_gaq.push(['_trackPageview']);

(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
