$( document ).ready(function() {
	$("a.lets-play").click(function() {
	  $("#landingCon").fadeOut("fast");
	});
});

var allNames = [];

allNames.push(
	{firstImg: "then1", lastImg: "now2"}, 
	{firstImg: "then2", lastImg: "now3"}, 
	{firstImg: "then3", lastImg: "now4"}, 
	{firstImg: "then4", lastImg: "now5"}, 
	{firstImg: "then5", lastImg: "now6"}, 
	{firstImg: "then6", lastImg: "now7"}, 
	{firstImg: "then7", lastImg: "now8"}, 
	{firstImg: "then8", lastImg: "now1"}
)


var origXPos = [];
var origYPos = [];
var attempts = 0;
var correct = 0;

var captions = [];
captions[0] = "Sure to make you hungry today are the aromas of mac & cheese at Beecher\'s Handmade Cheese. Back in 1937, you smelled new leather shoes at Family Shoe Market.";
captions[1] = "Topsy-turvy:  The Goodwin family built the lower levels in 1919 starting at Level 6-Pike Place-and finished at Level 1 on Western Avenue. Compare the cars.";
captions[2] = "When the building first opened in 1912, Three Girls Bakery was there. It was one of Seattle\'s first women-owned businesses. Today, it is around the corner.";
captions[3] = "These one-room apartments with no kitchen or bathroom were home to many who worked away from the city: fishermen, lumberjacks, sailors. Today, residents still share facilities like bathrooms with neighbors.";
captions[4] = "The Triangle Building really is a three-sided building. Residents above the shops might smell fresh cinnamon rolls or Bolivian food from the restaurant next door. Open a window and they might hear buskers perform below.";
captions[5] = "The lower levels once had a branch of the Seattle Public Library and a post office. Today they are known for the shops that sell collectibles and antiques. The preschool is here, too.";
captions[6] = "An arcade is a covered walkway. In  1968 you could shop daystalls and go to the drugstore. Now you can buy donuts, bagels, art, newspapers and Italian foods.";
captions[7] = "The gap between the buildings in the old photo has been filled in the newer photo. What famous Market landmarks are missing in the old photo?";

function gameInit() {
	//console.log("ready");
	
	$("#detail").hide();
	$("#shareCon").hide();

	$( ".draggable" ).draggable({ revert: "valid" });
	$( ".droppable" ).droppable({
      hoverClass: "boxHover",
      drop: function( event, ui ) {
        $( this )
         var dragid = ui.draggable.attr("id").substring(1, ui.draggable.attr("id").length);
         var dropid = $(this).attr("id").substring(1, $(this).attr("id").length);
         var dataid = $(this).attr("data-id")
         if (dragid == dropid) {
	   			$("." + dragid + "inside").css("display", "block");
//				$("#t" + dropid + " .messageright").css("display", "inline").delay(1500).fadeOut( "slow" );

				ui.draggable.css("visibility", "hidden");
				attempts ++;
				correct ++;
				$("#numAttempts").text(attempts);
				$("#numCorrect").text(correct);
				showInfo(dataid);

				$(this).click(function() {
					showInfo(dataid);
				});

				if (correct == 8) {					
					$("#detail").click(function() {
						$("#congratsCon").fadeIn("fast",function(){$(this).show()});
					});
				}

	         } else {
	         	$("#t" + dropid + " .messagewrong").css("display", "inline").delay(1500).fadeOut( "slow" );
	         	attempts ++;
	         	$("#numAttempts").text(attempts);
	         }
      	}
    });

    $( ".droppable2" ).droppable();

    $("#detail").click(function() {
		$("#detail").hide();
		$("#detail").animate({ opacity: '0' }, 500);
	});

} 

function showInfo(which) {
	$("#detail").show();
	$("#detail").animate({ opacity: '1' }, 500);
	$("#detail #desc p").text(captions[which]);

	var img1 = new Image();
	img1.src = "images/" + allNames[which].firstImg + ".jpg";
	
	var img2 = new Image();
	img2.src = "images/" + allNames[which].lastImg + ".jpg";
	
	$("#detail #photoCon").empty();
	$("#detail #photoCon").append(img1, img2);


}


$(document).ready(function() {
	gameInit();

});