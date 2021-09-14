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

<title>TITLE</title>
	<style type="text/css">
		#insert-purchase {
			color: #ffc107 !important;
			border-color: #ffc107 !important;
		}
		
		#insert-purchase:hover {
			color: #fff !important;
			border-color: #ffc107 !important;
			background-color: #ffc107 !important;
		}
		
		#num .btn-outline-success {
			color: #ffc107 !important;
			border-color: #ffc107 !important;
		}
		
		#num .btn-outline-success:hover {
			color: #fff !important;
			border-color: #ffc107 !important;
			background-color: #ffc107 !important;
		}
		
		.table #possible {
			color: #ffc107 !important;
			border-color: #ffc107 !important;
		}
		
		.table #possible:hover {
			color: #fff !important;
			border-color: #ffc107 !important;
			background-color: #ffc107 !important;
		}
		#detail #img {
			text-align: center;
		}
	</style>
</head>
<body>
<div class="container">
	<main>
	<%@include file="../common/header.jsp" %>
	<br>
	<br>
	<div class="row">
		<div class="col-12" id="detail" >
		<hr>
			<div class="d-flex justify-content-between">
				<div class="col-5" id="img">
				<br>
					<img src="/cinemabox/resources/images/gift/${giftInfo.giftNo}.jpg" alt="상품 대표이미지" class="img-thumbnail">
				</div>
				<div class="col-7 ps-5" style="border-left: 1px #e9e9e9 solid;">
					<input type="hidden" value="${giftInfo.giftNo}" id=giftNo>
					<div class="pt-2 pb-3" id="name">
						<p class="fs-3"><strong>[CINEMABAX]</strong><br>${giftInfo.name}</p>
					</div>
					<div class="pb-4">
						<strong>
							<c:choose>
								<c:when test="${giftInfo.discountPrice eq 0}">
									<span id="price" style="color: black; font-size: 20px" class="fs-3">
										<fmt:formatNumber type="number" maxFractionDigits="0" value="${giftInfo.price}" /></span> 원
								</c:when>
								<c:otherwise>
									<span id="price" style="color: black; font-size: 20px" class="fs-3">
										<fmt:formatNumber type="number" maxFractionDigits="0" value="${giftInfo.discountPrice}" /></span> 원
								</c:otherwise>
							</c:choose>
						</strong>
					</div>
					<div class="row mb-4 border-top border-bottom">
						<div class="col">
							<table class="table">
								<colgroup>
									<col width="30%"/>
									<col width="45%"/>
									<col width="25%"/>
								</colgroup>
								<tbody>
									<tr class="align-middle">
										<c:choose>
											<c:when test="${giftInfo.name eq '골드클래스 관람권'}">
												<th><span>사용가능극장</span></th>
												<td colspan="2"><span style="color:red; font-weight:bold">※ 코엑스, 분당, 성수, 킨텍스, 하남스타필드에서만 사용 가능</span></td>
											</c:when>
											<c:otherwise>
												<th><button type="button" class="btn btn-outline-success" id="possible">사용가능극장</button></th>
												<td colspan="2"><span style="color:red; font-weight:bold">※ 일부 특별관 및 특별석(발코니, 커플석, 로얄석 등)은 차액지불과 상관없이 사용 불가능합니다.</span></td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr class="align-middle">	
										<th>유효기간</th>
										<td colspan="2"><span>구매일로부터 2년 이내 사용 가능합니다.</span><br>
										<span class="txt min" style="color:gray;">예매 가능 유효기간은 구매일로부터 2년입니다.</span></td>
									</tr>
									<tr class="align-middle">	
										<th>판매수량</th>
										<td colspan="2"><span>1회 8개 구매가능</span></td>
									</tr>
									<tr class="align-middle">	
										<th>구매 후 취소</th>
										<td colspan="2"><span>구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</span></td>
									</tr>	
									<tr class="align-middle">
										<th>구매수량</th>
										<td>
											<div class="py-3 input-group" id="num">
												<button type="button" class="btn btn-outline-success btn-sm fa fa-minus"  id="decrease"></button>
												<button type="button" class="btn btn-outline btn-sm" id="number" disabled>1</button>
												<button type="button" class="btn btn-outline-success btn-sm fa fa-plus"  id="increase" ></button>
											</div>
										</td>
										<td>
											<c:choose>
												<c:when test="${giftInfo.discountPrice eq 0}">
													<input type="button" class="btn btn-outline fs-3" id="itemSum" value="<fmt:formatNumber type="number" maxFractionDigits="0" value="${giftInfo.price}" />" readonly> <strong>원</strong>
												</c:when>
												<c:otherwise>
													<input type="button" class="btn btn-outline fs-3" id="itemSum" value="<fmt:formatNumber type="number" maxFractionDigits="0" value="${giftInfo.discountPrice}" />"> <strong>원</strong>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="d-grid gap-2" id="buy">
								<input type="hidden" id="isLogined" name="isLogined" value="${not empty LOGINED_USER ? 'yes':'no' }">
								<button class="btn btn-outline-success btn-lg" data-gift-no="${gift.giftNo }" id="insert-purchase" type="button">구매하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	<div class="modal fade" id="form-detail-modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalLabel">사용가능 극장</h5>
					<button type="button" class="btn-waring" data-bs-dismiss="modal" aria-label="Close">닫기</button>
				</div>
				<div class="modal-body">
					<div class="d-flex align-items-start">
						<div class="nav flex-column nav-pills me-3" style="border-bottom: 1px solid #ddd" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					   		<button class="btn btn-outline-warning mt-auto active" id="v-pills-Incheon-Seoul" data-bs-toggle="pill" data-bs-target="#v-pills-Seoul" type="button" role="tab" aria-controls="v-pills-Seoul" aria-selected="true">서울 (17)</button>
					    	<button class="btn btn-outline-warning mt-auto" id="v-pills-Incheon-Gyeonggi" data-bs-toggle="pill" data-bs-target="#v-pills-Gyeonggi" type="button" role="tab" aria-controls="v-pills-Gyeonggi" aria-selected="false">경기 (26)</button>
					    	<button class="btn btn-outline-warning mt-auto" id="v-pills-Incheon-tab" data-bs-toggle="pill" data-bs-target="#v-pills-Incheon" type="button" role="tab" aria-controls="v-pills-Incheon" aria-selected="false">인천 (5)</button>
					    	<button class="btn btn-outline-warning mt-auto" id="v-pills-Chungcheong-tab" data-bs-toggle="pill" data-bs-target="#v-pills-Chungcheong" type="button" role="tab" aria-controls="v-pills-Chungcheong" aria-selected="false">대전/충청/세종 (17)</button>
					    	<button class="btn btn-outline-warning mt-auto" id="v-pills-Busan-tab" data-bs-toggle="pill" data-bs-target="#v-pills-Busan" type="button" role="tab" aria-controls="v-pills-Busan" aria-selected="false">부산/대구/경상 (21</button>
					    	<button class="btn btn-outline-warning mt-auto" id="v-pills-Gwangju-tab" data-bs-toggle="pill" data-bs-target="#v-pills-Gwangju" type="button" role="tab" aria-controls="v-pills-Gwangju" aria-selected="false">광주/전라 (9)</button>
					    	<button class="btn btn-outline-warning mt-auto" id="v-pills-Gangwon-tab" data-bs-toggle="pill" data-bs-target="#v-pills-Gangwon" type="button" role="tab" aria-controls="v-pills-Gangwon" aria-selected="false">강원 (4)</button>
					    	
					 	</div>
						<div class="tab-content" id="v-pills-tabContent">
					   		<div class="tab-pane fade show active" id="v-pills-Seoul" role="tabpanel" aria-labelledby="v-pills-Seoul-tab">
								<ul>
									<li>강남</li>
									<li>강남대로(씨티)</li>
									<li>강동</li>
									<li>군자</li>
									<li>동대문</li>
									<li>마곡</li>
									<li>목동</li>
									<li>상봉</li>
									<li>상암월드컵경기장</li>
									<li>성수</li>
									<li>송파파크하비오</li>
									<li>신촌</li>
									<li>이수</li>
									<li>창동</li>
									<li>코엑스</li>
									<li>홍대</li>
									<li>화곡</li>
								</ul>
							</div>
					   		<div class="tab-pane fade" id="v-pills-Gyeonggi" role="tabpanel" aria-labelledby="v-pills-Gyeonggi-tab">
								<ul>
									<li>고양스타필드</li>
									<li>김포한강신도시</li>
									<li>남양주</li>
									<li>남양주현대아울렛 스페이스원</li>
									<li>동탄</li>
									<li>미사강변</li>
									<li>백석</li>
									<li>별내</li>
									<li>부천스타필드시티</li>
									<li>분당</li>
									<li>수원</li>
									<li>수원남문</li>
									<li>시흥배곧</li>
									<li>안산중앙</li>
									<li>안성스타필드</li>
									<li>양주</li>
									<li>영통</li>
									<li>용인기흥</li>
									<li>용인테크노밸리</li>
									<li>의정부민락</li>
									<li>일산</li>
									<li>킨텍스</li>
									<li>파주금촌</li>
									<li>파주운정</li>
									<li>파주출판도시</li>
									<li>하남스타필드</li>
								</ul>
							</div>
					    	<div class="tab-pane fade" id="v-pills-Incheon" role="tabpanel" aria-labelledby="v-pills-Incheon-tab">
								<ul>
									<li>검단</li>
									<li>송도</li>
									<li>영종</li>
									<li>인천논현</li>
									<li>청라지젤</li>
								</ul>
							</div>
					    	<div class="tab-pane fade" id="v-pills-Chungcheong" role="tabpanel" aria-labelledby="v-pills-Chungcheong-tab">
								<ul>
									<li>공주</li>
									<li>논산</li>
									<li>대전</li>
									<li>대전신세계 아트앤사이언스</li>
									<li>대전유성</li>
									<li>대전중앙로</li>
									<li>대전현대아울렛</li>
									<li>세종(조치원)</li>
									<li>세종나성</li>
									<li>세종청사</li>
									<li>오창</li>
									<li>제천</li>
									<li>진천</li>
									<li>천안</li>
									<li>청주사창</li>
									<li>충주</li>
									<li>홍성내포</li>
								</ul>
					    	</div>
					    	<div class="tab-pane fade" id="v-pills-Busan" role="tabpanel" aria-labelledby="v-pills-Busan-tab">
					    		<ul class="dot-list">
									<li>경북도청</li>
									<li>경산하양</li>
									<li>구미강동</li>
									<li>김천</li>
									<li>남포항</li>
									<li>대구(칠성로)</li>
									<li>대구신세계(동대구)</li>
									<li>대구이시아</li>
									<li>덕천</li>
									<li>마산</li>
									<li>문경</li>
									<li>부산극장</li>
									<li>부산대</li>
									<li>북대구(칠곡)</li>
									<li>양산</li>
									<li>양산라피에스타</li>
									<li>울산</li>
									<li>정관</li>
									<li>창원</li>
									<li>창원내서</li>
									<li>해운대(장산)</li>
								</ul>
					    	</div>
					    	<div class="tab-pane fade" id="v-pills-Gwangju" role="tabpanel" aria-labelledby="v-pills-Gwangju-tab">
					    		<ul class="dot-list">
									<li>광주상무</li>
									<li>광주하남</li>
									<li>목포하당(포르모)</li>
									<li>송천</li>
									<li>순천</li>
									<li>여수웅천</li>
									<li>전대(광주)</li>
									<li>전주혁신</li>
									<li>첨단</li>
								</ul>
							</div>
					    	<div class="tab-pane fade" id="v-pills-Gangwon" role="tabpanel" aria-labelledby="v-pills-Gangwon-tab">
					    		<ul class="dot-list">
									<li>남춘천</li>
									<li>속초</li>
									<li>원주</li>
									<li>원주센트럴</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>		
	<br>
<%@include file="shopFooter.jsp" %>
<%@include file="../common/footer.jsp" %>
</div>
<script>
$(function() {
	// 사용가능 극장 모달	
	var detailModal = new bootstrap.Modal(document.getElementById("form-detail-modal"), {
		keyboard: false
	})
	$("#possible").click(function() {
		detailModal.show();
	});	
	
	// 증가버튼을 클릭했을 때
	$("#increase").click(function() {
		var increaseNum = parseInt($("#number").text()) + 1;
		if (increaseNum > 8) {
			alert("최대 수량은 8개 입니다.");
			return;
		}
		$("#number").text(increaseNum);
		
		var totalPrice = $("#price").text().replace(/,/m, '') * increaseNum
		$("#itemSum").val(new Number(totalPrice).toLocaleString());
		
	});
	
	
	// 감소버튼을 클릭했을 때
	$("#decrease").click(function() {
		var decreaseNum = parseInt($("#number").text()) - 1;
		if (decreaseNum < 1) {
			alert("최소 수량은 1개 입니다.");
			return;
		}
		$("#number").text(decreaseNum);
		
		var totalPrice = $("#price").text().replace(/,/m, '') * decreaseNum
		$("#itemSum").val(new Number(totalPrice).toLocaleString());
	});
	
	$("#buy #insert-purchase").click(function() {
		var isLogined = $("[name=isLogined]").val();
		if(isLogined == 'no'){
			alert("로그인이 필요한 서비스입니다.");
				loginModal.show();
			return false;
		}
		$.ajax({
			type: "post",
			url: "purchase",	// 구매기능
			data: {giftNo:$("#giftNo").val(), orderAmount:parseInt($("#number").text()), userId:'${LOGINED_USER.id}'},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    },
			success : function() {
			    alert("구매되었습니다.");
			    location.reload();
			}
		});
	});	
});
</script>
</body>
</html>