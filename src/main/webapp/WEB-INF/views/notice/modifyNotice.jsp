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
<title>공지사항 수정</title>
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
			<h3 >공지사항</h3>
		</div>
		<div style="padding:80px">
			<form id="notice-form" name="update" action="../notice/newModify" method="post" onsubmit="return check()">
				<div class="mb-3">
				  <label for="exampleFormControlInput1" class="form-label">제목</label>
				  <input type="text" class="form-control" id="title" name="title" value="${noticeDetail.title }"/>
				</div>
				<div class="mb-3">
				  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
				  <input class="form-control" id="content" name ="content" value="${noticeDetail.content }"></input>
				  <input type="hidden" name="no" id="no" value="${noticeDetail.no }">
				</div>
				<div style="text-align: right;">
	                <input type=submit value="수정" onclick="checkForm()"/>
	                <input type=button value="목록" onclick="location.href='list'"/>
	            </div>
	   		</form>
		</div>
	<%@ include file="../common/footer.jsp"%>	
</div>
<script type="text/javascript">

function checkForm() {
     alert("글이 등록됩니다!");
    
	return true;
	
}

</script>
</body>
</html>