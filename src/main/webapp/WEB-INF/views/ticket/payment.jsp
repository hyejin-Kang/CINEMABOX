<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/payment.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%-- moment cdnjs 한국어설정하기 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<title>CINEMABOX :: PAYMENT</title>
</head>
<body>
<div class="container-fluid">
	<%@include file="../common/header.jsp" %>
	<div id="ticketing" class="bg-dark p-5">
		<div class="container p-0">
			<div class="section_step_tit row border shadow overflow-hidden">
				<ul class="col-1 text-center m-0">
					<li class="act-prev">
						<span>01</span>
						<br>
						상영시간
					</li>
					<li class="act-prev">
						<span>02</span>
						<br>
						인원/좌석
					</li>
					<li class="act">
						<span>03</span>
						<br>
						결제
					</li>
					<li>
						<span>04</span>
						<br>
						결제완료
					</li>
				</ul>
				<div class="col-3 h-100 bg-white" id="div-movieInfo">
					<h5 class="p-3 text-center text-white m-0 bg-dark">예매정보</h5>
					<div class="text-center py-4">
						<img src="/cinemabox/resources/images/movie/${tickets.movieNo }.jpg" alt="" width="120px;">
					</div>
					<div class="px-5 pb-4" style="border-bottom:1px solid #ddd;">
						<h6><img src="/cinemabox/resources/images/icon/txt-age-small-${tickets.age }.png" alt="" class="me-2"><strong>${tickets.title }</strong></h6>
						<dl class="dl-ticketing">
							<dt><strong>일시</strong></dt><dd><fmt:formatDate value="${tickets.screeningDate }" pattern="yy.MM.dd(E)"/>&nbsp; ${tickets.screeningTime } ~ ${tickets.screeningEndTime }</dd>
							<dt><strong>영화관</strong></dt><dd>${tickets.theaterName }점  ${tickets.hallName }</dd>
							<dt><strong>인원</strong></dt><dd>성인${tickets.adultCnt } 청소년${tickets.teenagerCnt }</dd>
						</dl>						
					</div>
					<div class="px-5 py-3" style="border-bottom:1px solid #ddd;">
						<dl class="dl-ticketing">
							<dt><strong>좌석</strong></dt><dd>${seat }</dd>
						</dl>			
					</div>
				</div>
				<div class="col-4 h-100 bg-white" id="div-payment">
					<h5 class="p-3 text-center text-white m-0 bg-dark">결제수단</h5>
					<div id="div-payment-cont" class="p-3">
						<div class="mb-3">
							<h6>최종 결제수단</h6>
							<ul class="nav" id="ul-selectPay">
								<li>
									<button class="btn p-3 border pay-selected-parent" id="btn-pay-card">
										<h3><i class="bi bi-credit-card"></i></h3>
										<span style="font-size: 0.75rem;">신용카드</span>
									</button>
								</li>
								<li>
									<button class="btn p-3 border pay-selected-parent" id="btn-pay-simple">
										<h3><i class="bi bi-wallet2"></i></h3>
										<span style="font-size: 0.75rem;">간편결제</span>
									</button>
								</li>
								<li>
									<button class="btn p-3 border pay-selected-parent" id="btn-pay-deposit">
										<h3><i class="bi bi-cash-stack"></i></h3>
										<span style="font-size: 0.75rem;">실시간 계좌이체</span>
									</button>
								</li>
							</ul>
						</div>
						<ul class="nav" id="ul-selectPay-simple" style="display:none;">
							<li data-simple="kakaopay">
								<button class="btn p-3 border pay-selected">
									<h3 style="margin-top: -11px;">
										<img src="/cinemabox/resources/images/payment/payment_simple_kakao.png" alt="">
									</h3>
									<span class="text-body">카카오페이</span>
								</button>
							</li>
							<li data-simple="payco">
								<button class="btn p-3 border pay-selected">
									<h3 style="margin-top: -11px;">
										<img src="/cinemabox/resources/images/payment/payment_simple_payco.png" alt="">
									</h3>
									<span class="text-body">페이코</span>
								</button>
							</li>
							<li data-simple="smilepay">
								<button class="btn p-3 border pay-selected">
									<h3 style="margin-top: -11px;">
										<img src="/cinemabox/resources/images/payment/payment_simple_smilepay.png" alt="">
									</h3>
									<span class="text-body">스마일페이</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-4 h-100 bg-white position-relative" id="div-point">
					<h5 class="p-3 text-center text-white m-0 bg-dark">할인/포인트</h5>
					<div class="mb-3 p-3">
						<ul class="p-0 m-0" id="">
							<li>
								<h6>쿠폰사용</h6>
								<button class="btn p-2 border form-control" id="btn-coupon">
									보유쿠폰확인
								</button>
							</li>
							<li class="mt-3" id="li-coupon-list" style="display:none;">
								<table class="table border">
									<colgroup>
										<col width="70%">
										<col width="25%">
									</colgroup>
									<c:choose>
										<c:when test="${empty coupons }">
											<tr class="text-center" style="font-size:0.8rem;">
												<td colspan="2">* 사용가능한 쿠폰이 존재하지 않습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${coupons }" var="coupon">
												<tr class="align-middle" style="font-size:0.8rem;">
													<td class="p-3">${coupon.type }</td>
													<td><button data-coupon="N" data-serial="${coupon.serialNo }" class="coupon-btn btn btn-outline-secondary btn-sm border">사용가능</button></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
							</li>
							<li class="mt-3">
								<h6>
									포인트사용
									<span style="font-size:0.8rem; color:#999;">( 현재 포인트 : <span id="nowPoint" data-now-point="${user.point}">${user.point}</span>pt )</span>
								</h6>
								<div class="input-group">
									<button class="btn btn-outline-secondary" id="allPointBtn">전체사용</button>
									<input type="number" min="0" value="0" placeholder="0" id="pointInput" class="form-control text-end" style="color:#999;">
									<button class="btn btn-outline-secondary" id="confirmPointBtn">확인</button>
									<button class="btn btn-outline-secondary" id="cancelPointBtn">취소</button>
								</div>
							</li>
						</ul>
					</div>
					<div class="bg-secondary" id="div-total"  data-movie-price="${tickets.totalPrice }">
						<dl>
							<dt>상품금액</dt>
							<dd><fmt:formatNumber value="${tickets.totalPrice }"/>원</dd>
						</dl>
						<dl>
							<dt>쿠폰할인</dt>
							<dd><span>- </span><span id="coupon-money">0</span>원</dd>
						</dl>
						<dl>
							<dt>포인트할인</dt>
							<dd><span>- </span><span id="point-discount-money">0</span>원</dd>
						</dl>
						<dl>
							<dt>할인금액</dt>
							<dd><span>- </span><span id="discountPrice">0</span>원</dd>
						</dl>
						<dl>
							<dt>결제금액</dt>
							<dd id="dd-total-price"><span id="span-total-price"><fmt:formatNumber value="${tickets.totalPrice }"/></span>원</dd>
						</dl>
						<a class="" id="a-confirm">결제하기</a>
					</div>
				</div>
			</div>
			<!-- 선택한 값 넘겨받는 form -->
			<form action="complete" method="post" id="form-ticketing">
				<input type="hidden" name="payment" value="" id="pay-ment">
				<input type="hidden" name="totalPrice" value="" id="pay-total-price">
				<input type="hidden" name="userId" value="" id="pay-user-id">
				<input type="hidden" name="usedPoint" value="" id="pay-user-point">
				<input type="hidden" name="serialNo" value="" id="pay-coupon-serial">
			</form>
			<input type="hidden" name="isLogined" value="${not empty LOGINED_USER ? 'yes':'no' }">
		</div>
	</div>
	<!-- 토스트 메세지가 세로방향으로 쌓이는 곳 -->
	<div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 11"></div>
	
	<%@include file="../common/footer.jsp" %>
</div>
<!-- 제목을 포함하고 토스트 메세지에 대한 HTML 템플릿 -->
<script type="text/template" id="toast-basic-template">
	<div class="toast role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="5000">
		<div class="toast-header text-white bg-warning border-0">
			<i class="bi bi-exclamation-circle me-1"></i><strong class="me-auto"><span>title</span></strong> <span></span>
			<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
		<div class="toast-body">message</div>
	</div>
</script>
<script type="text/javascript">
//Toast
// 알람 메세지를 화면에 표시한다.
var toastBasicTemplate = $("#toast-basic-template").html();
var $toastContainer = $('.toast-container');

// 제목을 포함하고 있는 토스트 메세지를 표현한다.
function createBasicToast(title, message) {
	var $el = $(toastBasicTemplate);
	$el.find('.me-auto').text(title);
	$el.find('.toast-body').text(message);
	$el.appendTo($toastContainer);
	
	new bootstrap.Toast($el[0]).show();
}

//천단위 콤마 제거
function minusComma(value){
     value = value.replace(/[^\d]+/g, "");
     return value; 
 }
 
//천단위 콤마 포맷팅
function addComma(value){
     value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
     return value; 
 }
 
$(function(){
//총 결제금액, 할인금액 계산 메소드
function calculateTotalPay() {
	var ticketPrice = $('#div-total').data('movie-price')
	var couponPrice = Number(minusComma($('#coupon-money').text()));
	var payPoint = Number(minusComma($('#point-discount-money').text()));
	var totalDiscountPrice = couponPrice + payPoint; // 총할인금액 = 쿠폰금액 + 포인트금액
	totalPrice = ticketPrice - totalDiscountPrice	// 총결제금액 = 상품금액 - 총할인금액
	console.log('결제금액 확인 계산메소드내부 : ' + totalPrice);
	$("discountPrice").text(addComma(String(totalDiscountPrice)));	
	$("#span-total-price").text(addComma(String(totalPrice)));
	$('#pay-total-price').val(totalPrice);
}
	// 로그인 유저 정보 //
	var user_id = '${LOGINED_USER.id}';
	var userEmail = '${LOGINED_USER.email}';
	var userName = '${LOGINED_USER.name}';
	var userPhone = '${LOGINED_USER.phone}';
	var userAddress = '${LOGINED_USER.address}';
    if(userEmail == null){
    	userEmail = "aaa@gmail.com";
    }
    if(userPhone == null){
    	userPhone = "010-0000-0000";
    }
    if(userAddress == null){
    	userAddress = "korea";
    }
	var selectPayment;
	var simplePayment;
	var inicisPayment;
	var totalPrice = Number(minusComma($('#span-total-price').text()));
	//header nav js
	$('.mainnav').mouseover(function(){
	   $(this).children('.subnav').stop().slideDown().css('display','flex');
	})
	$('.mainnav').mouseleave(function(){
	   $(this).children('.subnav').stop().slideUp();
	})
	//탑배너
	$("#i-close-top-banner").click(function(){
	   $("#div-top-banner").slideUp();
	})
	
	// 포인트 전체 사용
	$("#allPointBtn").click(function() {
		$("#pointInput").val("");
		console.log(Number(minusComma($('#span-total-price').text())) + '밖');
		if($('#nowPoint').text() > Number(minusComma($('#span-total-price').text()))) {
			console.log(Number(minusComma($('#span-total-price').text())) + 'if문 안');
			$('#pointInput').val(Number(minusComma($('#span-total-price').text())));
		} else {
			console.log(Number(minusComma($('#point-discount-money').text())) + 'if문 엘즈 안');
			$("#pointInput").val($("#nowPoint").text());
		}
		var point = $('#pointInput').val();
		var nowPoint = $('#nowPoint').text() - point;
	})
	// 쿠폰 사용버튼 클릭시 //
		// 쿠폰 중복사용 안됨 알림 //
	$('#btn-coupon').one('click', function() {
		createBasicToast("쿠폰 사용 공지", "쿠폰은 중복사용이 불가능 합니다.");
	})
		// 쿠폰 중복사용 안됨 알림 //
		
	// 쿠폰 사용시 상품금액에 50프로 할인 고정
	// 쿠폰 사용시 기존 상품금액에서 할인 시켜줄것.
	$('.coupon-btn').click(function() {
		if ($(this).hasClass('btn-active')) {   // 취소
			$(this).attr('data-coupon', 'N').text('사용가능').parents().siblings().find('.coupon-btn').removeClass('disabled');
			$(this).parent().prev().css('font-weight', '');
			$("#coupon-money").text(0)
			$(this).removeClass('btn-active');
			$('.btn-coupon').removeClass('btn-disabled');
		} else { // 사용가능 선택
			$(this).parent().prev().css('font-weight', 'bolder');
			$(this).attr('data-coupon', 'Y').text('취소');
			$(this).parents().siblings().find('.coupon-btn').addClass('disabled');
			// 포인트를 먼저 사용했을 경우 쿠폰 처리
			if (Number(minusComma($('#point-discount-money').text())) != 0) {
				$("#coupon-money").text(addComma(String(Number(minusComma($('#span-total-price').text())) *0.5)));
			} else {
				$("#coupon-money").text(addComma(String($('#div-total').data('movie-price')*0.5)));
			}
			$('.btn-coupon').addClass('btn-disabled');
			$(this).removeClass('btn-disabled').addClass('btn-active');
			// 선택한 쿠폰시리얼 폼값에 전달
			$('#pay-coupon-serial').val($(this).data('serial'));
		}
		calculateTotalPay();
	})
	// 쿠폰 사용버튼 클릭시 //
	// 포인트 확인 버튼 클릭시 //
	$('#confirmPointBtn').click(function() {
		var point = $('#pointInput').val();
		// 상품금액보다 포인트 인풋값이 크면 입력불가
		if ($('#pointInput').val() > Number(minusComma($('#span-total-price').text()))) {
			$('#pointInput').val(0);
			$('#pointInput').focus();
			createBasicToast('포인트 사용 초과', '결제 하려는 금액보다 포인트가 많습니다.');
			return;
		}
		// 가지고있는 포인트 보다 많은 포인트를 사용할경우 유효성검사 //
		if (Number(minusComma($('#point-discount-money').text())) >= $('#nowPoint').text()) {
			$('#pointInput').val(0);
			$('#pointInput').focus();
			createBasicToast('포인트 부족', '현재 가지고 있는 포인트가 부족합니다.');
			return;
		}
		// 가지고있는 포인트 보다 많은 포인트를 사용할경우 유효성검사 //
		// 전체포인트 사용버튼 한번만 누르기
		$('#allPointBtn').addClass('disabled');
		// 확인 클릭시 확인 버튼 불가능 상태
		$(this).addClass('disabled');
		// 현재 가지고 있는 포인트에 사용한 포인트를 차감한 결과값을 나타냄 //
		var nowPoint = $('#nowPoint').text() - point;
		$("#nowPoint").text(nowPoint);
		// 현재 가지고 있는 포인트에 사용한 포인트를 차감한 결과값을 나타냄 //
		$("#point-discount-money").text(addComma(String($("#pointInput").val())));
		calculateTotalPay();
		$('#pointInput').val(0);
		// 사용한 포인트를 폼값에 전달
		var usedPoint = minusComma($("#point-discount-money").text())
		$('#pay-user-point').val(usedPoint);
	});
	// 포인트 취소 버튼 클릭시 //
	$('#cancelPointBtn').click(function() {
		// 전체포인트 사용버튼 한번만 누르기
		$('#allPointBtn').removeClass('disabled');
		// 취소 클릭시 확인 버튼 가능 상태
		$('#confirmPointBtn').removeClass('disabled');
		// 취소시 포인트 할인란에 있는 금액 을 현재 포인트에 더한값
		$('#nowPoint').text(Number($('#nowPoint').text()) + Number(minusComma($("#point-discount-money").text())));
		$("#point-discount-money").text(0);
		calculateTotalPay();
	});
	
	$('.pay-selected').click(function() {
		$(this).addClass('bg-warning').parent().siblings().find('button').removeClass('bg-warning');
	})
	$('.pay-selected-parent').click(function() {
		$(this).addClass('bg-warning').parent().siblings().find('button').removeClass('bg-warning');
	})
	
	//카드결제
	$("#btn-pay-card").click(function(){
		selectPayment = "creditCard";
		inicisPayment = "card";
		$("#ul-selectPay-simple").hide();
		console.log('신용결제 버튼 클릭시 ==== 셀렉트 페이먼트 : '+selectPayment + ', 이니시스 페이먼트 값 : ' + inicisPayment);
	})
	
	//간편결제
	$("#btn-pay-simple").click(function(){
		$("#ul-selectPay-simple").toggle();
		selectPayment = "simple";
		console.log('간편결제 버튼 클릭시 ==== 셀렉트 페이먼트 : '+selectPayment)
	})
	$("#ul-selectPay-simple").on('click','li',function(){
		simplePayment = $(this).data('simple');
		console.log('====심플 페이먼트 : '+simplePayment)
	})
	
	//쿠폰확인
	$("#btn-coupon").click(function(){
		$("#li-coupon-list").toggle();
	})
	
	// 무통장입금
	$('#btn-pay-deposit').click(function() {
		$("#ul-selectPay-simple").hide();
		selectPayment = 'deposit';
		inicisPayment = 'trans';
		console.log('무통장입금 버튼 클릭시 ==== 셀렉트 페이먼트 : '+selectPayment + ', 이니시스페이먼트' + inicisPayment);
	})
	
	/*import*/
	$("#a-confirm").click(function(){
	    if($('#pay-user-point').val() == '0' || !$('#pay-user-point').val()){
	    	$('#pay-user-point').remove();
	    }
	    
		if ($('#span-total-price').text() == 0) {
			var isLogined = $("[name=isLogined]").val();
			if(isLogined == 'no'){
				alert("로그인이 필요한 서비스입니다.");
	 			loginModal.show();
				return;
			}
			$('#pay-ment').val("포인트");
		    $('#pay-total-price').val(0);
		    $('#pay-user-id').val(user_id);
		    
			$('#form-ticketing').submit();
			return;
		}
		if(!selectPayment){
			alert("결제 수단을 선택해주세요.")
		}
		if (selectPayment == 'simple' && !simplePayment) {
			alert("결제 수단을 선택해주세요.")
		}
		if(selectPayment == 'creditCard' || selectPayment == 'deposit'){
			inicis()
		}
		if(selectPayment == 'simple'){
			simplePay()
		}
	});
	console.log('결제금액 확인 : ' + totalPrice);
	// IMP.request_pay(param, callback) 결제창 호출
	
    function simplePay(){
		//가맹점 식별코드
	    IMP.init("imp10888924");	
		IMP.request_pay({
		    pg : simplePayment,
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'CINEMABOX 결제',
		    amount : totalPrice,
		    buyer_email : userEmail,
		    buyer_name : userName,
		    buyer_tel : userPhone,
		    buyer_addr : userAddress
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
			    console.log(msg);
			    $('#pay-ment').val(simplePayment);
			    $('#pay-total-price').val(totalPrice);
			    $('#pay-user-id').val(user_id);
		        $('#form-ticketing').submit();
		    } else {
		    	var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
			    alert(msg);
		    }
		});
	}
    
    function inicis(){
   	    IMP.init("imp10888924");	
    	IMP.request_pay({
    	    pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
    	    pay_method : inicisPayment, //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
    	    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
    	    name : 'CINEMABOX 결제',
    	    amount : totalPrice,
    	    buyer_email : userEmail,
    	    buyer_name : userName,
    	    buyer_tel : userPhone, //누락되면 이니시스 결제창에서 오류
    	    buyer_addr : userAddress,
    	}, function(rsp) {
    	    if ( rsp.success ) {
    	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	    	jQuery.ajax({
    	    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
    	    		type: 'POST',
    	    		dataType: 'json',
    	    		data: {
    		    		imp_uid : rsp.imp_uid
    		    		//기타 필요한 데이터가 있으면 추가 전달
    	    		}
    	    	}).done(function(data) {
    	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    	    		if ( everythings_fine ) {
    	    			var msg = '결제가 완료되었습니다.';
    	    			console.log(msg);
    				    $('#pay-ment').val(simplePayment);
    				    $('#pay-total-price').val(totalPrice);
    				    $('#pay-user-id').val(user_id);
    			        $('#form-ticketing').submit();
    	    		} else {
    	    			//[3] 아직 제대로 결제가 되지 않았습니다.
    	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    	    		}
    	    	});
    	    } else {
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;
    	        
    	        alert(msg);
    	    }
    	});
    }
})
</script>
</body>
</html>