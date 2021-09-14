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
<title>문의 정보 등록</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #ecbd35; text-decoration: underline;}
</style>
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>
  <body class="text-center">

<div class="container-fluid">
	<%@ include file="../common/header.jsp"%>
	<div class="row mb-3" style="padding:80px">
	<div class="col-2" style="margin-right: 120px;">
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
			<div class="col-6">
			<main class="form-signin">
	  <form id="question-form" name="userInfo" method="post" action="../customerCenter/list">
	    <h6 class="h6 mb-3 fw-normal">문의할 때 입력했던 이름과 메일을 입력해 주세요.<br> 답변은 메일로도 받아 보실 수 있습니다.</h6>
	
		<div class="mb-3">
		    <div class="form-floating mb-2">
		      <input type="text" class="form-control" id="name" placeholder="name" name="name">
		      <label for="floatingPassword">name</label>
		    </div>
		    <div class="form-floating">
		      <input type="email" class="form-control" id="email" placeholder="name@example.com" name="email">
		      <label for="floatingInput">Email address</label>
		    </div>
	    </div>
	    <div class="mb-3">
	     <button class="w-100 btn btn-lg btn-primary" type="submit" onclick="">조회하기</button>
	    </div>
	     <button class="w-100 btn btn-lg btn-warning" type="button" onclick="location.href='add'">문의하기</button>
	  </form>
	</main>
	</div>
</div>
	
	<%@ include file="../common/footer.jsp"%>
</div>
<script type="text/javascript">

$(function() {
	// 입력값 유효성 체크해서 아이디와 비밀번호가 전부 값이 입력되어 있을 때만 폼 입력값이 서버로 제출되게 하기
	$("#question-form").submit(function() {
		var name = $("#name").val();
		var email = $("#email").val();
		var questionCount = 0;
		if(name==""){
	        alert("이름을 입력해주세요.");
	        $("#name").focus();
	        return false;
	    }else if(email==""){
	        alert("메일을 입력해주세요.");
	        $("#email").focus();
	        return false;
	    }else{

			$.ajax({
				type: "POST",
				url: "/cinemabox/customerCenter/list/count",
				data: $("#question-form").serialize(),
				async:false,
				dataType: 'json',
				success: function(count) {
					questionCount = count;
				},
				complete: function() {
				}
			});
			if (questionCount>0){
				return true;
			}else{
				 alert("등록된 문의가 존재하지 않습니다.");
				 return false;
			}
	    }
		return false;
	});
})
</script>
</body>
</html>