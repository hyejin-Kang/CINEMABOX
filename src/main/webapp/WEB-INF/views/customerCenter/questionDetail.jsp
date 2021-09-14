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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>문의 상세조회</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #ecbd35; text-decoration: underline;}

.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}

</style>

</head>
<body>
<div class="container-fluid">
	<%@ include file="../common/header.jsp"%>
		<div class="top" style="margin-left:150px;  margin-top:50px;">
			<h3 >1:1문의</h3>
		</div>
		<div class="row mb-3" style="padding:80px">
			<div class="col-2">
				<table class="table">
					<tbody>
						<tr>
							<td><a href="../customerCenter/main">고객센터 메인</a></td>
						</tr>
						<tr>
							<td><a href="../notice/list">공지사항</a></td>
						</tr>
						<tr>
							<td><a href="../customerCenter/userInfo">1:1 문의</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-9">
				<table class="table mb-3" style="margin:auto">
					<colgroup>
						<col width="*">
						<col width="25%">
					</colgroup>
					<thead style="background: #fbe5a5">
						<tr >
							<th>${questionDetail.questionTitle }</th>
							<th>등록일<span><fmt:formatDate value="${questionDetail.questionDate }" pattern="yyyy.MM.dd"/></span></th>
						</tr>
					</thead>
					<tbody>
						<tr class="content">
							<td colspan="3" style="padding:35px;">${questionDetail.questionContent }</td>	
						</tr>
					</tbody>
				</table>
				<div style="text-align: right;" class="mb-3">
					<button type="button" class="btn btn-warning" onclick="del(${questionDetail.questionNo})">삭제</button>
					<button type="button" class="btn btn-warning" onclick="location.href='addAnswer?questionNo=${questionDetail.questionNo }'">답글</button>	
				</div>
				<div class="mb-5">
					<h5>답글</h5>
					<h6 class="text-end">답변일:<fmt:formatDate value="${questionDetail.answerDate }" pattern="yyyy.MM.dd"/></h6>
					<ul class="list-group">
						<li class="list-group-item flex-fill" style="padding:35px;">${questionDetail.answerContent }</li>
					</ul>
				</div>
				<form action="" class="review" id="satisfaction"> 
		            <h5>만족도</h5>
		            <div class="star-rating space-x-4 mx-auto">
		           		<input type="hidden" id="satisfaction1" name="satisfaction1" value="${questionDetail.satisfaction}"/> 
		           		<input type="hidden" name=“questionNo” id="“questionNo" value="${questionDetail.questionNo}"/>
						<input type="radio" id="5-stars" name="rating" value="5" />
						<label for="5-stars" class="star pr-4">★</label>
						<input type="radio" id="4-stars" name="rating" value="4" />
						<label for="4-stars" class="star">★</label>
						<input type="radio" id="3-stars" name="rating" value="3" />
						<label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="rating" value="2" />
						<label for="2-stars" class="star">★</label>
						<input type="radio" id="1-star" name="rating" value="1"  />
						<label for="1-star" class="star">★</label>
					</div>
						<button type="button" id="btn1" class="btn btn-warning btn-sm" style="float: right;" onclick="satisfaction()">완료</button>
				</form>
			</div>			
		</div>
	<%@ include file="../common/footer.jsp"%>
</div>
<script type="text/javascript">
window.onload = function(){
	var satisfaction = $('#satisfaction1').val();
	$("input:radio[name='rating']:radio[value="+satisfaction+"]").prop('checked', true);

}

function del(questionNo) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		//location.href= 'list';
		location.href='delete?questionNo='+questionNo;
	}
}	

function satisfaction(){
	var radioValue = $('input:radio[name=rating]:checked').val();
	var questionNo = ${questionDetail.questionNo};
	var ajaxData = {satisfaction:radioValue,questionNo:questionNo};

		$.ajax({
			type: "POST",
			url: "../question/satisfaction",
			data:ajaxData,
			async:false,
			dataType: 'json',
			success: function(count) {
				questionCount = count;
			},
			complete: function() {
				alert("감사합니다~^^");
				
			}
			
		});
}
/* $(function() {
	 $("#satisfaction").submit(function() {
		
 		var star = (
		$("#1-star").val() = 1;
		$("#2-stars").val() = 2;
		$("#3-stars").val() = 3;
		$("#4-stars").val() = 4;
		$("#5-stars").val() = 5;
		);
		 
		$.ajax({
			type: "POST",
			url: "/question/satisfaction",
			data: star,
			async:false,
			dataType: 'json',
			success: function(count) {
				questionCount = count;
			},
			complete: function() {
				alert("감사합니다~^^");
			}
		});
	}) 
}) */


</script>
</body>
</html>