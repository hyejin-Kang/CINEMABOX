<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>SNACK 정보 추가</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
</head>
<body>
   <div class="container">
        <main>
            <div class="container">
                <form id="insertSnack" method="post" action="insertSnack" enctype="multipart/form-data">
                    <div class="row">
                    <a class="navbar-brand" href="admin" style="font-size:25px; color:black; font-weight: bolder;">CINEMA BOX</a>
                        <span class="border-bottom border-1 border-dark"><strong>[SNACK] 정보 추가</strong></span>
                        <div class="col-12">
                        <br/>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="name" placeholder="이름" name="name">
                                <label for="floatingInput">이름</label>
                            </div>
                            <div class="form-floating mb-3">
                            <!-- 숫자만 적을수 있게함 -->
                               <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" 
								class="form-control" id="price" placeholder="가격(원)" name="price" />
                                <label for="floatingInput">가격(원)</label>
                            </div>
                             <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="detail" placeholder="정보" name="detail">
                                <label for="floatingInput">정보</label>
                            </div>
                            <h3>대표 이미지</h3> 
                            <div id="image_container" class="form-control">
                           		 <input type="file" class="form-control" id="thumbnail" name="file">
                            </div>
                            <br>
                            <div class="d-flex justify-content-end">
                               <button type="submit" class="btn btn-primary">등록</button>
                            </div>
                        </div>                                                                                  
                    </div>                    
                </form>
            </div>            
        </main>
    </div>
<script> 
// 입력필드 유효성 체크
$(function() {
	$("#insertSnack").submit(function() {
		var name = $.trim($("#name").val());
		if (!name) {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		var price = $.trim($("#price").val());
		if (!price) {
			alert("가격을 입력해주세요.");
			$("#price").focus();
			return false;
		}
		var detail = $.trim($("#detail").val());
		if (!detail) {
			alert("정보를 입력해주세요.");
			$("#detail").focus();
			return false;
		}
		return true;	// 폼입력값이 서버로 제출되게 함
	});
})
</script>
</body>
</html>