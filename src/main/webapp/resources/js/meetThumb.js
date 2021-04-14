console.log("Meet Module...........");

var meetService = (function(){
	

	function add(thumb, callback, error){
		console.log("add thumb............");
		
		$.ajax({
			type:'post',
			url : '/meet/thumb',
			data : JSON.stringify(thumb), //javascript값을 json문자열로 변환
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
	
	function remove(thumb, callback, error){
		console.log("delete thumb............");
		
		$.ajax({
			type:'delete',
			url : '/meet/removeThumb',
			data : JSON.stringify(thumb), //javascript값을 json문자열로 변환
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
	
	
	function getThumb(thumbno, callback, error){
		$.get("/meet/" + thumbno + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	

	return {

		add : add,
		remove : remove,
		getThumb : getThumb
		};
})();