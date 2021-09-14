<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>삭제된 영화 정보</title>
</head>
<body>
<c:set var="menu" value="movie"/>
<div class="container my-3">
	<main>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light d-flex justify-content-between">
					 <a class="navbar-brand" href="admin" style="font-size:25px; color:black; font-weight: bolder;">CINEMA BOX</a>
					 <a class="text-center" href="deleteList" style="font-size:25px; color:black; font-weight: bolder;">삭제된 영화 정보</a>
					<a class="btn btn-warning btn-sm" href="admin">관리자 메인</a>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light">
					<table class="table" id="table-movies">
						<colgroup>
							<col width="5%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
							<col width="*">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th>번호</th>
								<th>제목</th>
								<th>장르</th>
								<th>러닝타임</th>
								<th>감독</th>
								<th>배우</th>
								<th>관람가</th>
								<th>개봉일</th>
								<th>마감일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="movie" items="${delteMovies }">
							<c:choose>
								<c:when test="${empty movie}">
									<tr>
										<td class="text-center" colspan="12">삭제된 영화정보가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
										<tr class="text-center">
											<td>${movie.no }</td>
											<td>${movie.title }</td>
											<td>${movie.genre }</td>
											<td>${movie.runningTime }분</td>
											<td>${movie.director }</td>
											<td>${movie.casting }</td>
											<td>${movie.age }</td>
											<td><fmt:formatDate value="${movie.releaseDate }" /></td>
											<td><fmt:formatDate value="${movie.closeDate }" /></td>
											<td>
												<button class="btn btn-primary btn-sm" data-movie-no="${movie.no }">복구</button>
											</td>
										</tr>
								</c:otherwise>
							</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
</div>	
<script>
$(function() {
	$("#table-movies .btn-primary").click(function() {
		$.ajax({
			type: "GET",
			url: "recovery",	// 복구기능
			data: {movieNo: $(this).data("movie-no")},
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
			    alert("복구되었습니다.");
			},
		    complete : function() {
		        alert("영화 정보 페이지로 돌아갑니다."); 
		        location.href="movieList";
		    }
		});
	});
})
</script>
</body>
</html>