<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- datetimepicker -->
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<title></title>
</head>
<body>
<c:set var="menu" value="rest"/>
<div class="container my-3">
	<main>
		<div class="row mb-3" id="test">
			<div class="col">
				<div class="border p-2 bg-light d-flex justify-content-between">
				 <a class="navbar-brand" href="admin" style="font-size:25px; color:black; font-weight: bolder;">CINEMA BOX</a>
	                <span class="text-center"><strong>극장/시간 배정 정보</strong></span>
					<button class="btn btn-warning btn-sm" style="background-color:#ffc107;" id="insert-screening">극장/시간 배정</button>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light">
					<table class="table" id="table-movies">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="18%">
							<col width="10%">
							<col width="12%">
							<col width="10%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th>영화 번호</th>
								<th>상영 번호</th>
								<th>영화 제목</th>
								<th>극장 번호</th>
								<th>극장 이름</th>
								<th>상영관</th>
								<th>상영 시간</th>
								<th>좌석 현황</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty screens }">
									<tr>
										<td class="text-center" colspan="12">등록된 상영정보가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="screen" items="${screens }">
										<tr class="text-center">
											<td>${screen.movieNo }</td>
											<td>${screen.screeningNo }</td>
											<td>[${screen.title }]</td>
											<td>${screen.theaterNo }</td>
											<td>[${screen.theaterName }]</td>
											<td>${screen.hallName }</td>
											<td><strong><fmt:formatDate pattern="MM월 dd일 (E) HH시 mm분 " value="${screen.screeningDate }"/></strong></td>
											<td><span style="color:blue; font-weight:bold">${screen.remainingSeats }</span>/70</td>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<div class="modal fade" id="form-movie-modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalLabel">극장/시간 배정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					 <form id="form-movie">
						<div class="row px-3 mb-3">
						<!-- 기본은 비활성화할 것 -->
							<label for="floatingInput">[영화번호]입력</label>
							 <input type="text" class="form-control" id="movie-no" name="movieNo" value="${param.movieNo }" readonly/>
						</div>
						<div class="row px-3 mb-3">
							<c:if test="${!empty theaters }">
								<label for="floatingInput">[극장번호]입력</label>
								<select name="theaterNo" id="movie-theaterNo">
									<c:forEach var="theater" items="${theaters }">
										<option value="${theater.theaterNo}">[${theater.theaterNo}], [${theater.theaterName}]</option> 
									</c:forEach>
								</select>
							</c:if>	
						</div>
						<div class="row px-3 mb-3">
							<c:if test="${!empty halls }">
								<label for="floatingInput">[상영관번호]입력</label>
								<select name="hallNo" id="movie-hallNo">	
									<c:forEach var="hall" items="${halls }">
								 		<option value="${hall.hallNo}">${hall.hallName}</option> 
								 	</c:forEach>
								</select>
							</c:if>
						</div>
						<div class="row px-3 mb-3">
							<label for="floatingInput">[날짜/시간]입력</label>
							<input type="text" class="form-control" id="screening-date" name="screeningDate">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-warning" id="insert-screen">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>	
<script>
$(function() {
	// datetimepicker 사용
	$('#screening-date').appendDtpicker({'locale':'ko'});
	
	var movieModal = new bootstrap.Modal(document.getElementById("form-movie-modal"), {
		keyboard: false
	})
		
	// 배정 버튼을 클릭했을 때 실행된다.
	$("#test .btn-warning").click(function() {
		$("#movie-theaterNo").val("");
		$("#movie-hallNo").val("");
		$("#screening-date").val("");
		movieModal.show();
	});	
	
	// 배정모달창에서 등록 버튼을 클릭했을 때 실행된다.
	$("#insert-screen").click(function() {
		var theaterNo = $.trim($("#movie-theaterNo").val());
		if (theaterNo < 10001) {
			alert("극장 번호는 10001이상이여야 합니다.");
			$("#movie-theaterNo").focus();
			return false;
		} 
		$.ajax({
		    type : "POST",
		    url : "insertScreen",
			data : {movieNo:$("#movie-no").val(), theaterNo:$("#movie-theaterNo").val(), hallNo:$("#movie-hallNo").val(),
					screeningDate:$("#screening-date").val()+":00"}, 
		    dataType: 'json',
		    error : function(error) {
		        alert("Error!");
		    },
		    success : function(data) {
		        alert("영화 배정이 완료되었습니다.");
		        location.reload();
		    }
		});
	})
})
</script>
</body>
</html>