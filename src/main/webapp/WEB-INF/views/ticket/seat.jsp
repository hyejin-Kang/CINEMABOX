<%@page import="com.cinemabox.dto.ticket.TicketDto"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/seat.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%-- moment cdnjs 한국어설정하기 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<title>CINEMABOX :: SEAT</title>
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
					<li class="act">
						<span>02</span>
						<br>
						인원/좌석
					</li>
					<li>
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
				<div class="col-11 h-100 position-relative" id="div-person">
					<div class="col-12 text-center text-white bg-dark p-3">
						<span>인원/좌석 선택</span>
						<span class="float-end p-3 col-12" style="font-size:0.7rem; color:#ddd;">* 인원은 최대 8명까지 선택 가능합니다.</span>
					</div>
					<!-- 인원선택 -->
					<div class="col-12 row bg-light p-4">
						<div class="col-4 row d-flex align-items-center justify-content-center" id="screening-no" data-scno="${tickets.screeningNo }">
							<div class="col-2 text-center">
								<img src="/cinemabox/resources/images/movie/${tickets.movieNo }.jpg" alt="" width="40px;">
							</div>
							<div class="col-9">
								<ul class="p-0 m-0">
									<li><img src="/cinemabox/resources/images/icon/txt-age-small-${tickets.age }.png" alt="">${tickets.title }</li>
									<li style="font-size:0.7rem;"><fmt:formatDate value="${tickets.screeningDate }" pattern="yy.MM.dd"/>(<span id="today"><fmt:formatDate value="${tickets.screeningDate }" pattern="EE"/></span>) | <span id="movieStartTime">${tickets.screeningTime }</span> ~ ${tickets.screeningEndTime }</li>
									<li style="font-size:0.7rem;">${tickets.hallName } · <span id="timeType"></span></li>
								</ul>
							</div>
						</div>
						<div class="col-8 row d-flex align-items-center" id="div-selectPerson">
							<div class="col-6 text-center">
								<label class="mx-2">성인</label>
								<div class="bx-num">
									<button class="btn-minus calc" id="adult-minus"><i class="fas fa-minus"></i></button>
									<div class="txt-num" id="adult-cnt">0</div> 
									<button class="btn-plus calc" id="adult-plus"><i class="fas fa-plus"></i></button>
								</div>
							</div>
							<div class="col-6 text-center">
								<label class="mx-2">청소년</label>
								<div class="bx-num">
									<button class="btn-minus calc" id="teenager-minus"><i class="fas fa-minus"></i></button>
									<div class="txt-num" id="teenager-cnt">0</div> 
									<button class="btn-plus calc" id="teenager-plus"><i class="fas fa-plus"></i></button>
								</div>
							</div>
						</div>
					</div>
					<!-- 좌석선택 -->
					<div id="div-selectSeat" class="row text-center">
						<div class="col-12 p-3">
							<span class="text-white p-4 col-12" id="msgSpan" style="font-size:0.7rem;">
								* 인원을 선택하세요.
							</span>
						</div>
						<div class="col-12 p-4 bg-light">
							<span class="text-muted" style="font-size:1.3rem;">S&nbsp;C&nbsp;R&nbsp;E&nbsp;E&nbsp;N</span>
						</div>
						<div class="p-5 row justify-content-center">
							<!-- 좌석 행 시작 seats -->
							<c:forEach var="loop" begin="1" end="7">
								<div class="col-8 row mt-2">
										<c:set var="colIndex" value="${(loop-1)*10}" />
										<div class="col text-end text-white" id="seat-col">${seats[colIndex].seatCol }</div>
										<div class="col text-center">
											<c:forEach var="n" begin="0" end="1">
												<c:set var="index" value="${(loop-1)*10+n}" />
												<input type="checkbox" class="couch" id="seatIco-${index }" data-seat-row="${seats[index].seatRow}" value="${seats[index].seatNo}" ${(seats[index].ticketStatus eq 'Y' || seats[index].ticketStatus eq 'T') ? 'disabled':''} data-selected="${seats[index].ticketStatus }"/>
												<label for="seatIco-${index }" class="seatIco-${index }-before"><i class="fas fa-couch ${(seats[index].ticketStatus eq 'Y' || seats[index].ticketStatus eq 'T') ? 'text-success':'text-white'}"></i></label>
											</c:forEach>
										</div>
										<div class="col text-center">
											<c:forEach var="n" begin="2" end="7">
												<c:set var="index" value="${(loop-1)*10+n}" />
												<input type="checkbox" class="couch" id="seatIco-${index }" data-seat-row="${seats[index].seatRow}" value="${seats[index].seatNo}" ${(seats[index].ticketStatus eq 'Y' || seats[index].ticketStatus eq 'T') ? 'disabled':''} data-selected="${seats[index].ticketStatus }"/>
												<label for="seatIco-${index }" class="seatIco-${index }-before"><i class="fas fa-couch ${(seats[index].ticketStatus eq 'Y' || seats[index].ticketStatus eq 'T') ? 'text-success':'text-white'}"></i></label>
											</c:forEach>
										</div>
										<div class="col text-center">
											<c:forEach var="n" begin="8" end="9">
												<c:set var="index" value="${(loop-1)*10+n}" />
												<input type="checkbox" class="couch" id="seatIco-${index }" data-seat-row="${seats[index].seatRow}" value="${seats[index].seatNo}" ${(seats[index].ticketStatus eq 'Y' || seats[index].ticketStatus eq 'T') ? 'disabled':''} data-selected="${seats[index].ticketStatus }"/>
												<label for="seatIco-${index }" class="seatIco-${index }-before"><i class="fas fa-couch ${(seats[index].ticketStatus eq 'Y' || seats[index].ticketStatus eq 'T') ? 'text-success':'text-white'}"></i></label>
											</c:forEach>
										</div>
									<div class="col"></div>
								</div>
							</c:forEach>
							<!-- 좌석 행 끝 -->
						</div>
					</div>
							<div class="row mx-5">
								<div class="col-6 mx-5 text-start">
									<span class="text-white">선택가능 : </span><i class="fas fa-couch text-white"></i>
									<span class="text-white ms-2">선택좌석 : </span><i class="fas fa-couch text-danger"></i>
									<span class="text-white ms-2">선택불가 : </span><i class="fas fa-couch text-secondary"></i>
									<span class="text-white ms-2">예약좌석 : </span><i class="fas fa-couch text-success"></i>
								</div>
							</div>
					<!-- 결제하기 -->		
					<div class="col-12 text-white bg-secondary position-absolute" style="bottom:0;">
						<div class="d-flex justify-content-between">
							<div class="p-4">총 합계 : <span id="priceMsg">0</span>원</div>
							<button class="bg-danger p-4 text-white" id="pay-ment">결제하기</button>
						</div>
					</div>			
				</div>
			</div>
		</div>
	</div>
	<form action="payment" method="post" id="pay-ment-form">
		<input type="hidden" id="adult_cnt" name="adultCnt" value="">
		<input type="hidden" id="teenager_cnt" name="teenagerCnt" value="">
		<input type="hidden" id="seat_row" name="seatRow" value="">
		<input type="hidden" id="seat_col" name="seatCol" value="">
		<input type="hidden" id="seat_no" name="seatNo" value="">
		<input type="hidden" id="total_price" name="totalPrice" value="">
	</form>
	<input type="hidden" name="isLogined" value="${not empty LOGINED_USER ? 'yes':'no' }">
	<%@include file="../common/footer.jsp" %>
</div>
<!-- 토스트 메세지가 세로방향으로 쌓이는 곳 -->
<div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 11"></div>
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
//알람 메세지를 화면에 표시한다.
var toastBasicTemplate = $("#toast-basic-template").html();
var $toastContainer = $('.toast-container');

//제목을 포함하고 있는 토스트 메세지를 표현한다.
function createBasicToast(title, message) {
	var $el = $(toastBasicTemplate);
	$el.find('.me-auto').text(title);
	$el.find('.toast-body').html(message);
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
	
	// 아이콘 체크박스 숨기기 //
	var seatIcon;
	for(var i=0; i <= 69; i++) {
		seatIcon = $('#seatIco-'+i);
		seatIcon.css('display', 'none');
	}
	// 아이콘 체크박스 숨기기 //
	
	// 조조 및 일반 판별 코드 //
	if ($('#movieStartTime').text().replace(":","") <= 1100 && $('#movieStartTime').text().replace(":","") >= 700) {
		$('#timeType').text('조조');
	} else {
		$('#timeType').text('일반');
	}
	// 조조 및 일반 판별 코드 //
	
	// 성인 및 청소년 인원수 카운팅 //
	var adultCnt = 0;
	var teenagerCnt = 0;
	var totalCnt = 0;
	var adult = $("#adult-cnt").text();
	var teenager = $("#teenager-cnt").text();
	var total =  adult + teenager;
	// 성인 인원수 카운팅
	if(adultCnt == 0){
		$('#adult-minus').prop('disabled', 'true');
	}
	$('#adult-plus').click(function() {
		$('#msgSpan').text('* 좌석 선택 후 결제하기 버튼을 클릭하세요');
		adultCnt++;
		totalCnt++;
		$('#adult-cnt').text(adultCnt);
		if(totalCnt >= 8) {
			$('#adult-plus').prop('disabled', 'true');
			// 최대 인원
			alert('인원은 최대 8명 까지 선택 가능 합니다.');
			$('#teenager-cnt').text($('#tennager-cnt').text());
		}
		$('#adult-minus').removeAttr("disabled");
	})
	$('#adult-minus').click(function() {
		adultCnt--;
		totalCnt--;
		$('#adult-cnt').text(adultCnt);
		if(adultCnt == 0 || totalCnt == 0){
			$('#adult-minus').prop('disabled', 'true');
		}
		if(totalCnt < 8){
			$('#adult-plus').removeAttr("disabled");
		}
	})
	
	// 청소년 인원 선택
	if(teenagerCnt == 0){
		$('#teenager-minus').prop('disabled', 'true');
	}
	$('#teenager-plus').click(function() {
		$('#msgSpan').text('* 청소년 요금은 만 4세 이상 ~ 만 18세 미만의 청소년에 한해 적용됩니다.');
		teenagerCnt++;
		totalCnt++;
		$('#teenager-cnt').text(teenagerCnt);
		if(totalCnt >= 8) {
			$('#teenager-plus').prop('disabled', 'true');
			alert('인원은 최대 8명 까지 선택 가능 합니다.');
			$('#adult-cnt').text($('#adult-cnt').text());
		}
		$('#teenager-minus').removeAttr("disabled");
	})
	$('#teenager-minus').click(function() {
		teenagerCnt--;
		totalCnt--;
		$('#teenager-cnt').text(teenagerCnt);
		if(teenagerCnt == 0){
			$('#teenager-minus').prop('disabled', 'true');
		}
		if(totalCnt < 8){
			$('#teenager-plus').removeAttr("disabled");
		}
	})
	// 성인 및 청소년 인원수 카운팅 //
	
	//////////////////////////// 가격 산정 코드 ////////////////////////////
	var adultPrice = 0;
	var teenagerPrice = 0;
	var totalPrice = 0;
	
	$('#div-selectPerson').click(function() {
		if ('조조' == $('#timeType').text()) {
			if ('금' == $('#today').text() || '토' == $('#today').text() || '일' == $('#today').text()) {
// 				console.log($('#today').text() + ' 조조 주말');
				adultPrice = adultCnt * 10000;
				teenagerPrice = teenagerCnt * 7000;
				totalPrice = adultPrice + teenagerPrice;
				$('#priceMsg').text(addComma(String(totalPrice)));
			} else {
// 					console.log($('#today').text() + ' 조조 평일');
				adultPrice = adultCnt * 9000;
// 					console.log(adultCnt);
				teenagerPrice = teenagerCnt * 7000;
				totalPrice = adultPrice + teenagerPrice;
				$('#priceMsg').text(addComma(String(totalPrice)));
			}
		} else {
			if ('금' == $('#today').text() || '토' == $('#today').text() || '일' == $('#today').text()) {
// 				console.log($('#today').text() + ' 일반 주말');
				adultPrice = adultCnt * 14000;
				teenagerPrice = teenagerCnt * 11000;
				totalPrice = adultPrice + teenagerPrice;
				$('#priceMsg').text(addComma(String(totalPrice)));
			} else {
// 				console.log($('#today').text() + ' 일반 평일');
				adultPrice = adultCnt * 13000;
				teenagerPrice = teenagerCnt * 10000;
				totalPrice = adultPrice + teenagerPrice;
				$('#priceMsg').text(addComma(String(totalPrice)));
			}
		}
		// 성인, 청소년 인원수 밸류값 전달하기 //
// 		console.log('성인인원수 :'+adultCnt);
// 		console.log('청소년인원수 :'+teenagerCnt);
		$('#adult_cnt').val(adultCnt);
		$('#teenager_cnt').val(teenagerCnt);
	// 성인, 청소년 인원수 밸류값 전달하기 //
		// 총 금액 폼태그 값 절달 //
		$('#total_price').val(minusComma($('#priceMsg').text()));
		// 총 금액 폼태그 값 절달 //
	})
	//////////////////////////// 가격 산정 코드 ////////////////////////////

	// 좌석 선택가능한 횟수
	function getSelectedSeatCount() {
		return $('.couch:checked').length;
	}
	
	var clickCnt = 0;
	// 아이콘 클릭 시 동작하는 함수
	$('.couch').click(function() {
		$(this).attr('data-mine', 'me');
		var $that = $(this);
		var selectedSeatCount = getSelectedSeatCount();
		if ($('#adult-cnt').text() == '0' && $('#teenager-cnt').text() == '0') {
			alert("인원을 선택해 주십시오.");
			$('#adult-cnt').focus();
			return false;
		} else {
			var seatRow = $(this).val();
			var seatCol = $(this).parent().parent().eq(0).text().trim();
			// 선택한 좌석의 행, 열 모음 밸류값 전달하기 //
			var selectType = "";
			if ($(this).prop('checked')) {
				selectType = "T";
			} else {
				selectType = "N";
			}
			var row = seatRow;
			var col = seatCol;
			var screeningNos =  $('#screening-no').data('scno');
			console.log('클릭 임시선택T 또는 해제N : '+selectType);
			console.log('좌석번호 ==='+row);
			console.log('==='+col);
			console.log('==='+screeningNos);
			$.ajax({
				url:"ticketing/webSeat",
				data: {screeningNo: screeningNos, col: col, row: row, selectType: selectType},
				success: function() {
					console.log("좌석선택 성공.");
				},
				error: function() {
					alert("좌석선택 중 오류가 발생하였습니다.");
				}
			})
			// 인원수에 맞게 클릭횟수가 채워지면  일어날 아이콘 동작 상태에 관한 함수
			if (totalCnt == selectedSeatCount) {
				$('.calc').prop('disabled', 'true');
				// 인원수에 맞게 클릭횟수가 채워지면 클릭한 부분과 이미 예약된 좌석을 제외한 나머지 구간 disabled
				$('.couch:not(.couch:checked, .couch.text-success)').prop('disabled', 'true').addClass('disabled').next().children().addClass('text-secondary').removeClass('text-white');
				// 선택한 좌석의 행, 열 모음 밸류값 전달하기 //
				var seatRows = [];
				var seatCols = [];
				var seatNumbers = [];
				var seatToast = [];
				$('.couch:checked').each(function(index, item) {
					seatNumbers.push($(item).val());
					seatRows.push($(item).data('seat-row'));
					seatCols.push($(item).parent().parent().eq(0).text().trim());
					seatToast.push($(item).parent().parent().eq(0).text().trim() + $(item).data('seat-row'));
				})
				console.log('ajax 웹소켓 관계없음 좌석번호 밸류 확인 :'+seatRows);
				console.log('ajax 웹소켓 관계없음  좌석행 밸류 확인 :'+seatCols);
				console.log('ajax 웹소켓 관계없음  좌석행 밸류 확인 :'+seatNumbers);
				if(seatNumbers.length == 1){
					$('#seat_no').val(String(seatNumbers[0]));
				}else{
					$('#seat_no').val(seatNumbers.join(" "));
				}
				$('#seat_row').val(seatRows.join(" "));
				$('#seat_col').val(seatCols.join(" "));
				
				var title = "좌석이 선택 되었습니다."
				var message = '<p>' + seatToast + ' 좌석이 선택되었습니다.</p>';
					message += '<p>결제 완료후 좌석이 확정됩니다.</p>';
					message += '<p>임시선택 유효시간은 20분 입니다.</p>';
					message += '<p>인원수정은 좌석 선택해제 후 </p>';
					message += '인원 수정이 가능합니다.';
				console.log('토스트에 띄울 메세지 확인 : ' + seatToast);
				createBasicToast(title, message);
			} else {
				// 1. 이미 예약된 좌석을 제외하고 비활성화 되어 있는 것을 전부 활성화하고 세컨더리 다 화이트로 선택 가능하게 표시 단, 1좌석 이상이면서 체크가 되어있는 좌석은 체크를 유지해야할것.
				$('.couch:not(.couch:checked, input[data-selected=Y], input[data-selected=T])').removeClass('disabled').removeAttr('disabled').next().children().removeClass('text-secondary').addClass('text-white');
				$('.calc').removeAttr('disabled');
			}
		
			// websocket 클릭
			// 아이콘 클릭 색상 토글 //
			var clicks = $(this).next().children().data('clicks');
			if (clicks) {
				// odd clicks
				$(this).next().children().removeClass('text-secondary').removeClass('text-white').addClass('text-danger');
				$(this).next().children().removeClass('text-secondary').removeClass('text-danger').addClass('text-white');
			} else {
				// even clicks
				$(this).next().children().removeClass('text-secondary').removeClass('text-danger').addClass('text-white');
				$(this).next().children().removeClass('text-secondary').removeClass('text-white').addClass('text-danger');
			}
			$(this).next().children().data("clicks", !clicks);
			// 아이콘 클릭 색상 토글 //
			
		}
	});
	// 폼 데이터 서브밋 //
	$('#pay-ment').click(function() {
		var isLogined = $("[name=isLogined]").val();
		if(isLogined == 'no'){
			alert("로그인이 필요한 서비스입니다.");
 			loginModal.show();
			return;
		}
		$('#pay-ment-form').submit();
	})
	
	// 웹소켓 연결
	var socket = new WebSocket("ws://localhost/${pageContext.servletContext.contextPath}/ws/alarm");
	socket.onopen = function(event) {
		console.log("서버와 연결완료", event)
	}
	socket.onmessage = function(event) {
		console.log("서버가 보낸 메세지 수신", event);
		
		var payload = JSON.parse(event.data);
		console.log("수신한 데이터", payload);
		
		// 수신한 데이터의 세부 데이터 확인
		var sRow = payload.data.webSeatRow;
		var sCol = payload.data.webSeatCol;
		var sNo = payload.data.webSeatNo;
		var sStatus = payload.data.webTicketStatus;
		var sTime = payload.data.seatSelectedDate;
		var sType = payload.data.webSelectType;
		console.log('열 : ' + sRow + ', 행 : ' + sCol);
		console.log('좌석번호 '+sNo + ', 좌석 상태 ' + sStatus + ', 좌석 상태 날짜' + sTime);
		console.log('클릭상태 : ' + sType);
		console.log('웹티켓번호 확인 : ' + payload.data.webTicketNo);
		// 웹소켓 반응 코드 여기다 작성
		var couchSeatNo = $('.couch').val();
		console.log('찍힌 밸류 : '+couchSeatNo);
		if (sType == 'T') {
			$('#div-selectSeat input[value='+sNo+'][data-mine!="me"]').prop('disabled', 'true').addClass('disabled').next().children().removeClass('text-secondary').removeClass('text-white').addClass('text-success');
		} else {
			$('#div-selectSeat input[value='+sNo+'][data-mine!="me"]').removeAttr('disabled').removeClass('disabled').next().children().removeClass('text-secondary').removeClass('text-success').addClass('text-white');
		}
	}

})
</script>
</body>
</html>