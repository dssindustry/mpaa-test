var status = 0;

$(document).ready(function() {
	var param = getURLParameter("s");
	if (param != null) {
		status = parseInt(param);
	}
	var top = Math.ceil(Math.log2(status)) + 1;
	
	for (var i=0; i<top; i++) {
		var q = Math.pow(2, i);
		if ((status & q) != 0) {
			$("#row-" + (i+1)).show();
			$("#help-" + (i+1)).show();
		}
	}
	
	initHelp();
});