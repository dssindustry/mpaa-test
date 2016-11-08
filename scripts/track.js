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
		$("[name=answer]").click(function() {
			if ($("#answer-yes").is(":checked")) {
				$("#summary").show("fast");
			}
			else
			{
				$("#summary").hide("fast");
			}
		});
	}
	
	if ($("#help")) {
		initHelp();
	}
});

function goNext() {
	if ($("#answer-yes").is(":checked")) {
		status = parseInt(status) + Math.pow(2, pageID - 1);
	}
	location.href = next + "?s=" + status;
}