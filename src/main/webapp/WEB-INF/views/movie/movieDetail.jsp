<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/movieDetail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%-- moment cdnjs 한국어설정하기 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<title>CINEMABOX :: MOVIE</title>
<style>
	iframe{width: 100%;}
</style>
</head>
<body>
<div class="container-fluid">
	<%@include file="../common/header.jsp" %>
	<div id="movie-detail">
		<div class="container movie-info row">
			<div class="col-8 pt-5">
				<div class="d-flex justify-content-between" style="border-bottom: 1px solid gray;${fn:length(movieDetail.title) ge 15 ?'padding:15px 0 15px 0;':'padding-bottom:15px;' }">
					<h1 class="text-white" style="${fn:length(movieDetail.title) ge 15 ?'font-size:2rem;':'' }">${movieDetail.title}</h1>
					<div>
						<button class="btn btnStyle me-1 mt-2" id="btn-like">
							<c:choose>
								<c:when test="${wish.userId eq LOGINED_USER.id && wish.movieNo eq movieDetail.no}">
									<i class="fas fa-heart" style="color:red;"></i>&nbsp;
								</c:when>
								<c:otherwise>
									<i class="far fa-heart"></i>&nbsp;
								</c:otherwise>
							</c:choose>
							<span>${movieDetail.userLike}</span>
						</button>
						<button class="btn btnStyle mt-2" id="btn-share" data-bs-toggle="modal" data-bs-target="#modal-share"><i class="far fa-share-square"></i>&nbsp;공유하기</button>
					</div>
				</div>
				<div id="movie-info">
					<ul class="nav mt-3">
						<li class="tit">
							<strong>장르</strong>&nbsp;&nbsp;${movieDetail.genre}
							<span class="px-1" style="font-size: 10px; color:gray;">|</span>
						</li>
						<li class="tit">
							<fmt:formatDate value="${movieDetail.releaseDate }" pattern="yyyy.MM.dd"/>&nbsp;${movieDetail.status eq 'Y'?'개봉':'개봉예정'}
							<span class="px-1" style="font-size: 10px; color:gray;">|</span>
						</li>
						<li class="tit">${movieDetail.runningTime}분</li>
					</ul>
					<p class="tit m-0"><strong>감독</strong>&nbsp;&nbsp;${movieDetail.director}</p>
					<p class="tit m-0 mb-2"><strong>출연</strong>&nbsp;&nbsp;${movieDetail.casting}</p>
				</div>
				<div class="row info" style="${fn:length(movieDetail.casting) ge 77 ?'margin-top: 90px':'' }">
					<div class="text-end text-muted mb-3 px-3" id="div-current-time" style="font-size:0.7rem;"></div>
					<div class="score col text-center">
						<p class="tit">평점</p>
						<p class="cont"><i class="fas fa-star-half-alt"></i>&nbsp;<fmt:formatNumber value="${movieDetail.rating}" pattern="0.00" />점</p>
					</div>
					<div class="rating col text-center">
						<c:set value="${movieDetail.reservationRate}" var="rate"/>
						<p class="tit">예매율</p>
						<p class="cont">
							<i class="fas fa-ticket-alt"></i>&nbsp;
							<fmt:formatNumber value="${movieDetail.status eq 'Y'?rate:'0'}" pattern="0" />%
						</p>
					</div>
					<div class="audience col text-center">
						<p class="tit">누적 관객수</p>
						<p class="cont"><i class="fas fa-users"></i>&nbsp;<fmt:formatNumber value="${movieDetail.cumulativeAudienceCnt }" type="number" /> 명</p>
					</div>
				</div>
				<button class="btn btn-warning col-12 mt-2 fw-bold" 
				onclick="location.href='ticket?location=서울&theaterNo=10001&movieNo=${movieDetail.no }'" 
				${movieDetail.status eq 'Y'?'': 'disabled'}>
					${movieDetail.status eq 'Y'?'예매하기': '개봉예정'}
				</button>
			</div>
			<div class="col-4">
				<div class="poster p-5">
					<img src="/cinemabox/resources/images/movie/${movieDetail.no}.jpg" class="rounded-3 shadow">
				</div>
			</div>
		</div>
	</div>
				
	<div class="content container my-5">
		<!-- 탭 -->
		<nav>
			<div class="nav nav-tabs nav-pills nav-fill" id="nav-tab" role="tablist">
				<button class="nav-link text-body active" id="nav-movie-tab"
					data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
					role="tab" aria-controls="nav-home" aria-selected="true">영화정보</button>
				<button class="nav-link text-body" id="nav-review-tab" data-bs-toggle="tab"
					data-bs-target="#nav-profile" type="button" role="tab"
					aria-controls="nav-profile" aria-selected="false">평점 및 관람평 (${reviewCnt })</button>
			</div>
		</nav>
		<!-- 영화정보 -->
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
				<div class="row mt-4" id="synopsis">
					<h5 class="bg-warning py-2 text-center"><strong>시놉시스</strong></h5>
					<p class="mt-2" style="color:#212529; font-size:0.9em;">
						<c:choose>
							<c:when test="${empty movieDetail.synopsis }">
								${movieDetail.synopsis}
							</c:when>
							<c:otherwise>
								${movieDetail.synopsisWithBr}
							</c:otherwise>
						</c:choose>
					</p>
				</div>
<!-- 				<div class="row mt-4" id="chart"> -->
<!-- 					<h5 class="mb-4"><strong>예매분포(이부분은 빠질 수도 있음)</strong></h5> -->
<!-- 					<div class="col border p-3 text-center justify-content-center"> -->
<!-- 						<h6 class="mb-5" style="font-size:14px;"><strong>평점</strong></h6> -->
<!-- 						<div style="width: 120px; height: 120px; border-radius: 120px; background:#ffc107; display: inline-block;"> -->
<!-- 							<span style="font-size: 34px; line-height: 120px; color:white;"> -->
<!-- 								<strong> -->
<%-- 									<fmt:formatNumber value="${movieDetail.rating}" pattern="0.0" /> --%>
<!-- 								</strong> -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col border p-3 text-center"> -->
<!-- 						<h6 style="font-size:14px;"><strong>예매율</strong></h6> -->
<!-- 						<canvas id="chart-rate" style="height:25vh; width:20vw"></canvas> -->
<!-- 					</div> -->
<!-- 					<div class="col border p-3 text-center"> -->
<!-- 						<h6 style="font-size:14px;"><strong>관객수</strong></h6> -->
<!-- 						<canvas id="chart-audience" style="height:25vh; width:20vw"></canvas> -->
<!-- 					</div> -->
<!-- 				</div>				 -->
				<div class="row mt-4" id="trailer">
					<h5 class="mb-4 bg-warning py-2 text-center"><strong>트레일러</strong></h5>
					<div class="col-6">
						${movieDetail.trailerFirst}
					</div>
					<div class="col-6">
						${movieDetail.trailerSecond}
					</div>
				</div>
			</div>
			<!-- 평점 및 관람평 -->
			<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
				<div class="row mt-5">
			        <div class="col-md-12">
						<form action="movieDetail?no=${movieDetail.no}" method="post" class="fomr-review"> 
							<div class="justify-content-center row">
								<div class="col-12 input-group">
									<div class="stars col-2 p-0 px-1">
											<label class="rate">
												<input type="radio" name="radio1" id="star1" value="1">
												<div class="face"></div>
												<i class="far fa-star star one-star"></i>
											</label>
											<label class="rate">
												<input type="radio" name="radio1" id="star2" value="2">
												<div class="face"></div>
												<i class="far fa-star star two-star"></i>
											</label>
											<label class="rate">
												<input type="radio" name="radio1" id="star3" value="3">
												<div class="face"></div>
												<i class="far fa-star star three-star"></i>
											</label>
											<label class="rate">
												<input type="radio" name="radio1" id="star4" value="4">
												<div class="face"></div>
												<i class="far fa-star star four-star"></i>
											</label>
											<label class="rate">
												<input type="radio" name="radio1" id="star5" value="5">
												<div class="face"></div>
												<i class="far fa-star star five-star"></i>
											</label>
									</div>
									<div class="input-group col pt-1" id="div-review">
										<textarea class="form-control" placeholder="${empty LOGINED_USER ?'로그인 후 작성 가능합니다.':'관람평을 작성해주세요.'}" ${empty LOGINED_USER ?"readonly":""} style="resize: none; height: 45px;"></textarea>
										<button type="button" id="btn-review" class="btn btn-warning" ${empty LOGINED_USER ?"disabled":""}>작성</button>
										<span style="color:#aaa; font-size:0.7rem;" id="counter" class="col-12 text-end">(0 / 최대 45자)</span>
									</div>
								</div>
							</div>
						</form>
			        </div>
			    </div>
		        <div class="comment mt-5">
		        <!-- 댓글시작 -->
	        		<c:choose>
	        			<c:when test="${empty reviews }">
	        				<p class="text-center">아직 등록된 리뷰가 없습니다. 리뷰를 남겨보세요!</p>
	        			</c:when>
	        			<c:otherwise>
			        		<c:forEach items="${reviews }" var="review">
					        	<div class="row mb-1 border" id="div-review">
						        	<div class="col-1 p-3 text-center align-self-center">
						        		<c:choose>
							        		<c:when test="${review.rating eq 1 }">
								        		<i class="far fa-frown fs-2 text-warning"></i>
							        		</c:when>
							        		<c:when test="${review.rating eq 2 }">
								        		<i class="far fa-meh fs-2 text-warning"></i>
							        		</c:when>
							        		<c:when test="${review.rating eq 3 }">
								        		<i class="far fa-smile fs-2 text-warning"></i>
							        		</c:when>
							        		<c:when test="${review.rating eq 4 }">
								        		<i class="far fa-grin fs-2 text-warning"></i>
							        		</c:when>
							        		<c:when test="${review.rating eq 5 }">
								        		<i class="far fa-laugh-beam fs-2 text-warning"></i>
							        		</c:when>
						        		</c:choose>
						        	</div>
						        	<div class="col-2 p-3 bg-light align-self-center">
						        		<c:set var="userid" value="${review.userId }"></c:set>
						        		${fn:substring(userid, 0, fn:length(userid) - 3)}***
						        		<span style="font-size:8px; color:gray;"> | </span>
						        		<span style="font-size:12px;"><span style="color:#ffc107;">★</span>${review.rating }</span>
						        	</div>
						        	<div class="col-9 p-3" id="div-delete">
						        		<span style="vertical-align: -webkit-baseline-middle;">${review.content}</span>
						        		<c:if test="${LOGINED_USER.id eq review.userId}">
							        		<button class="btn float-end text-danger" id="btn-review-delete"><i class="fas fa-times"></i></button>
						        		</c:if>
						        	</div>
					        	</div>
				        	</c:forEach>
	        			</c:otherwise>
	        		</c:choose>
		        </div>
			</div>
		</div>
	</div>
	
	<!-- 공유하기 모달 -->
	<div class="modal fade" id="modal-share" tabindex="-1"	aria-labelledby="modal-share-title" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header justify-content-center bg-dark text-white">
					<h5 class="modal-title" id="modal-share-title" style="font-size:1rem;"><strong>공유하기</strong></h5>
				</div>
				<div class="modal-body">
					<input type="text" class="form-control" id="input-share-link" readonly/>
					<div class="text-center mt-3">
						<button id="btn-facebook" class="btn"><img src="/cinemabox/resources/images/icon/icon-facebook.png" alt="facebook"></button>
						<button id="btn-twitter" class="btn"><img src="/cinemabox/resources/images/icon/icon-twitter.png" alt="twitter"></button>
						<button id="btn-line" class="btn"><img src="/cinemabox/resources/images/icon/icon-line.png" alt="line"></button>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-warning" id="btn-link-copy">주소복사</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">
$(function(){
	//로그인한 사용자
	var userId = '${LOGINED_USER.id}';
	//현재 영화 번호
	var movieNo = '${param.no}';
	//영화썸네일번호
	var posterNo = ${movieDetail.no};

	//뒷배경
	$("#movie-detail>.container").css("background", "linear-gradient(to right, rgba(0, 0, 0, 1),rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 1)),url(/cinemabox/resources/images/movie/"+posterNo+".jpg)");

	//찜, 공유 마우스오버 시 아이콘 색상 변경
	$('#btn-like').mouseover(function(){
		$(this).children('i').removeClass('far').addClass('fas').css('color','red');
	})
	$('#btn-like').mouseleave(function(){
		$(this).children('i').removeClass('fas').addClass('far').css('color','white');
	})
	
	$('#btn-share').mouseover(function(){
		$(this).children('i').removeClass('far').addClass('fas').css('color','#ffc107');
	})
	$('#btn-share').mouseleave(function(){
		$(this).children('i').removeClass('fas').addClass('far').css('color','white');
	})
	
	/* 공유하기 */
	//공유하기 주소 출력
	var shareLink = $(location).attr('href');
	$("#input-share-link").val(shareLink);
	//복사 버튼 눌렀을 때 복사되게 하기
    $('#btn-link-copy').click(function() {
    	$("#input-share-link").select();
    	document.execCommand('copy');
        alert('주소를 복사하였습니다');
    });
	
	//페이스북
    $(document).on('click', '#btn-facebook', function() {
        var gotoUrl = encodeURIComponent(shareLink),
            facebook = 'http://www.facebook.com/sharer/sharer.php?u=',
            link = facebook + gotoUrl;

            window.open(link);

            return false;
	})  
	
	//네이버
	$(document).on('click', '#btn-twitter', function() {
	    var gotoUrl = encodeURIComponent(shareLink),
	        twitter = 'https://twitter.com/intent/tweet?text=' + '${movieDetail.title}' + '&url=',
	        link = twitter + gotoUrl;
	
	        window.open(link);
	})  
	
	//라인
	$(document).on('click', '#btn-line', function() {
    var gotoUrl = encodeURIComponent($(this).closest('.share').data('share')),
        line = 'https://social-plugins.line.me/lineit/share?url=',
        link = line + gotoUrl;

        window.open(link);

        return false;
  }) 
	
	//찜하기
	$("#btn-like").click(function(){
		if(!userId){
			alert('로그인 후 이용 가능합니다.');
			return;
		}
		$.ajax({
			type:"post",
			url:"boxoffice/like",
			data:{movieNo:movieNo, userId:userId},
			success:function(result){
				if(!result){
					$("#btn-like").find('i').removeClass('fas').addClass('far').css('color','white');
				}else{
					$("#btn-like").find('span').text(result.userLike);
					$("#btn-like").find('i').removeClass('far').addClass('fas').css('color','red');
				}
			}
		})
	});
	
	//현재 시간 표시
	var curruntTime = moment().format('YYYY/MM/DD HH:mm');
	$("#div-current-time").text('현재시간기준 : ' + curruntTime);
	
	//star rating(별점)
	$(document).on({
		mouseover: function(event) {
			$(this).find('.far').addClass('star-over');
			$(this).prevAll().find('.far').addClass('star-over');
		},
		mouseleave: function(event) {
			$(this).find('.far').removeClass('star-over');
			$(this).prevAll().find('.far').removeClass('star-over');
		}
	}, '.rate');

	$(document).on('click', '.rate', function() {
		if ( !$(this).find('.star').hasClass('rate-active') ) {
			$(this).siblings().find('.star').addClass('far').removeClass('fas rate-active');
			$(this).find('.star').addClass('rate-active fas').removeClass('far star-over');
			$(this).prevAll().find('.star').addClass('fas').removeClass('far star-over');
		} else {
			console.log('has');
		}
	});
	
	//textarea 체크
	$('#div-review > textarea').keyup(function (e){
	    var con = $(this).val();
	    $('#counter').html("("+con.length+" / 최대 45자)");    //글자수 실시간 카운팅

	    if (con.length > 45){
	        alert("최대 45자까지 입력 가능합니다.");
	        $(this).val(con.substring(0, 45));
	        $('#counter').html("(45 / 최대 45자)");
	    }
	});

	//관람평 등록
	var point = 0;
	$("[name='radio1']").click(function(){
		point = $(this).val();		
	})

	$("#btn-review").click(function(){
		var content = JSON.stringify($('#div-review textarea').val()).replace(/\"/gi, "");
		var rating = JSON.parse(point);
		
		if(point == 0){
			alert('별점을 선택하세요');
			return;
		}
		if(!($('#div-review textarea').val())){
			alert('내용을 입력하세요')
			$('#div-review textarea').focus();
			return;
		}

		$.ajax({
			type:"POST",
			url:"boxoffice/review",
			data:{content:content, rating:rating, userId:userId, movieNo:movieNo},
			success: function(result){
				if(!result){
					alert('고객님은 이미 관람평을 등록하였습니다.');
					return;
				}else{
					alert('관람평이 등록되었습니다.');
					$(".comment").empty();
					$(".comment>p").remove();
					$('#div-review textarea').val('');
					$.each(result, function(index, item){
						var content = '<div class="row mb-1 border" id="div-review">'
							content += '<div class="col-1 p-3 text-center align-self-center">'
							if(item.rating == 1){
					        	content += '<i class="far fa-frown fs-2 text-warning"></i>'
							}
							if(item.rating == 2){
								content += '<i class="far fa-meh fs-2 text-warning"></i>'							
							}
							if(item.rating == 3){
								content += '<i class="far fa-smile fs-2 text-warning"></i>'							
							}
							if(item.rating == 4){
								content += '<i class="far fa-grin fs-2 text-warning"></i>'							
							}
							if(item.rating == 5){
								content += '<i class="far fa-laugh-beam fs-2 text-warning"></i>'							
							}
							content += '</div>'
							content += '<div class="col-2 p-3 bg-light align-self-center">'
							content += (item.userId).slice(0,-3)+'***'
							content += '<span style="font-size:8px; color:gray;"> | </span>'
							content += '<span style="font-size:12px;"><span style="color:#ffc107;">★</span>'
							content += item.rating
							content += '</span>'
							content += '</div>'
							content += '<div class="col-9 p-3" id="div-delete">'
							content += '<span style="vertical-align: -webkit-baseline-middle;">'
							content += item.content
							content += '</span>'
							if(item.userId == userId){
								content += '<button class="btn float-end text-danger" id="btn-review-delete"><i class="fas fa-times"></i></button>'
							}
							content += '</div>'
							content += '</div>'
						$(".comment").append(content);
					})
				}
			}
		})
	})
	
	//관람평 삭제
	$(".comment").on('click','#btn-review-delete',(function(){
		$.ajax({
			type:"POST",
			url:"boxoffice/delete",
			data:{movieNo:movieNo, userId:userId},
			success: function(result){
				alert('관람평이 삭제되었습니다.');
				$(".comment").empty();
				$(".comment>p").remove();
				$('#div-review textarea').val('');
				$.each(result, function(index, item){
					var content = '<div class="row mb-1 border" id="div-review">'
						content += '<div class="col-1 p-3 text-center align-self-center">'
						if(item.rating == 1){
				        	content += '<i class="far fa-frown fs-2 text-warning"></i>'
						}
						if(item.rating == 2){
							content += '<i class="far fa-meh fs-2 text-warning"></i>'							
						}
						if(item.rating == 3){
							content += '<i class="far fa-smile fs-2 text-warning"></i>'							
						}
						if(item.rating == 4){
							content += '<i class="far fa-grin fs-2 text-warning"></i>'							
						}
						if(item.rating == 5){
							content += '<i class="far fa-laugh-beam fs-2 text-warning"></i>'							
						}
						content += '</div>'
						content += '<div class="col-2 p-3 bg-light align-self-center">'
						content += (item.userId).slice(0,-3)+'***'
						content += '<span style="font-size:8px; color:gray;"> | </span>'
						content += '<span style="font-size:12px;"><span style="color:#ffc107;">★</span>'
						content += item.rating
						content += '</span>'
						content += '</div>'
						content += '<div class="col-9 p-3" id="div-delete">'
						content += '<span style="vertical-align: -webkit-baseline-middle;">'
						content += item.content
						content += '</span>'
						if(item.userId == userId){
							content += '<button class="btn float-end text-danger" id="btn-review-delete"><i class="fas fa-times"></i></button>'
						}
						content += '</div>'
						content += '</div>'
						
					$(".comment").append(content);
				})
			}
		})		
	}))
	
// 	//예매율 chart
// 	var ctr = document.getElementById("chart-rate");
// 	var chartRate = new Chart(ctr, {
// 	    type: 'bar',
// 	    data: {
// 	        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
// 	        datasets: [{
// 	            label: '타이틀써야함',
// 	            data: [12, 19, 3, 5, 2, 3],
// 	            backgroundColor: [
// 	                'rgba(255, 99, 132, 0.2)',
// 	                'rgba(54, 162, 235, 0.2)',
// 	                'rgba(255, 206, 86, 0.2)',
// 	                'rgba(75, 192, 192, 0.2)',
// 	                'rgba(153, 102, 255, 0.2)',
// 	                'rgba(255, 159, 64, 0.2)'
// 	            ],
// 	            borderColor: [
// 	                'rgba(255,99,132,1)',
// 	                'rgba(54, 162, 235, 1)',
// 	                'rgba(255, 206, 86, 1)',
// 	                'rgba(75, 192, 192, 1)',
// 	                'rgba(153, 102, 255, 1)',
// 	                'rgba(255, 159, 64, 1)'
// 	            ],
// 	            borderWidth: 1
// 	        }]
// 	    },
// 	    options: {
// 	        scales: {
// 	            yAxes: [{
// 	                ticks: {
// 	                    beginAtZero:true
// 	                }
// 	            }]
// 	        }
// 	    }
// 	});
	
// 	//관객수 chart
// 	var cta = document.getElementById("chart-audience");
// 	var chartAudience = new Chart(cta, {
// 	    // The type of chart we want to create
// 	    type: 'line',
	
// 	    // The data for our dataset
// 	    data: {
// 	        labels: ['March', 'April', 'May', 'June', 'July'],
// 	        datasets: [{
// 	            label: 'My First dataset',
// 	            backgroundColor: 'rgb(255, 99, 132)',
// 	            borderColor: 'rgb(255, 99, 132)',
// 	            data: [0, 10, 5, 2, 20, 30, 45]
// 	        }]
// 	    },
	
// 	    // Configuration options go here
// 	    options: {}
// 	});	
	
})


</script>
</body>
</html>