console.log("Report Freeboard");

let reportService = (function() {
	
	function reportObj(inquiry, callback, error) {
		console.log("reporting freeboard...");
		
		let badObj = inquiry.fno === null ? inquiry.frno : inquiry.fno;
		
		$.ajax({
			type : 'POST',
			url : '/inquiry/report/' + badObj,
			data : JSON.stringify(inquiry),
			contentType : "application/json; charset=UTF-8",
			success : function(result, status, xhr) {
				if (callback)
					callback(result);
			},
			error : function(xhr, status, er) {
				if (error)
					error(er);
			}
		});
	}
		
	return {
		reportObj : reportObj
	};
})();