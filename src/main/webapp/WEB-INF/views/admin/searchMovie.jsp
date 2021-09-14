<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- datetimepicker -->
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<title>영화 상영 정보</title>
	<style type="text/css">
		#info .btn-outline-info { 
			top : 5px; 
			position: relative;
		}
		#info .btn-secondary {
			color: #ffc107 !important;
			border-color: #ffc107 !important;
		}
		
		#info .btn-secondary {
			color: #fff !important;
			border-color: #ffc107 !important;
			background-color: skyblue; !important;
		} 
	</style>
</head>
<body>
<c:set var="menu" value="movies"/>
<div class="container my-3">
	<main>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light d-flex justify-content-between">
					<a class="navbar-brand" href="admin" style="font-size:25px; color:black; font-weight: bolder;">CINEMA BOX</a>
					<a class="text-center" href="movieList" style="text-align : center; font-size:25px; color:black; font-weight: bolder;">영화 상영 정보</a>
					<a class="btn btn-warning btn-sm" href="deleteList">삭제 영화목록</a>
				</div>
			</div>
		</div>
		<div class="row mb-3" id="outter">
			<div class="col">
				<div class="border p-2 bg-light">
					<table class="table" id="table-movies">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th>번호</th>
								<th>제목</th>
								<th>장르</th>
								<th>러닝타임</th>
								<th>관람가</th>
								<th>개봉일</th>
								<th>마감일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty movies }">
									<tr>
										<td class="text-center" colspan="12">등록된 상영정보가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="movie" items="${movies }">
										<tr class="text-center" id="info">
											<td>${movie.no }</td>
											<td id="trailerFirst-${movie.no }" style="display:none;">${movie.trailerFirst }</td>
											<td id="trailerSecond-${movie.no }" style="display:none;">${movie.trailerSecond }</td>
											<td id="director-${movie.no }" style="display:none;">${movie.director }</td>
											<td id="casting-${movie.no }" style="display:none;">${movie.casting }</td>
											<!-- 버튼 누르면 영화 개봉현황 페이지로 가게끔 -->
											<td><button id="detailTrailer-${movie.no }" class="btn btn-link btn-sm" data-movie-no="${movie.no }" >${movie.title }</button>
											</td>
											<td>${movie.genre }</td>
											<td>${movie.runningTime }분</td>
											<td>${movie.age }</td>
											<td><fmt:formatDate value="${movie.releaseDate }" /></td>
											<td><fmt:formatDate value="${movie.closeDate }" /></td>
											<td>
												<button class="btn btn-outline-danger btn-sm" data-movie-no="${movie.no }">삭제</button>
												<a href="movieModify?movieNo=${movie.no}" class="btn btn-outline-primary btn-sm">수정</a>
												<button class="btn btn-outline-warning btn-sm" data-movie-no="${movie.no }" id="insert-screening">배정</button>
												<a href="screening?movieNo=${movie.no}" class="btn btn-outline-info btn-sm">배정 현황</a>
											</td>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<c:if test="${paging.total gt 0 }">
			<div class="row mb-2">
				<div class="col-12">
					<ul class="pagination justify-content-center">
						<li class="page-item ${paging.nowPage le 1 ? 'disabled' : ''}">
							<a class="page-link" href="movieList?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage}">이전</a>
						</li>
						<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
							<li class="page-item ${paging.nowPage eq num ? 'active' : '' }">
								<a class="page-link" href="movieList?nowPage=${num }&cntPerPage=${paging.cntPerPage}">${num }</a>
							</li>
						</c:forEach>
						<li class="page-item ${paging.nowPage eq paging.endPage ? 'disabled' : ''}">
							<a class="page-link" href="movieList?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage}">다음</a>
						</li>
					</ul>
				</div>
			</div>
		</c:if>	
	</main>
	<div class="modal fade" id="trailer-movie-modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
	  	<div class="modal-dialog modal-xl">
	    	<div class="modal-content">
	     		<div class="modal-header">
	        		<h5 class="modal-title">영화 상세정보</h5>
	       			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	    	 		</div>
	      		<div class="modal-body" align="center">
	      			<table>
	      			</table>
	      				<div id="detailModal1">
	      				</div> 					
	      				<div id="detailModal2" style="padding-bottom: 15px;">
	      				</div>
	      				<div style="width:70%; border-top: 2px #000 solid; padding-bottom: 10px; padding-top: 10px; ">
	      					<strong>[감독]</strong>
	      				</div>
	      				<div id="detailModal3" style="padding-bottom: 10px;">
	      				</div>
	      				<div style="width:70%; border-top: 2px #000 solid; padding-bottom: 10px; padding-top: 10px;" >
	      					<strong>[출연 배우]</strong>
	      				</div>
	      				<div id="detailModal4">
	      				</div>	
	     	 	</div>
	    			<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
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
							<label for="floatingInput">상영 [영화번호]입력</label>
							 <input type="text" class="form-control" id="movie-no" name="movieNo" readonly/>
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
	var trailerModal = new bootstrap.Modal(document.getElementById("trailer-movie-modal"), {
		keyboard: false
	})
	
	// 제목 버튼을 클릭했을 때 실행된다.
	$("[id^=detailTrailer]").click(function() {
		var movieNo = $(this).data("movie-no")
		var trailer1 = $("#trailerFirst-"+ movieNo).html();
		var trailer2 = $("#trailerSecond-"+ movieNo).html();
		var director = $("#director-"+ movieNo).html();
		var casting = $("#casting-"+ movieNo).html();
		$('#detailModal1').html(trailer1);
		$('#detailModal2').html(trailer2);
		$('#detailModal3').html(director);
		$('#detailModal4').html(casting);
		trailerModal.show();
	});	
	
	//Trailer 닫기버튼 시 재생 종료 시키기
	$(".btn-secondary").click(function(){
	      location.reload();
	})
	
	// 배정 버튼을 클릭했을 때 실행된다.
	$("#table-movies .btn-outline-warning").click(function() {
		var movieNo = $(this).data("movie-no")
		$("#movie-no").val(movieNo)
		$("#movie-theaterNo").val("");
		$("#movie-hallNo").val("");
		$("#screening-date").val("");
		movieModal.show();
	});	
	
	// 배정모달창에서 등록 버튼을 클릭했을 때 실행된다.
	$("#insert-screen").click(function() {
		var theaterNo = $.trim($("#movie-theaterNo").val());
		if (!theaterNo) {
			alert("극장번호를 선택해주세요.");
			$("#movie-theaterNo").focus();
			return false;
		}
		var hallNo = $.trim($("#movie-hallNo").val());
		if (!hallNo) {
			alert("상영관번호를 선택해주세요.");
			$("#movie-hallNo").focus();
			return false;
		}
		var screeningDate = $.trim($("#screening-date").val());
		if (!screeningDate) {
			alert("날짜를 선택해주세요.");
			$("#screening-date").focus();
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
		    },
		    complete : function() {
		        alert("영화 배정정보 화면으로 이동합니다.");  
		        location.href="screening?movieNo=" + $("#movie-no").val();
		    }
		});
	})
	
	$("#table-movies .btn-outline-danger").click(function() {
		$.ajax({
			type: "GET",
			url: "delete",	// 삭제기능
			data: {movieNo: $(this).data("movie-no")},
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
			    alert("삭제되었습니다.");
			},
		    complete : function() {
		        alert("영화 삭제 페이지로 이동합니다."); 
		        location.href="deleteList";
		    }
		});
	});
})
</script>
</body>
</html>