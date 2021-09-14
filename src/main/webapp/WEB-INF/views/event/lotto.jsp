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
<title>이벤트 상세</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #ecbd35; text-decoration: none;}
 
 .event{
 	width: 200px;
    float: left;
    height: 200px;
    margin: 0 35px 50px;
    object-fit: cover;
    
    
 }
	
	.winnerContainer {
   		height:30px;
		overflow:hidden;
		width:100%;
	}
	.winnerList{
		list-style:none;
		animation: 7s linear 0s normal none infinite list;
	}
	
	.winnerListChild {
  		font-size:15px;
  		line-height:30px;
	}
	@-webkit-keyframes list {
		0%   {margin-top:0px;}
		15%  {margin-top:0px;}
		25%  {margin-top:-30px;}
		40%  {margin-top:-30px;}
		50%  {margin-top:-60px;}
		65%  {margin-top:-60px;}
		75%  {margin-top:-90px;}
		85%  {margin-top:-90px;}
		100% {margin-top:-120px;}
	}

</style>
</head>
<body class="body">
<div class="container-fluid">
	<%@ include file="../common/header.jsp"%>
	
	<div class="top" style="margin-left:150px;  margin-top:50px;">
	<h3 >이벤트</h3>
	</div>
	
	<div class="row mb-3" style="padding:60px; margin-left:150px;">
		<div class="col-5">
	<table style="margin-bottom:100px;">
		<thead>
			<tr>
				<th>3개의 선물상자 중 하나를 뽑아주세요~!!</th>
				<th>
					
				</th>
			</tr>
			<tr>
				<th>응모하기전 메일을 입력해주세요^^</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
		<tr>
			<td></td>
		</tr>	
		</tbody>
	</table>
	</div>
	<!-- 당첨 결과 -->
	<div class="col-6" style="text-align: end;">
			<div class="row mb-3">
				<div class="col-5"  >			
					<div style="text-align: end;"><strong><small>당첨 결과</small></strong></div>
				</div>
				<div class="col-7" style="text-align: initial;">
			<div class="winnerContainer">
				<ul class="winnerList">
					<c:forEach var="winner" items="${winnerList }">
						<li class="winnerListChild"><div class="d-flex justify-content-between"><span>${winner.email }</span>  <span style="color: darkviolet;">${winner.goods }</span></div></li>
					</c:forEach>
				</ul>
			</div>
			</div>
		</div>	
		
	</div>
	<!-- 선물상자 -->
	
	  <form id="lotto-form" name="lotto" method="post" action="lotto">
		<ul class="list-group list-group-horizontal" style="list-style: none; display: block; text-align: center; margin-left: 150px;">
			<li class="event"><img class="product_img" style="width: 150px; height: 150px;" src="../resources/images/event/gift.png" alt=""></li>
			<li class="event"><img class="product_img" style="width: 150px; height: 150px;" src="../resources/images/event/gift.png" alt=""></li>
			<li class="event"><img class="product_img" style="width: 150px; height: 150px;" src="../resources/images/event/gift.png" alt=""></li>
		</ul>
	</form>
		
			<div class="col-6">
			<label for="floatingInput">메일을 입력해 주세요</label>
				<input type="email" class="form-control" id="email" placeholder="name@example.com" name="email">
				
			</div>
			<div class="d-grid mx-auto col-3">
			<button type="button" class="btn btn-warning" id="insert-lotto">신청자 정보 등록</button>
			</div>
			<div class="modal fade" id="form-email-modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modalLabel">결과</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							 <h6  style="text-align: center;">두근두근:)</h6>
							<div  class="d-grid gap-2 col-6 mx-auto" style="text-align:center;">
								<ul class="list-group" style="text-align: center;">
									<li class="list-group-item flex-fill" id="goods" style="padding:30px; color: darkviolet;">결과가 표시됩니다!</li>
								</ul>
							</div>
						</div>
						
					</div>
				</div>
			</div>
							
			
																
			<div>
	</div>
</div>

	<%@ include file="../common/footer.jsp"%>
</div>
<script type="text/javascript">
$(function() {

	
	var emailModal = new bootstrap.Modal(document.getElementById("form-email-modal"), {
		keyboard: false
	})
	
	
	// 신청자 정보 등록 클릭 후 실행
	$("#insert-lotto").click(function() {
		if($("#email").val()== ""){
			alert("메일을 입력해주세요!");
			return;
		}else{
			alert("3개의 선물상자 중 원하는 것을 골라주세요");
			emailModal.hide();
		}
	})
	
	
	// 선물 이미지를 눌렀을때 실행된다.
	$(".product_img").click(function() {
		if($("#email").val()==""){ // 이메일이 없는 경우
			alert("신청자 정보 등록해주세요")
		}else{
			$.ajax({
			    type : "POST",
			    url : "/cinemabox/event/lotto/start",
				data : {email:$("#email").val()}, 
			    dataType: 'json',
			    success : function() {
			    	
			    },
				complete: function(productItem) {
					if(productItem.responseText == "existEmail"){
						alert("이미 응모한 아이디입니다.")
					}else{
						document.getElementById("goods").innerText = productItem.responseText;
						emailModal.show();
					}
				}
			});
		}
	});	
	
	// 이메일 입력, 선물 클릭 후 상품이 나옴 
/* 	$("#lotto-form").submit(function() {
			$.ajax({
				type: "POST",
				url: "/cinemabox/event/lotto/",
				data: $("#lotto-form").serialize(),
				async:false,
				dataType: 'json',
				success:function(){
					var ul ="<ul>"
					ul +="<li>"+productName.goods+"</li>"
					$("#goods").append(ul);
				}
				
			});
			
		}) */
	
})


</script>
</body>
</html>