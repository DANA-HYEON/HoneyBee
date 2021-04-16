var freeService = (function() {
	
	function thumbUp(free, callback, error) {
		console.log("Freeboard Thumb Up");
		
		$.ajax({
			type : 'POST',
			url : '/free/' + free.fno,
			data : JSON.stringify(free),
			contentType : 'application/json; charset=UTF-8',
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
	
	function replyThumbUp(reply, callback, error) {
		console.log("Free Reply Thumb Up")
		
		$.ajax({
			type : 'POST',
			url : '/freply/' + reply.frno,
			data : JSON.stringify(reply),
			contentType : 'application/json; charset=UTF-8',
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
		thumbUp : thumbUp,
		replyThumbUp : replyThumbUp
	};
	
})();