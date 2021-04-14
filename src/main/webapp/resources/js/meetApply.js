console.log("MeetApply Module...........");

var meetApply = (function(){
	

	function add(apply, callback, error){
		console.log("add EnrollList............");
		
		$.ajax({
			type:'post',
			url : '/meet/apply',
			data : JSON.stringify(apply), //javascript값을 json문자열로 변환
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				
				if(error){
					error(er);
				}
			}
			
		});
	}
	
	function applyGet(eno, callback, error){
		$.get("/meet/mApply/" + eno + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, er){
			if(error){
				error(er);
			}
		});
	}
	
	
	function removeApply(eno, callback, error){
		console.log("delete eno............");
		
		$.ajax({
			type:'delete',
			url : '/meet/removeApply',
			data : JSON.stringify(eno), //javascript값을 json문자열로 변환
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				
				alert("삭제하려다 오류남!");
				if(error){
					error(er);
				}
			}
			
		});
	}
	

	return {

		add : add,
		applyGet : applyGet,
		removeApply : removeApply
		};
})();