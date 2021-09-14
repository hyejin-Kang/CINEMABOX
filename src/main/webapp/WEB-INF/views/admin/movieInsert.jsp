<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>영화 정보 추가</title>
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
                <form id="insert" method="post" action="insert" enctype="multipart/form-data">
                    <div class="row">
                    <a class="navbar-brand" href="admin" style="font-size:25px; color:black; font-weight: bolder;">CINEMA BOX</a>
                        <span class="border-bottom border-1 border-dark"><strong>영화 정보 추가</strong></span>
                        <div class="col-12">
                        <br/>
                        <div class="row px-2 mb-2 bordered">
	                        <div class="form-check">
	                        	※ 영화 장르 선택<br>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="액션" checked="checked">
	                              <label class="form-check-label">액션</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="스릴러">
	                              <label class="form-check-label">스릴러</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="공포(호러)">
	                              <label class="form-check-label">공포(호러)</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="범죄">
	                              <label class="form-check-label">범죄</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="코미디">
	                              <label class="form-check-label">코미디</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="멜로/로맨스">
	                              <label class="form-check-label">멜로/로맨스</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="어드벤처">
	                              <label class="form-check-label">어드벤처</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="미스터리">
	                              <label class="form-check-label">미스터리</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="SF">
	                              <label class="form-check-label">SF</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="애니메이션">
	                              <label class="form-check-label">애니메이션</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="다큐멘터리">
	                              <label class="form-check-label">다큐멘터리</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="판타지">
	                              <label class="form-check-label">판타지</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="기타">
	                              <label class="form-check-label">기타</label>
	                           </div>
	                        </div>
                    	 </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="title" placeholder="영화 제목" name="title">
                                <label for="floatingInput">영화 제목</label>
                            </div>
                            <div class="form-floating mb-3">
                            <!-- 숫자만 적을수 있게함 -->
                               <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" 
								class="form-control" id="runningTime" placeholder="영화 러닝타임(분)" name="runningTime" />
                                <label for="floatingInput">영화 러닝타임(분)</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="director" placeholder="감독" name="director">
                                <label for="floatingInput">감독</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="casting" placeholder="배우" name="casting">
                                <label for="floatingInput">배우</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="date" class="form-control" id="release_date" placeholder="개봉일" name="releaseDate">
                                <label for="floatingInput">개봉일</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="date" class="form-control" id="close_date" placeholder="마감일" name="closeDate">
                                <label for="floatingInput">마감일</label>
                            </div>
	  						<div class="form-floating mb-3">
		                        <div class="form-check">
		                            	※ 관람가<br>
		                           <div class="form-check form-check-inline">
		                              <input class="form-check-input" type="radio" name="age" value="ALL" checked="checked">
		                              <label class="form-check-label">전체</label>
		                           </div>
		                           <div class="form-check form-check-inline">
		                              <input class="form-check-input" type="radio" name="age" value="12">
		                              <label class="form-check-label">12세+</label>
		                           </div>
		                           <div class="form-check form-check-inline">
		                              <input class="form-check-input" type="radio" name="age" value="15">
		                              <label class="form-check-label">15세+</label>
		                           </div>
		                           <div class="form-check form-check-inline">
		                              <input class="form-check-input" type="radio" name="age" value="19">
		                              <label class="form-check-label">19세+</label>
		                           </div>
		                        </div>
	                        </div>
                            <h3>대표 이미지</h3> 
                            <div id="image_container" class="form-control">
                           		 <input type="file" class="form-control" id="thumbnail" name="file">
                            </div>
                        </div>                                                                                  
                    </div>                    
                    <div class="row">
                        <div class="col-12">                        
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="synopsis" placeholder="영화 줄거리" style="height: 200px;" name="synopsis"></textarea>
                                <label for="floatingTextarea">영화 줄거리</label>
                            </div>
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="trailerFirst" id="trailerFirst" placeholder="트레일러 영상 첫번째" style="height: 50px;" name="trailerFirst"></textarea>
                                <label for="floatingTextarea">트레일러 영상 첫번째</label>
                            </div>
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="trailerSecond" id="trailerSecond" placeholder="트레일러 영상 두번째" style="height: 50px;" name="trailerSecond"></textarea>
                                <label for="floatingTextarea">트레일러 영상 두번째</label>
                            </div>
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
	$("#insert").submit(function() {
		if (!$("input:checked[id='genre']").is(":checked")){
			alert("장르를 선택해주세요."); 
			$("#genre").focus();
			return false; 
		}
		var name = $.trim($("#title").val());
		if (!title) {
			alert("영화 제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		var runningTime = $.trim($("#runningTime").val());
		if (!runningTime) {
			alert("러닝 타임을 입력해주세요.");
			$("#runningTime").focus();
			return false;
		}
		var director = $.trim($("#director").val());
		if (!director) {
			alert("감독을 입력해주세요.");
			$("#director").focus();
			return false;
		}
		var casting = $.trim($("#casting").val());
		if (!casting) {
			alert("배우를 입력해주세요.");
			$("#casting").focus();
			return false;
		}
		var releaseDate = $.trim($("#release_date").val());
		if (!releaseDate) {
			alert("개봉일을 입력해주세요.");
			$("#release_date").focus();
			return false;
		}
		var closeDate = $.trim($("#close_date").val());
		if (!closeDate) {
			alert("마감일을 입력해주세요.");
			$("#close_date").focus();
			return false;
		}
		
		if (releaseDate > closeDate){
			alert("마감일은 개봉일보다 뒤여야 합니다.");
			$("#close_date").focus();
			return false;
		}
		
		var age = document.querySelectorAll("input[name='age']");// 검색된 엘리먼트 전부를 배열에 담아서 반환
		var isChecked = false;		
		for (var i=0; i<age.length; i++) {
			var ageno = age[i];
			if (ageno.checked) {
				isChecked = true;
				break;
			}
		}
		if (!isChecked) {
			alert("관람가를 선택해주세요");
			age[0].focus();
			return false;
		}
		var synopsis = $.trim($("#synopsis").val());
		if (!synopsis) {
			alert("줄거리를 입력해주세요.");
			$("#synopsis").focus();
			return false;
		}
		return true;	// 폼입력값이 서버로 제출되게 함
	});
})
</script>
</body>
</html>