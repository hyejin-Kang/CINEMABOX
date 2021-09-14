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
<title>고객센터</title>
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
			<h3>고객센터</h3>
		</div>
		<div class="row mb-3"  style="padding:25px; margin-right:15px; margin-left:15px; margin-bottom:20px;">
			<div class="col-2"  style="margin-right:60px; margin-left:50px; margin-top:20px;">		
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
			<div class="col-8">
				<div style="margin-bottom: 80px;">
					<h5 style="margin-bottom: 20px;">자주찾는서비스</h5>
						<ul class="list-group list-group-horizontal">
							<li class="list-group-item flex-fill text-center">
								<a href="../movie"><img src="../resources/images/customerCenter/theater.png"
									 alt="영화" width="53px"height="55px"  style="margin:15px"></a><div>영화</div></li>
							<li class="list-group-item flex-fill text-center">
								<a href="../ticket"><img src="../resources/images/customerCenter/reservationn.png"
									 alt="예매" width="53px"height="55px" style="margin:15px"></a><div>예매</div></li>
							<li class="list-group-item flex-fill text-center">
								<a href="../event/main"><img src="../resources/images/customerCenter/event.png"
									 alt="이벤트" width="53px"height="55px" style="margin:15px"></a><div>이벤트</div></li>
							<li class="list-group-item flex-fill text-center">
								<a href="userInfo"><img src="../resources/images/customerCenter/center.png"
									 alt="문의" width="53px"height="55px" style="margin:15px"></a><div>문의</div></li>
						</ul>	
				</div>	
					<div class="notice" style="margin-bottom: 35px;">
						<div class="mb-2">
							<button type="button" class="btn btn-outline-warning" style="color: #846e4d" onclick="location.href='../notice/list'">공지사항</button>
						</div>
						<table class="table">
							<colgroup>
								<col width="*">
								<col width="15%">
							</colgroup>
								<tbody>
									<c:forEach var="noticeList" items="${noticeList }">
									<tr>
										<td><a class="text-decoration-none" href="../notice/detail?no=${noticeList.no }">${noticeList.title }</a></td>
										<td><fmt:formatDate value="${noticeList.creatDate }" pattern="yyyy.MM.dd"/></td>
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