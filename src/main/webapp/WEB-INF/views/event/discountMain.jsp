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
<title>제휴할인</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #ecbd35; text-decoration: none;}
 
 .event{
 	width: 200px;
    float: left;
    height: 200px;
    margin: 0 100px 50px;
    object-fit: cover;
    
 }
</style>
</head>
<body class="body">
<div class="container-fluid">
	<%@ include file="../common/header.jsp"%>
	
	<div class="top" style="margin-left:150px;  margin-top:50px;">
	<h3 >제휴할인</h3>
	</div>

	<div class="row mb-3" style="padding:60px">
	
	<ul class="list-group list-group-horizontal" style="list-style: none; display: block;">
	
	<li class="event"><a href="discountDetail?no=1"><img src="https://caching.lottecinema.co.kr//Media/Event/a15ba6381df34e69882d1eed8d3bfdd1.jpg" alt="카카오뱅크 체크카드 프로모션 시즌9">
	<div class="date">2021.08.16~2021.12.28</div></a></li>
	<li class="event"><a href="discountDetail?no=2"><img src="https://caching.lottecinema.co.kr//Media/Event/675d5d25663d45f296c57fd03ebbeb30.jpg" alt="계속되는 금,토 현대 5,000M포인트 사용 프로모션!">
	<div class="date">2021.08.02~2021.11.11</div></a></li>
	<li class="event"><a href="discountDetail?no=3"><img src="https://caching.lottecinema.co.kr//Media/Event/45fc4006fa7b477285939b6be7d9f1ab.jpg" alt="2021 SKT T멤버십 혜택">
	<div class="date">2021.07.20~2021.10.21</div></a></li>
	<li class="event"><a href="discountDetail?no=4"><img src="https://caching.lottecinema.co.kr//Media/Event/5ac65b0310724e66a89adca5422e3c91.jpg" alt="OK캐쉬백(2021)">
	<div class="date">2021.06.10~2021.09.30</div></a></li>
	
	</ul>

	</div>
	
	<%@ include file="../common/footer.jsp"%>
</div>
<script type="text/javascript">


</script>
</body>
</html>