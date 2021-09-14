<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/schedule.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%-- moment cdnjs 한국어설정하기 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
<title>CINEMABOX :: TICKETING</title>
</head>
<body>
<div class="container-fluid">
	<%@include file="../common/header.jsp" %>
	<div id="ticketing" class="bg-dark p-5">
		<div class="container p-0">
			<div class="section_step_tit row border shadow overflow-hidden">
				<ul class="col-1 text-center m-0">
					<li class="act">
						<span>01</span>
						<br>
						상영시간
					</li>
					<li>
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
				<div class="col-3 h-100" id="div-theater">
					<h5 class="p-3 text-center text-white m-0">영화관 선택</h5>
					<nav style="background: white;">
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<button class="nav-link active btn-select-theater" id="nav-entire-tab"
								data-bs-toggle="tab" data-bs-target="#nav-entire" type="button"
								role="tab" aria-controls="nav-entire" aria-selected="true"><strong>전체</strong></button>
							<button class="nav-link btn-select-theater" id="nav-special-tab"
								data-bs-toggle="tab" data-bs-target="#nav-special"
								type="button" role="tab" aria-controls="nav-special"
								aria-selected="false"><strong>특별관</strong></button>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent" style="height: 86%;">
						<div class="tab-pane fade show active h-100" id="nav-entire" role="tabpanel" aria-labelledby="nav-entire-tab">
							<div class="row h-100">
								<div class="col-6 h-100" id="div-location1">
									<ul class="h-100" id="ul-location1">
										<li class="li-location1">서울</li>
										<li class="li-location1">경기</li>
										<li class="li-location1">인천</li>
										<li class="li-location1">대전/충청/세종</li>
										<li class="li-location1">부산/대구/경상</li>
										<li class="li-location1">광주/전라</li>
										<li class="li-location1">강원</li>
									</ul>
								</div>	
								<div class="col-6 h-100" id="div-location2">
									<ul id="ul-location2">
										<!-- 선택된 지역의 영화관 목록 -->
									</ul>
								</div>	
							</div>
						</div>
						<div class="tab-pane fade h-100" id="nav-special" role="tabpanel" aria-labelledby="nav-special-tab">
							<div class="row h-100">
								<div class="col-6 h-100" id="div-location1">
									<ul class="h-100" id="ul-special-location1">
										<li class="li-location2">서울</li>
										<li class="li-location2">경기</li>
										<li class="li-location2">인천</li>
										<li class="li-location2">대전/충청/세종</li>
										<li class="li-location2">부산/대구/경상</li>
										<li class="li-location2">광주/전라</li>
										<li class="li-location2">강원</li>
									</ul>
								</div>	
								<div class="col-6 h-100" id="div-location2">
									<ul class="p-3 m-0" id="ul-special-location2">
										<!-- 선택된 지역 중에서 특별관이 있는 영화관 목록 -->
									</ul>
								</div>	
							</div>
						</div>
					</div>
				</div>
				<div class="col" id="div-date">
					<h5 class="p-3 text-center text-white m-0">날짜/시간</h5>
					<div class="p-3 row" id="div-days">
						<ul id="ul-days" class="m-0 text-center">
							<!-- 날짜출력 -->	
						</ul>
					</div>
					<nav>
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<button class="nav-link tab-list active" id="nav-entireTime-tab" data-hour=""
								data-bs-toggle="tab" data-bs-target="#nav-entireTime" type="button"
								role="tab" aria-controls="nav-entireTime" aria-selected="true">
								전체</button>
							<button class="nav-link tab-list" id="nav-AMtime-tab" data-hour="13"
								data-bs-toggle="tab" data-bs-target="#nav-AMtime"
								type="button" role="tab" aria-controls="nav-AMtime"
								aria-selected="false">13시 이후</button>
							<button class="nav-link tab-list" id="nav-PMtime-tab" data-hour="19"
								data-bs-toggle="tab" data-bs-target="#nav-PMtime"
								type="button" role="tab" aria-controls="nav-PMtime"
								aria-selected="false">19시 이후</button>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active p-4" id="nav-entireTime" role="tabpanel" aria-labelledby="nav-entireTime-tab">
							<!-- 영화타이틀, 영화관, 시간 시작  -->
<!-- 							<div class="div-group-time-select mb-3" id="div-time"> -->
<!-- 								<div class="div-time-select-tit" id="div-time-title"> -->
<!-- 								</div> -->
<!-- 								<div class="div-time-select-wrap mt-3"> -->
<!-- 									<ul class="nav" id="ul-list-time"> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<!-- 영화타이틀, 영화관, 시간 끝 -->
						</div>
					</div>
				</div>
			</div>
			<!-- 선택한 값 넘겨받는 form -->
			<form action="seat" method="post" id="form-ticketing">
				<input type="hidden" name="screeningNo" id="input-screening-no">
				<input type="hidden" name="movieNo" id="input-movie-no">
				<input type="hidden" name="theaterNo" id="input-theater-no">
				<input type="hidden" name="hallNo" id="input-hall-no">
				<input type="hidden" name="hallName" id="input-hall-name">
				<input type="hidden" name="screeningDate" id="input-screening-date">
				<input type="hidden" name="screeningTime" id="input-screening-time">
				<input type="hidden" name="screeningEndTime" id="input-screening-end-time">
				<input type="hidden" name="screeningStatus" id="input-screening-status">
				<input type="hidden" name="title" id="input-title">
				<input type="hidden" name="age" id="input-age">
				<input type="hidden" name="movieStatus" id="input-movie-status">
				<input type="hidden" name="theaterName" id="input-theater-name">
			</form>
		</div>
	</div>
	<!-- 최종확인팝업 -->
	<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content shadow">

			</div>
		</div>
	</div>	
	<input type="hidden" name="isLogined" value="${not empty LOGINED_USER ? 'yes':'no' }">
	<%@include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">
$(function(){
	//지역
	var location;
	//극장번호
	var theaterNo;
	//영화번호
	var movieNo;
	//오늘날짜	
	var screeningDate = moment().format("YYYYMMDD");
	//상영시간
	var time;
	//상영번호
	var screeningNo;
	var sort;

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
	
	// 영화이름 구하기
	$("#ul-location2").on('click', 'li', function() {
		$('#input-theater-name').val($(this).text());
	})
	$("#ul-special-location2").on('click', 'li', function() {
		$('#input-theater-name').val($(this).text());
	})
	
	//1주일 단위로 날짜 변경하기
	var week = 0;
	function changeDays(){
		var $days = $('#ul-days').empty();
		
		var weekDays = [];
		for(var i=0; i<14; i++){
			weekDays.push({
				ymd : moment().add(i+(week*14), 'd').format("YYYY-MM-DD(ddd)"),
				selectedDay : moment().add(i+(week*14), 'd').format("YYYYMMDD"),
				month : moment().add(i+(week*14), 'd').format("M월"),
				day : moment().add(i+(week*14), 'd').format("D"),
				dayOfWeek : moment().add(i+(week*14), 'd').format("ddd")
			});
		}
		
		var prev;
		$.each(weekDays, function(index, item){
			var month = item.month;
			var ymd = item.ymd;
			var selectedDay = item.selectedDay;
			var content = "<li class='d-inline-block' style='width: 7%;' data-ymd="+ymd+" data-select-day="+selectedDay+">";
			if(!prev || prev != month){
				content += "<strong class='d-block' style='font-size:0.7rem;'>"+month+"</strong>"
			}
			prev = month;
			if(item.dayOfWeek == '일'){
				content += "<span class='d-block' style='font-size:1.5rem; color:#F24A6A;'>"+item.day+"</span>"
				content += "<span class='d-block' style='font-size:0.7rem; color:#F24A6A;'>"+item.dayOfWeek+"</span>"
			}else if(item.dayOfWeek == '토'){
				content += "<span class='d-block' style='font-size:1.5rem; color:#233CA3;'>"+item.day+"</span>"
				content += "<span class='d-block' style='font-size:0.7rem; color:#233CA3;'>"+item.dayOfWeek+"</span>"
			}else{
				content += "<span class='d-block' style='font-size:1.5rem;'>"+item.day+"</span>"
				content += "<span class='d-block' style='font-size:0.7rem;'>"+item.dayOfWeek+"</span>"
			}
			content += "</li>";
			$days.append(content);

		});
	}
	
	//일반 영화관
	function displayTheater(location){
		$.ajax({
			type:"GET",
			url:"theater/place",
			data:{location:location},
			dataType:"json",
			success:function(locations){
				$('#ul-location2').empty();
				$.each(locations, function(index, item){
					var content = "<li style='font-size:0.8rem;' data-theater-no="+item.theaterNo+">";
					content += item.theaterName;
					content += "</li>";
					$('#ul-location2').append(content);
				})
				
				$("#ul-location2 li:eq(0)").trigger('click');
			}
		});
	}
	
	//특별관
	function displaySpecialTheater(location){
		$.ajax({
			type:"GET",
			url:"theater/place",
			data:{location:location},
			dataType:"json",
			success:function(locations){
				$('#ul-special-location2').empty();
				$("#ul-movieList").empty();
				$.each(locations, function(index, item){
					if(item.theaterHallExist == 'Y'){
						var content = "<li style='font-size:0.8rem;' data-theater-no="+item.theaterNo+">";
						content += item.theaterName;
						content += "</li>";
						$('#ul-special-location2').append(content);
					}
				})
			}
		});		
	}
	
	//상영중인 영화목록
	function displayMovieTime (theaterNo, screeningDate){
		$.ajax({
			type:"GET",
			url:"ticketing/schedule",
			data:{theaterNo:theaterNo, screeningDate:screeningDate},
			dataType:"json",
			success:function(result){
				$.each(result, function(index, dto){
					
					var con = '<div class="div-group-time-select mb-3" id="div-time">'
					
						con +='<div class="div-time-select-tit" id="div-time-title">'
						con +='<span>'
						con +='<img src="/cinemabox/resources/images/icon/txt-age-small-'+dto.age+'.png" alt="" class="me-2">'
						con +='<strong>'+dto.movieTitle+'</strong>'
						con +='</span>'
						con +='</div>'
					
						con += '<div class="div-time-select-wrap mt-3">'
						con += '<ul class="nav" id="ul-list-time">'

						
					$.each(dto.screenings, function(index, item){
						var seat = 70-item.seatCnt;
	
						con += '<li class="rounded-3 me-2" data-bs-toggle="modal" data-bs-target="#confirmModal" data-screening-no='+item.screeningNo+' data-movie-no='+dto.movieNo+'>'
						con +=	'<dl class="text-center p-2">'
						con +=		'<dt class="d-none">상영시간</dt>'
						con +=		'<dd class="dd-time">'
						if(item.screeningTime.replace(":","") <= 1100 && item.screeningTime.replace(":","") >= 700 ){
							con += 		'<strong>'+'<i class="bi bi-sun" style="color: #ffc107"></i>'+item.screeningTime+'</strong>'
						}else{
							con += 		'<strong>'+item.screeningTime+'</strong>'
						}
						con +=		'</dd>'
						con +=		'<dt class="d-none">좌석</dt>'
						con +=		'<dd class="dd-seat d-inline-block me-2">'
						con +=			'<strong>'+seat+'</strong>/70'
						con +=		'</dd>'
						con +=		'<dt class="d-none">상영관</dt>'
						con +=		'<dd class="dd-hall d-inline-block">'+item.hallName+'</dd>'
						con +=	'</dl>'
						con +='</li>'
					})
						con +='</ul>'
						con +='</div>'		
						con +='</div>'
					$('#nav-entireTime').append(con);
				})		
			}
		});
	}

	//최종확인모달
	function displayConfirmModal(theaterNo, movieNo, screeningDate, time, screeningNo){
		$.ajax({
			type:"GET",
			url:"ticketing/selectMovie",
			data:{theaterNo:theaterNo, movieNo:movieNo, screeningDate:screeningDate, time:time, screeningNo:screeningNo},
			dataType:"json",
			success:function(m){		
				$("#confirmModal > div > div").empty();
				//끝나는 시간 구하기
				var endTime = moment.unix(m.movieInfo.screeningDate/1000).add(m.movieInfo.runningTime, "m").format("HH:mm");
				//남은 좌석 수 구하기
				var seat = 70-m.movieInfo.seatCnt;
				
				var content = '<div class="modal-header bg-dark text-white justify-content-center">'
				content += '<h5 class="modal-title" id="confirmModalLabel">'+m.movieInfo.screeningTime+'~'+endTime+'('+m.movieInfo.hallName+')</h5>'
				content += '</div>'
				content += '<div class="modal-body text-center">'
				content +=	'<span>잔여좌석 <strong style="font-size:25px;">'+seat+'</strong>/70</span>'
				content +=	'<br/>'
				content +=	'<br/>'
				content +=	'<span class="text-muted" style="font-size:13px;">S&nbsp;C&nbsp;R&nbsp;E&nbsp;E&nbsp;N</span>'
				content +=	'<br/>'
				content +=	'<br/>'
				content +=	'<div style="font-size:10px;">'
				
				$.each(m.ticketInfo, function(index, item){
					//좌석번호 문자열로 변경
					var seatNum = String(item.seatNo);
					//좌석번호의 마지막 숫자만 구하기
					var lastNo = seatNum.substring(seatNum.length-1);
					//현재 좌석상태 구하기
					var t = item.ticketStatus;
					//좌석이 비어있을 경우 □, 있을 경우 ■
					var status = (t == "N"? "□" : "■")
					
					content += status
					
					if(lastNo == 2){
						content += '&nbsp;'
					}
					if(lastNo == 8){
						content += '&nbsp;'
					}
					if(lastNo == 0){
						content += '<br/>'
					}
				})
				
				content +=	'</div>'
				content +=	'<div class="my-4">'
				content +=		'<img src="/cinemabox/resources/images/icon/txt-age-small-'+m.movieInfo.age+'.png" alt="" class="me-2">'
				if(m.movieInfo.age == "ALL"){
					content += '본 영화는  <span style="color:#5BC77E; text-decoration:underline;"><strong>전체관람가</strong></span> 영화입니다.'
				}
				if(m.movieInfo.age == "12"){
					content += '본 영화는 <span style="color:#4DD6FF; text-decoration:underline;"><strong>12세관람가</strong></span> 영화입니다.'
					content += '<span style="font-size:9px;">만 12세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에<br/>관람이 가능합니다. 연령 확인 불가 시 입장이 제한될 수 있습니다.</span>'
				}
				if(m.movieInfo.age == "15"){
					content +=	'본 영화는 <span style="color:#FFC134; text-decoration:underline;"><strong>15세관람가</strong></span> 영화입니다.<br/>'
					content +=	'<span style="font-size:9px;">만 15세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에<br/>관람이 가능합니다. 연령 확인 불가 시 입장이 제한될 수 있습니다.</span>'
				}
				if(m.movieInfo.age == "19"){
					content +=	'본 영화는 <span style="color:#ED4C6B; text-decoration:underline;"><strong>19세관람가</strong></span> 영화입니다.'
					content +=	'<span style="font-size:9px;">만 18세 미만의 고객님(영, 유아 포함)은 부모님 또는 성인 보호자를 동반하여도<br/>관람이 불가합니다. 또한 만 18세 이상이라도 재학중인 학생은 관람이 불가합니다.<br/>영화 관람 시, 반드시 신분증을 지참하여 주시기 바랍니다.</span>'
				}
				content +=	'</div>'
				content +='</div>'
				content +='<div class="modal-footer">'
				content +=	'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>'
				content +=	'<button type="button" class="btn btn-warning" id="btn-confirm">인원/좌석 선택</button>'
				content += '</div>'	
				
				$('#confirmModal > div > div').append(content);
				
				//form값 넣기
				$('#input-screening-no').val(screeningNo);
				$('#input-movie-no').val(movieNo);
				$('#input-theater-no').val(theaterNo);
				$('#input-hall-no').val(m.movieInfo.hallNo);
				$('#input-hall-name').val(m.movieInfo.hallName);
				$('#input-screening-date').val(screeningDate);
				$('#input-screening-time').val(time);
				$('#input-screening-end-time').val(endTime);
				$('#input-screening-status').val(m.movieInfo.screeningStatus);
				$('#input-title').val(m.movieInfo.title);
				$('#input-age').val(m.movieInfo.age);
				$('#input-movie-status').val(m.movieInfo.movieStatus);
			}
		})		
	}

	//일반 영화관 고르기
	$(".li-location1").click(function(){
		$(this).addClass('loc-act').siblings().removeClass('loc-act');
		location = $(this).text();
		
		displayTheater(location);
	});
	
	//특별관 있는 영화관 고르기
	$(".li-location2").click(function(){
		$(this).addClass('loc-act').siblings().removeClass('loc-act');
		var location = $(this).text();
		
		displaySpecialTheater(location);
	});
	
	$(".btn-select-theater").click(function(){
		$("#ul-location2").empty();
		$("#ul-special-location2").empty();
	})
	
	// 선택한 영화 타이틀 변경, 영화선택
	$('#ul-location2').on('click', 'li', function(){
		//선택한 극장명
		$(this).css({'font-weight':'bolder', 'color':'#ffc107'}).siblings().css({'font-weight':'normal', 'color':''});
		var theater = $(this).text();
		$("#div-theater>h5").empty().text(theater);
		
		//정렬값 구하기
		if(sort == null) {
			sort = "ticket";
		}
		
		//선택한 극장번호
		theaterNo = $(this).data('theater-no');
		
		$("#nav-entireTime").empty();
		
		//극장에서 상영중인 영화 가져오기
		displayMovieTime (theaterNo, screeningDate);
	})
	
	// 선택한 영화 타이틀 변경, 영화선택(특별관)
	$('#ul-special-location2').on('click', 'li', function(){
		//선택한 극장명
		$(this).css({'font-weight':'bolder', 'color':'#ffc107'}).siblings().css({'font-weight':'normal', 'color':''});
		var theater = $(this).text();
		$("#div-theater>h5").empty().text(theater);
		
		//정렬값 구하기
		if(sort == null) {
			sort = "ticket";
		}
		
		//선택한 극장번호
		theaterNo = $(this).data('theater-no');
		
		$("#nav-entireTime").empty();
		
		//극장에서 상영중인 영화 가져오기
		displayMovieTime (theaterNo, screeningDate);
	})
	
	// 선택한 영화 타이틀 변경(특별관), 극장선택
	$('#ul-special-location2').on('click', 'li', function(){
		//선택한 극장명
		$(this).css({'font-weight':'bolder', 'color':'#ffc107'}).siblings().css({'font-weight':'normal', 'color':''});
		var theater = $(this).text();
		$("#div-theater>h5").empty().text(theater);
		$("#div-movie>h5").empty().text('영화 선택');		
		
		//정렬값 구하기
		if(sort == null) {
			sort = "ticket";
		}
		
		//선택한 극장번호
		theaterNo = $(this).data('theater-no');
		
		$("#div-time-title").remove();
		$("#ul-list-time").empty();
		
		//극장에서 상영중인 영화 가져오기
		displayMovie(sort, theaterNo);
	})
	
	//13시이후, 19시이후 선택하는거에 따라 시간표 표시하기
	$(".tab-list").click(function(){
		var hour = $(this).data("hour");
		if(!hour){
			$("#ul-list-time li").show();
			return;
		}
		$("#ul-list-time li").hide().filter(function(){
			hour = parseInt(hour);
			var movieHour = $(this).find(".dd-time").text().substring(0,2);
			return movieHour - hour >= 0;
		}).show();
	})

	//날짜를 눌렀을 때 체크되게하기
	$('#ul-days').on('click', 'li', function(){
		//선택한 날짜 표시
		$(this).css({'font-weight':'bolder', 'border-bottom':'4px solid #ffc107'}).siblings().css({'font-weight':'', 'border-bottom':''});
		var ymd = $(this).data(ymd);
		$.each(ymd, function(index, item){
			$("#div-date>h5").empty().text(item);					
		})

		screeningDate = $(this).data('select-day');
		
		$("#nav-entireTime").empty();

		//극장, 영화번호, 선택한 날짜로 영화 시간 불러오기
		displayMovieTime (theaterNo, screeningDate);
	})
		
	changeDays();
	
	//최종 확인 팝업
	$('#nav-entireTime').on('click', 'li', (function(){
		$('#confirmModal').show();
		time = $(this).find(".dd-time").text();
		screeningNo = $(this).data('screening-no');
		movieNo = $(this).data('movie-no');
		displayConfirmModal(theaterNo, movieNo, screeningDate, time, screeningNo);
	}))
	
	$("#confirmModal").on('click','button#btn-confirm', function(){
		var isLogined = $("[name=isLogined]").val();
		if(isLogined == 'no'){
			alert("로그인이 필요한 서비스입니다.");
 			$('#confirmModal').hide();
 			loginModal.show();
			return;
		}
 		$("#form-ticketing").submit();
	})
	
	//항상 첫번째 있는 지역 선택되어 있게 하기
	$("#ul-location1 li:eq(0)").trigger("click");
	
	//오늘 날짜는 무조건 선택되어 있게 하기
	$('#ul-days li:eq(0)').trigger('click');
})
</script>
</body>
</html>