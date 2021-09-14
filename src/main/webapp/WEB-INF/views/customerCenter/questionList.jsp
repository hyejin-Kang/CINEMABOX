<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<title>문의 목록</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #ecbd35; text-decoration: underline;}
</style>
</head>
<body>
<div class="container-fluid">
	<%@ include file="../common/header.jsp"%>
		<div class="top" style="margin-left:150px;  margin-top:50px;">
			<h3>1:1문의</h3>
		</div>
		<div class="row mb-3" style="padding:55px; margin-left:50px;">
			<div class="col-2">
				<table class="table">
					<tbody>
						<tr>
							<td><a href="main">고객센터 메인</a></td>
						</tr>
						<tr>
							<td><a href="../notice/list">공지사항</a></td>
						</tr>
						<tr>
							<td><a href="userInfo">1:1 문의</a></td>
						</tr>
					</tbody>
			</table>
		</div>
		<div class="col-9">
			<div class="border p-2 bg-light">
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="*%">
						<col width="15">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr class="text-center">
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>상태</th>
							<th>만족도</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list }">
							<tr class="text-center">
								<td>${list.questionNo }</td>
								<td><a class="text-decoration-none" href="detail?no=${list.questionNo }">${list.questionTitle }</a></td>
								<td><fmt:formatDate value="${list.questionDate }" pattern="yyyy.MM.dd"/></td>
								<td>${list.state }</td>
								<td>${list.satisfaction }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>	
		</div>		
 	</div>	
	<%@ include file="../common/footer.jsp"%>		
</div>
</body>
</html>