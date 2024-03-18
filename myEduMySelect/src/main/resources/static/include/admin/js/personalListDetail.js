$(function() {
	/* 삭제 버튼 클릭시 처리 이벤트 */
	$("#personalDeleteBtn").on("click", ()=>{
		if(!confirm("정말 삭제하시겠습니까?")) {
			return;
		} else {
			$("#f_data").attr({
			"method" : "post",
			"action" : "/adminBoard/personalDelete"	
			});
			$("#f_data").submit();
		}
	}); 
	
	/* 목록 버튼 클릭 시 처리 이벤트 */
	$("#personalListBtn").click(function() {
		location.href="/adminBoard/personal";
	});
});
