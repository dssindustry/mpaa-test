var status = 0;

$(document).ready(function() {
	var param = getURLParameter("s");
	if (param != null) {
		status = parseInt(param);
	}
	
	if ($("#summary")) {
		$("[id$=-yes]:checked").map(function() {
			var questionID = $(this)[0].id.split('-')[0].substr(6);
			$("#summary-" + questionID).show("fast");
		});
		if (AllRadiosSelected()) {
			$("#btnContinue").removeAttr("disabled");
		}
		$("[name^=answer]").click(function() {
			if (AllRadiosSelected())
				$("#btnContinue").removeAttr("disabled");
			var questionID = $(this)[0].id.split('-')[0].substr(6);
			if ($(this)[0].id.indexOf("-yes") > 0) {
				$("#summary-" + questionID).show("fast");
			}
			else
			{
				$("#summary-" + questionID).hide("fast");
			}
		});
	}
	
	if ($("#help").length) {
		initHelp();
	}
});
function AllRadiosSelected() {
	var radios = $("[name^=answer]");
	var names = $.unique(radios.map(function() {
		return this.name;
	}));
	var checked = radios.filter(function() {
		return this.checked;
	});
	return (names.length == checked.length);
}

function goNext() {
	$("[id$=-yes]:checked").map(function() {
		var questionID = $(this)[0].id.split('-')[0].substr(6);
		status = parseInt(status) + Math.pow(2, questionID - 1);
	});
	if (next === "final") {
		next = "../summary.html"
	}
	else
	{
		next = "question-" + (next<10?0:"") + next + ".html";
	}
	location.href = next + "?s=" + status;
}