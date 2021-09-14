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
<title>공지사항 등록</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #ecbd35; text-decoration: underline;}
</style>
</head>
<body>
<div class="container">
	<%@ include file="../common/header.jsp"%>
		<div class="top" style="margin-left:150px;  margin-top:50px;">
			<h3 >공지사항</h3>
		</div>
		<form id="notice-form" name="insertForm" method="get" action="../notice/insert">
			<div style="padding:80px">
				<div class="mb-3">
		 			<label for="exampleFormControlInput1" class="form-label">제목</label>
		  			<input type="text" class="form-control" id="title" name="title">
				</div>
				<div class="mb-3">
				  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
				  <textarea class="form-control" id="content" name ="content" rows="3"></textarea>
				</div>
				<div style="text-align: right;">
					<button type="submit" id="insertBt" class="btn btn-warning"  onclick="checkForm()">등록</button>
				</div>	
			</div>
		</form>
	<%@ include file="../common/footer.jsp"%>	
</div>

<script type="text/javascript">
function checkForm() {
	
	var title = document.insertForm.title;
	var content = document.insertForm.content;
	var important = document.insertForm.important;
	
	if(title.value==""){
        alert("제목을 입력해주세요.");
        title.focus();
        return false;
    }else if(content.value==""){
        alert("내용을 입력해주세요.");
        content.focus();
        return false;

    }else{
        alert("글이 등록됩니다!");
        return true;
    }
	
	return true;
	
}

</script>
</body>
</html>