console.log("Freeboard Reply");

var freeReplyService = (function() {

	function add(reply, callback, error) {
		console.log("add reply...........");
		console.log(reply);
		
		$.ajax({
			type : 'POST',
			url : '/freply/new',
			data : JSON.stringify(reply),
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
	
	function getList(param, callback, error) {
		var fno = param.fno;
		var page = param.page || 1;
		
		$.getJSON("/freply/pages/" + fno + "/" + page + ".json",
			function(data) {
			if (callback)
				callback(data);
		}).fail(function(xhr, status, err) {
			if (error)
				error();
		});
	}
	
	function remove(frno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/freply/' + frno,
			success : function(deleteResult, status, xhr) {
				if (callback)
					callback(deleteResult);
			},
			error : function(xhr, status, er) {
				if (error)
					error(er);
			}
		});
	}
	
	function update(reply, callback, error) {
		
		console.log("FRNO: " + reply.frno);
		
		$.ajax({
			type : 'PUT',
			url : '/freply/' + reply.frno,
			data : JSON.stringify(reply),
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
	
	function get(frno, callback, error) {
		
		$.get("/freply/" + frno + ".json", function(result) {
			if (callback)
				callback(result)
		}).fail(function(xhr, status, err) {
			if (error)
				error();
		});
	}
	
	function displayTime(timeValue) {
		let today = new Date();
		let gap = today.getTime() - timeValue;
		let dateObj = new Date(timeValue);
		
		let str = "";
		
		
		if (gap < (1000 * 60 * 24)) {
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ].join('');
		} else {
			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth() + 1;
			let dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};

})();