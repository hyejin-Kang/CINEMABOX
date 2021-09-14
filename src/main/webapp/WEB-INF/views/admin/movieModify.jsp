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
                <form id="update" method="post" action="update" enctype="multipart/form-data">
                    <div class="row">
                    <a class="navbar-brand" href="admin" style="font-size:25px; color:black; font-weight: bolder;">CINEMA BOX</a>
                        <span class="border-bottom border-1 border-dark"><strong>${movie.title }</strong> 정보 수정</span>
                        <div class="col-12">
                        <br/>
                        <div class="form-floating mb-3">
                        	<input type="hidden" name="no" id="no" value="${movie.no }"/>
	                        <div class="form-check" id="genreCheck">
	                        	※ 영화 장르 선택<br>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="액션" ${movie.isExistGenre('액션') ? 'checked' : '' }>
	                              <label class="form-check-label">액션</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="스릴러" ${movie.isExistGenre('스릴러') ? 'checked' : '' }>
	                              <label class="form-check-label">스릴러</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="공포(호러)" ${movie.isExistGenre('공포') ? 'checked' : '' }>
	                              <label class="form-check-label">공포(호러)</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="범죄" ${movie.isExistGenre('범죄') ? 'checked' : '' }>
	                              <label class="form-check-label">범죄</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="코미디" ${movie.isExistGenre('코미디') ? 'checked' : '' }>
	                              <label class="form-check-label">코미디</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="멜로/로맨스" ${movie.isExistGenre('멜로') ? 'checked' : '' }>
	                              <label class="form-check-label">멜로/로맨스</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="어드벤처" ${movie.isExistGenre('어드벤처') ? 'checked' : '' }>
	                              <label class="form-check-label">어드벤처</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="미스터리" ${movie.isExistGenre('미스터리') ? 'checked' : '' }>
	                              <label class="form-check-label">미스터리</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="SF" ${movie.isExistGenre('SF') ? 'checked' : '' }>
	                              <label class="form-check-label">SF</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="애니메이션" ${movie.isExistGenre('애니메이션') ? 'checked' : '' }>
	                              <label class="form-check-label">애니메이션</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="다큐멘터리" ${movie.isExistGenre('다큐멘터리') ? 'checked' : '' }>
	                              <label class="form-check-label">다큐멘터리</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="판타지" ${movie.isExistGenre('판타지') ? 'checked' : '' }>
	                              <label class="form-check-label">판타지</label>
	                           </div>
	                           <div class="form-check form-check-inline">
	                              <input class="form-check-input" type="checkbox" id="genre" name="genre" value="기타" ${movie.isExistGenre('기타') ? 'checked' : '' }>
	                              <label class="form-check-label">기타</label>
	                           </div>
	                        </div>
                    	 </div>
<!--                                                                       ※ 영화 제목 -->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="title" placeholder="영화 제목" style="height: 60px;" name="title">${movie.title }</textarea>
                                <label for="floatingInput">영화 제목</label>
                            </div>
<!--                                                                       ※ 영화 러닝타임(분) -->
                            <div class="form-floating mb-3">
                            <!-- 숫자만 적을수 있게함 -->
								<textarea class="form-control" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" 
								id="runningTime" placeholder="영화 러닝타임(분)" style="height: 60px;" name="runningTime">${movie.runningTime }</textarea>
                                <label for="floatingInput">영화 러닝타임(분)</label>
                            </div>
<!--                                                                       ※ 감독 -->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="director" placeholder="감독" style="height: 60px;" name="director">${movie.director }</textarea>
                                <label for="floatingInput">감독</label>
                            </div>
<!--                                                                       ※ 배우 -->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="casting" placeholder="배우" style="height: 60px;" name="casting">${movie.casting }</textarea>
                                <label for="floatingInput">배우</label>
                            </div>
<!--                                                                       ※ 개봉일 -->
                            <div class="form-floating mb-3">
                                <input type="date" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${movie.releaseDate }"/>" id="release_date" placeholder="기존 개봉일 : <fmt:formatDate pattern="MM월 dd일 (E)" value="${movie.releaseDate }"/>" name="releaseDate">
                                <label for="floatingInput">기존 개봉일 : <fmt:formatDate pattern="MM월 dd일 (E)" value="${movie.releaseDate }"/></label>
                            </div>
<!--                                                                       ※ 마감일 -->
                            <div class="form-floating mb-3">
                                <input type="date" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${movie.closeDate }"/>" id="close_date" placeholder="기존 마감일 : <fmt:formatDate pattern="MM월 dd일 (E)" value="${movie.closeDate }"/>" name="closeDate">
                                <label for="floatingInput">기존 마감일 :<fmt:formatDate pattern="MM월 dd일 (E)" value="${movie.closeDate }"/></label>
                            </div>
	  						<div class="form-floating mb-3">
		                        <div class="form-check" id="ageCheck">
		                            	※ 관람가<br>
		                           <div class="form-check form-check-inline">
		                              <input class="form-check-input" type="radio" name="age" value="ALL" ${movie.age eq 'ALL' ? 'checked' : ''}>
		                              <label class="form-check-label">전체</label>
		                           </div>
		                           <div class="form-check form-check-inline">
		                              <input class="form-check-input" type="radio" name="age" value="12" ${movie.age eq '12' ? 'checked' : ''}>
		                              <label class="form-check-label">12세+</label>
		                           </div>
		                           <div class="form-check form-check-inline">
		                              <input class="form-check-input" type="radio" name="age" value="15" ${movie.age eq '15' ? 'checked' : ''}>
		                              <label class="form-check-label">15세+</label>
		                           </div>
		                           <div class="form-check form-check-inline">
		                              <input class="form-check-input" type="radio" name="age" value="19" ${movie.age eq '19' ? 'checked' : ''}>
		                              <label class="form-check-label">19세+</label>
		                           </div>
		                        </div>
	                        </div>
                            <h3>대표 이미지</h3> 
                            <div id="image_container" class="form-control">
                           		 <input type="file" class="form-control" id="thumbnail" name="file" >
                            </div>
                        </div>                                                                                  
                    </div>                    
                    <div class="row">
                        <div class="col-12">                        
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="synopsis" placeholder="영화 줄거리" style="height: 200px;" name="synopsis">${movie.synopsis }</textarea>
                                <label for="floatingTextarea">영화 줄거리</label>
                            </div>
                                                                      ※ 트레일러 영상 첫번째
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="trailerFirst" id="trailerFirst" placeholder="트레일러 영상 첫번째" style="height: 80px;" name="trailerFirst">${movie.trailerFirst }</textarea>
                                <label for="floatingTextarea">트레일러 영상 첫번째</label>
                            </div>
                                                                      ※ 트레일러 영상 두번째
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="trailerSecond" id="trailerSecond" placeholder="트레일러 영상 두번째" style="height: 80px;" name="trailerSecond">${movie.trailerSecond }</textarea>
                                <label for="Textarea">트레일러 영상 두번째</label>
                            </div>
                            <div class="d-flex justify-content-end">
                               <button type="submit" class="btn btn-primary">수정</button>
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
	$("#update").submit(function() {
		if (!$("input:checked[id='genre']").is(":checked")){
			alert("장르를 선택해주세요."); 
			$("#genre").focus();
			return false; 
		}
		var name = $.trim($("#title").val());
		if (!title) {
			alert("영화 제목을 입력해주세요.");
			$("#name").focus();
			return false;
		}
// 		var name = $.trim($("#thumbnail").val());
// 		if (!thumbnail) {
// 			alert("썸네일 사진을 업로드해주세요.");
// 			$("#thumbnail").focus();
// 			return false;
// 		}
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