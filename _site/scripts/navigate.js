var status = 0;

$(document).ready(function() {
	var param = getURLParameter("s");
	if (param != null) {
		status = parseInt(param);
	}
	
	if ($("#summary")) {
		if ($("#answer-yes").is(":checked")) {
			$("#summary").show("fast");
		}
		if ($("[name=answer]:checked").length) {
			$("#btnContinue").removeAttr("disabled");
		}
		$("[name=answer]").click(function() {
			$("#btnContinue").removeAttr("disabled");
			if ($("#answer-yes").is(":checked")) {
				$("#summary").show("fast");
			}
			else
			{
				$("#summary").hide("fast");
			}
		});
	}
	
	if ($("#help").length) {
		initHelp();
	}
});

function goNext() {
	var next = $("[name=answer]:checked").val();
	var option, url;
	if (next === "final") {
		url = "../summary.html"
		option = $("[name=answer]:checked").parent().find("span").html();
	}
	else
	{
		url = "question-" + (next<10?0:"") + next + ".html";
	}
	location.href = url + "?s=" + status + (next==="final"?encodeURI("&detail=" + option):"");
}