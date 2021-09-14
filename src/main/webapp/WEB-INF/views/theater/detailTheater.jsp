<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<!-- moment cdnjs 한국어설정하기 --!>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<!-- 카카오지도 API 실행코드보다 먼전 선언될것-->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b31752a091fc9be4dd391da8fbc46e58"></script>
<!-- 카카오지도 API 실행코드보다 먼전 선언될것-->
<!-- 카카오지도 services,clusterer,drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<!-- 카카오지도 services,clusterer,drawing 라이브러리 불러오기 -->

<title>극장상세|CINEMA BOX</title>
<style type="text/css">
.balloon {
	margin: 10px;
	width: 1100px;
	height: auto;
	overflow: hidden;
	background: white;
	border-radius: 10px;
}

.balloon:after {
	border-top: 0px solid transparent;
	border-left: 10px solid transparent;
	border-right: 10px solid transparent;
	border-bottom: 10px solid white;
	content: "";
	top: -10px;
	left: 200px;
}

.locationNav {
	width: 160px;
}

.nav-justified {
	border-bottom: none;
}

.day-act {
	background: white !important;
}

.btn-day {
	background: none;
	border: none;
}
.overlaybox {position:relative;width:360px;height:350px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
.overlaybox div, ul {overflow:hidden;margin:0;padding:0;}
.overlaybox li {list-style: none;}
.overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}
.overlaybox .first {position:relative;width:247px;height:136px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumb.png') no-repeat;margin-bottom:8px;}
.first .text {color:#fff;font-weight:bold;}
.first .triangle {position:absolute;width:48px;height:48px;top:0;left:0;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/triangle.png') no-repeat; padding:6px;font-size:18px;}
.first .movietitle {position:absolute;width:100%;bottom:0;background:rgba(0,0,0,0.4);padding:7px 15px;font-size:14px;}
.overlaybox ul {width:247px;}
.overlaybox li {position:relative;margin-bottom:2px;background:#2b2d36;padding:5px 10px;color:#aaabaf;line-height: 1;}
.overlaybox li span {display:inline-block;}
.overlaybox li .number {font-size:16px;font-weight:bold;}
.overlaybox li .title {font-size:13px;}
.overlaybox li .up {background-position:0 -40px;}
.overlaybox li .down {background-position:0 -60px;}
.overlaybox li:hover {color:#fff;background:#d24545;}
.overlaybox li:hover .up {background-position:0 0px;}
.overlaybox li:hover .down {background-position:0 -20px;} 
</style>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../common/header.jsp"%>
		<div class="row mt-5" id="theaterDetailPage">
			<div class="col-12"
				style="background-image: url('resources/images/theaterDetail/img-theater-detail.png'); background-size: cover; background-position: center center; height: 250px;">
				<div class="row">
					<div class="col-12">
						<nav class="navbar navbar-expand-lg navbar-light">
							<div class="container-fluid">
								<div class="collapse navbar-collapse justify-content-center"
									id="navbarNavAltMarkup"
									style="border-bottom: 1px solid rgba(255, 255, 255, .15);">
									<div>
										<ul class="navbar-nav me-auto mb-2 mb-lg-0 text-center">
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">서울</a></li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">경기</a></li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">인천</a></li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">대전/충청/세종</a>
											</li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">부산/대구/경상</a>
											</li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">광주/전라</a>
											</li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">강원</a></li>
										</ul>
										<div class="balloon row p-3 shadow" id="balloonAjax"
											style="display: none; position: relative; z-index: 2; font-size: 13px">
										</div>
									</div>
								</div>
							</div>
						</nav>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-12">
						<h1 class="text-white text-center" id="theaterNm">${location.theaterName }</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<!-- 극장 상세정보 탭 -->
		<div class="row my-5">
			<div class="col-12">
				<ul class="nav nav-tabs nav-justified">
					<li class="nav-item"
						style="border-top: 2px solid #ffc107; border-left: 2px solid #ffc107; border-right: 2px solid #ffc107">
						<a class="nav-link text-body theaterInfoNav" href="#">극장정보</a>
					</li>
					<li class="nav-item"><a
						class="nav-link text-body screeningTimeNav" href="#">상영시간표</a></li>
					<li class="nav-item"><a
						class="nav-link text-body moviePriceNav" href="#">관람료</a></li>
				</ul>
			</div>
		</div>
		<!-- 극장 상세정보 탭 -->

		<!-- 극장 상세정보 탭(극장정보) -->
		<div class="theaterInfo">
			<!-- 극장 소개 -->
			<div class="row mt-2">
				<div class="col-11">
					<div class="theaterContentFirst">
						<h3>${theaterDto.content}</h3>
					</div>
					<div class="theaterContentMerit mt-4"
						style="border-bottom: 1px solid #ebebeb;">
						<p>
							${theaterDto.contentMerit}
						</p>
					</div>
				</div>
			</div>
			<!-- 극장 소개 -->

			<!-- 시설안내 -->
			<div class="row mt-5">
				<div class="col-12">
					<h4>시설안내</h4>
				</div>
				<div class="col-12 mt-3">
					<h5>보유시설</h5>
				</div>
				<div class="col-3 theaterFacility" id="facilityData" data-facility="${theaterDto.theaterFacility}">
					<table class="table table-borderless">
						<thead class="text-center">
							<tr id="theader">
							
							</tr>
						</thead>
						<tbody class="text-center">
							<tr id="tbodyDown">
								
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-12 mt-3">
					<h5>층별안내</h5>
				</div>
				<div class="col-12">
					<ul>
						<li id="floorInfo">${theaterDto.floor1}</li>
						<li id="floorInfo">${theaterDto.floor2}</li>
						<li id="floorInfo">${theaterDto.floor3}</li>
						<li id="floorInfo">${theaterDto.floor4}</li>
						<li id="floorInfo">${theaterDto.floor5}</li>
						<li id="floorInfo">${theaterDto.floor6}</li>
						<li id="floorInfo">${theaterDto.floor7}</li>
					</ul>
				</div>
			</div>
			<!-- 시설안내 -->

			<!-- 교통안내 -->
			<div class="row mt-1">
				<div class="col-12">
					<h4>교통안내</h4>
				</div>
				<div class="col-12 mt-2">
					<h5>약도</h5>
					<ul>
						<li id="theaterAddress">${theaterDto.theaterAddress}</li>
					</ul>
				</div>
				<!-- kakaoMapAPI -->
				<div class="col-12 kakaoMap mt-1">
					<button type="button" class="btn btn-lg text-white" data-bs-toggle="modal" id="latLng" data-bs-target="#mapBtn" 
						data-lng="${theaterDto.theaterLongitude }" data-lat="${theaterDto.theaterLatitude }" style="background-color: #ffc107">
						<i class="fas fa-map-marked-alt"></i> 약도보기
					</button>
					<div class="modal" tabindex="-1" id="mapBtn">
						<div class="modal-dialog modal-dialog-centered modal-lg">
							<div class="modal-content">
								<div class="modal-header text-white"
									style="background-color: #ffc107">
									<h5 class="modal-title">오시는길 안내</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="kakaoMap">
										<!-- 지도 담을 영역 -->
										<div id="map" style="width: 100%; height: 500px;"></div>
										<!-- 지도 담을 영역 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- kakaoMapAPI -->
			</div>
			<!-- 교통안내 -->

			<!-- 주차 -->
			<div class="row mt-5">
				<div class="col-12 mt-2">
					<h5>주차</h5>
				</div>
			</div>
			<div style="border: 1px solid #ebebeb;">
				<div class="row">
					<div class="col-2 my-3 text-center">
						<img alt="" src="resources/images/theaterDetail/parking1.png"
							width="70px" height="70">
					</div>
					<div class="col-10 my-3">
						<p>주차안내</p>
						<ul style="padding: 0px 250px 0px 20px;">
							<li>${theaterDto.parkingInfo }</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-2 my-3 text-center">
						<img alt="" src="resources/images/theaterDetail/parking2.png"
							width="70px" height="70">
					</div>
					<div class="col-10 my-3">
						<p>주차확인</p>
						<ul style="padding: 0px 250px 0px 20px;">
							<li>${theaterDto.parkingConfirm }</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-2 my-3 text-center">
						<img alt="" src="resources/images/theaterDetail/parking3.png"
							width="70px" height="70">
					</div>
					<div class="col-10 my-3">
						<p>주차요금</p>
						<ul style="padding: 0px 250px 0px 20px;">
							<li>${theaterDto.parkingPrice }</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 주차 -->

			<!-- 이벤트 -->
			<div class="row mt-5">
				<div class="col-6 text-start">
					<h4>이벤트</h4>
				</div>
				<div class="col-6 text-end more">
					<a href="event/main" style="text-decoration: none; color: black;">더보기 <i class="fas fa-sign-in-alt"></i></a>
				</div>
			</div>
			<div class="row">
				<div class="col-6 d-flex justify-content-center">
							<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" style="width: 400px; height: 185px;">
								<div class="carousel-inner">
									<div class="carousel-item" data-bs-interval="2000">
										<a href="event/lotto" ><img style="width: 400px; height: 185px; background: bisque;" src="resources/images/event/magic3.png" alt="<팜 스프링스> 현장 경품 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=1"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/5d4fca77c7f549998ed563d9d2345b6e.jpg" alt="<남색대문> 현장경품 이벤트"></a>
									</div>
									<div class="carousel-item active" data-bs-interval="3000">
										<a href="event/detail?no=2"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/e8c94a452a5a4bd0b9e61dee1f16ea19.jpg" alt="<보스베이비> 스페셜 퍼즐 증정 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=3"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/33284260ba2b4e2995499535d18365fd.jpg" alt="영화 더스파이 현장경품이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=4"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/199f530329ab4bf0af39c059c2f29817.jpg" alt="<모가디슈> 관람 인증 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=5"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/6830cb7253804ce7a6f6312a393385ce.jpg" alt="<퍼피구조대 더 무비> 현장경품 이벤트"></a>
									</div>
								</div>
							</div>	
					</div>
					<div class="col-6 d-flex justify-content-center">
							<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" style="width: 400px; height: 185px;">
								<div class="carousel-inner">
									<div class="carousel-item active" data-bs-interval="2000">
										<a href="event/lotto" ><img style="width: 400px; height: 185px; background: bisque;" src="resources/images/event/magic3.png" alt="<팜 스프링스> 현장 경품 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=1"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/5d4fca77c7f549998ed563d9d2345b6e.jpg" alt="<남색대문> 현장경품 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=2"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/e8c94a452a5a4bd0b9e61dee1f16ea19.jpg" alt="<보스베이비> 스페셜 퍼즐 증정 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=3"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/33284260ba2b4e2995499535d18365fd.jpg" alt="영화 더스파이 현장경품이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=4"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/199f530329ab4bf0af39c059c2f29817.jpg" alt="<모가디슈> 관람 인증 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=5"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/6830cb7253804ce7a6f6312a393385ce.jpg" alt="<퍼피구조대 더 무비> 현장경품 이벤트"></a>
									</div>
								</div>
							</div>	
					</div>
			</div>
			<!-- 이벤트 -->

			<!-- 공지사항 -->
			<div class="row mt-5">
				<div class="col-6 text-start">
					<h4>공지사항</h4>
				</div>
				<div class="col-6 text-end more">
					<a href="notice/list" style="text-decoration: none; color: black;">더보기 <i class="fas fa-sign-in-alt"></i></a>
				</div>
				<div class="col-12">
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th class="text-center">제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList }" var="notice">
								<tr>
									<td>${notice.no }</td>
									<td><a href="notice/detail?no=${notice.no }" class="noticeLink" style="text-decoration: none; color: black">${notice.title }</a></td>
									<td><fmt:formatDate value="${notice.creatDate }" pattern="yyyy.MM.dd"/></td>
									<td>${notice.hits }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 공지사항 -->

			<!-- 스토어 상품-->
			<div class="row mt-5">
				<div class="col-6 text-start">
					<h4>스토어 상품</h4>
				</div>
				<div class="col-6 text-end more">
					<a href="gift" style="text-decoration: none; color: black;">스토어 <i class="fas fa-sign-in-alt"></i></a>
				</div>
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			    <c:choose>
					<c:when test="${empty snacks }">
						<tr>
							<td class="text-center" colspan="12">등록된 SNACK정보가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="snack" items="${snacks }">
					        <div class="col mb-5">
					            <div class="card h-100">
					            	<c:if test="${snack.name eq 'CINEMABOX 콤보'}">
					            	<div class="badge bg-dark text-white position-absolute" style="top: 0.9rem; laft: 0.5rem;">대표 상품</div>
					            	</c:if>
					            	<c:if test="${snack.name eq '더블 콤보'}">
					            	<div class="badge bg-danger text-white position-absolute" style="top: 0.9rem; laft: 0.5rem;">BEST</div>
					            	</c:if>
					                <!-- Product image-->
					                <a href="snackDetail?snackNo=${snack.snackNo }">
					                	<img class="card-img-top" src="/cinemabox/resources/images/snack/${snack.snackNo }.jpg" alt="${snack.name } 상세보기" />
									</a>
					                <!-- Product details-->
					                <div class="card-body p-4">
					                    <div class="text-center">
					                        <h4 class="fw-bolder">${snack.name } </h4>
					                        <p class="bundle">${snack.detail }</p>
					                        <hr>
					                        <br><strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${snack.price }" /> 원</strong>
					                    </div>
					                </div>
					                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
					                    <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="snackDetail?snackNo=${snack.snackNo }">구매하기</a></div>
					                </div>
					            </div>
					        </div>
				        </c:forEach>
		       		</c:otherwise>
		        </c:choose>
	        </div>
			<!-- 스토어 상품-->
		</div>
		<!-- 극장 상세정보 탭(극장정보) -->

		<!-- 극장 상세정보 탭(상영시간표) -->
		<div class="screeningTime" style="display: none;">
			<div class="row mt-2">
				<div class="col-12">
					<h4>상영시간표</h4>
				</div>
			</div>
			<div class="row mt-1">
				<div class="col-12 wrap">
					<div class="p-3 row" id="div-days">
						<button class="btn-day float-start col-1" id="btn-prev"
							disabled="disabled">
							<i class="fas fa-chevron-left"></i>
						</button>
						<ul id="ul-days" class="m-0 col-10 text-center">
							<!-- 날짜출력 -->
						</ul>
						<button class="btn-day float-end col-1" id="btn-next">
							<i class="fas fa-chevron-right"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="row mt-1">
				<div class="col-10">
					<i class="bi bi-sun" style="color: #ffc107"></i>조조
					<i class="fas fa-mug-hot" style="color: #ffc107"></i>브런치
					<i class="far fa-moon" style="color: #ffc107"></i>심야
				</div>
				<div class="col-2 text-end">
					<button type="button" class="btn" data-bs-toggle="modal"
						data-bs-target="#exampleModal">
						<i class="bi bi-exclamation-circle" style="color: #ffc107"></i><span style="color: #ffc107"> 관람등급안내</span>
					</button>
					<div class="modal" tabindex="-1" id="exampleModal">
						<div class="modal-dialog modal-dialog-centered modal-lg">
							<div class="modal-content">
								<div class="modal-header text-white"
									style="background-color: #ffc107">
									<h5 class="modal-title">관람등급 안내</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<table class="table table-hover">
										<colgroup>
											<col width="25%">
											<col width="75%">
										</colgroup>
										<thead class="table-light">
											<tr>
												<th class="text-center">등급명</th>
												<th class="text-center">설명</th>
											</tr>
										</thead>
										<tbody class="text-start">
											<tr>
												<td>
												<img alt="전체관람" src="resources/images/theaterDetail/txt-age-small-ALL.png">전체관람
												</td>
												<td>모든 연령의 고객이 관람 가능</td>
											</tr>
											<tr>
												<td><img alt="12세 이상"
													src="resources/images/theaterDetail/txt-age-small-12.png">12세
													이상</td>
												<td>
													<p>만 12세 이상(주민등록상 생일기준) 관람 가능</p>
													<p>만 12세 미만 고객은 보호자(성인) 동반 시 관람 가능</p>
												</td>
											</tr>
											<tr>
												<td><img alt="15세 이상"
													src="resources/images/theaterDetail/txt-age-small-15.png">15세
													이상</td>
												<td>
													<p>만 15세 이상(주민등록상 생일기준) 관람 가능</p>
													<p>만 15세 미만 고객은 보호자(성인) 동반 시 관람 가능</p>
												</td>
											</tr>
											<tr>
												<td><img alt="청불"
													src="resources/images/theaterDetail/txt-age-small-19.png">청소년
													관람불가</td>
												<td>
													<p>만 18세 이상(주민등록상 생일기준) 관람 가능</p>
													<p>- 만 18세 이상이더라도 고등학교 재학중인 경우 관람 불가</p>
													<p>- 신분증을 지참 필수(구매, 입장 시 신분증 확인)</p>
													<p>만 18세 미만 고객은 보호자(성인) 동반 시에도 관람 불가</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 일자별 영화관 스케쥴 -->
			<script type="text/javascript">
				$(function(){
					var theaterNo = '${param.no}';
					var screeningDate = moment().format("YYYYMMDD");
					var movieNo;
					var screeningNo;
					var hallNo;
					var hallName;
					var screeningDate;
					var screeningTime;
					var screeningEndTime;
					var title;
					var age;
					var theaterName;
					
					function displayMovieList(){
						$.ajax({
							type:"get",
							url:"theater/schedule",
							data:{theaterNo:theaterNo, screeningDate:screeningDate},
							dataType:"json",
							success:(function(result){
								$.each(result, function(index, dto){
									var content =
										'<div class="row mt-2 bg-light p-2">'
									content +=
											'<div class="col-6">'
									content +=
												'<img alt="'+dto.age+'" src="resources/images/theaterDetail/txt-age-small-'+dto.age+'.png">'
									content +=
												'<span class="span-title">'+dto.movieTitle+'</span>'
									content +=
											'</div>'
									content +=
											'<div class="col-6 text-end">상영중/상영시간 '+dto.runningTime+'분</div>'
									content +=
										'</div>'
									content +=
										'<div class="row mt-3" style="border-bottom: 1px solid #eaeaea;">'
									content +=										
											'<div class="col-1 mt-4">'
									content +=											
												'<ul>'
									content +=												
													'<li class="d-inline-block">'
									content +=													
														'<div class="text-center" style="width: 80px; height: 100px;">'
									content +=														
															'<h3 id="h3-hallName">'+dto.hallName+'</h3>'
									content +=															
															'<p><small class="text-muted">총 70석</small></p>'
									content +=															
														'</div>'
									content +=														
													'</li>'
									content +=													
												'</ul>'
									content +=												
											'</div>'
									content +=											
											'<div class="col-11 mt-4">'
									content +=											
												'<ul id="detailScheduleId">'
								$.each(dto.screenings, function(index, item){
									//끝나는 시간 구하기
									screeningEndTime = moment.unix(item.screeningDate/1000).add(dto.runningTime, "m").format("HH:mm");
									var seat = 70-item.seatCnt;
									content +=												
													'<li class="d-inline-block position-relative me-2">'
									content +=													
														'<button class="ck position-absolute text-center text-white quickTicketing" data-sn='+item.screeningNo+' data-mn='+dto.movieNo+' data-et='+screeningEndTime+' style="display:none; background-color: #ffc107; width: 80px; height: 75px;">'
									content +=														
															'<p class="m-0">빠른예매</p>'
									content +=															
															'<p class="m-0"><small>'+seat+'석</small></p>'
									content +=															
														'</button>'
									content +=														
														'<div class="detailSchdules-1 text-center" style="border: 1px solid black; width: 80px; height: 75px;">'
									if(item.screeningTime.replace(":","") <= 1100 && item.screeningTime.replace(":","") >= 700 ){
									content +=														
															'<p class="m-0 mt-2 p-screeningTime"><i class="bi bi-sun" style="color: #ffc107"></i>'+item.screeningTime+'</p>'
									}else{
									content +=		
															'<p class="m-0 mt-2 p-screeningTime">'+item.screeningTime+'</p>'
									}
									content +=															
															'<p class="m-0 mt-2"><small class="text-muted">'+seat+'석</small></p>'
									content +=															
														'</div>'
									content +=														
													'</li>'
								})	
									content +=													
												'</ul>'
									content +=												
											'</div>'
									content +=											
										'</div>'
									$(".theaterDetailMovieSchedule").append(content);
								})
							})
						})						
					}
					
					$("#ul-days").on('click','li',function(){
						screeningDate = $(this).data('select-day');
						$(".theaterDetailMovieSchedule").empty();
						displayMovieList();
					})
					
					$('.theaterDetailMovieSchedule').on('click', '.ck', function() {
						var loginedUser = '${LOGINED_USER }'
						if(!loginedUser){
							alert("로그인이 필요한 서비스입니다.");
				 			loginModal.show();
							return;
						}
						
						screeningNo = $(this).data('sn');
						movieNo = $(this).data('mn');
						hallName = $(this).parent().parent().parent().siblings().find("#h3-hallName").text();
						screeningTime = $(this).siblings().find(".p-screeningTime").text();
						screeningEndTime = $(this).data('et'); 
						title = $(this).parent().parent().parent().parent().prev().find(".span-title").text();
						age = $(this).parent().parent().parent().parent().prev().find(".span-title").prev().attr('alt');					
					
						//form값 넣기
						$('#input-screening-no').val(screeningNo);
						$('#input-movie-no').val(movieNo);
						$('#input-theater-no').val(theaterNo);
						$('#input-hall-name').val(hallName);
						$('#input-screening-date').val(screeningDate);
						$('#input-screening-time').val(screeningTime);
						$('#input-screening-end-time').val(screeningEndTime);
						$('#input-title').val(title);
						$('#input-age').val(age);
						$('#input-theater-name').val($("#theaterNm").text());
						
						$("#form-ticketing").submit();
					})
					
					$('.theaterDetailMovieSchedule').on('mouseover', 'li', function() {
						$(this).find(".quickTicketing").show();
					})
					$('.theaterDetailMovieSchedule').on('mouseleave', 'li', function() {
						$(this).find(".quickTicketing").hide();
					})
				})
			</script>
			<div class="theaterDetailMovieSchedule">
			</div>
			<!-- 선택한 값 넘겨받는 form -->
			<form action="seat" method="post" id="form-ticketing">
				<input type="hidden" name="screeningNo" id="input-screening-no">
				<input type="hidden" name="movieNo" id="input-movie-no">
				<input type="hidden" name="theaterNo" id="input-theater-no">
				<input type="hidden" name="hallName" id="input-hall-name">
				<input type="hidden" name="screeningDate" id="input-screening-date">
				<input type="hidden" name="screeningTime" id="input-screening-time">
				<input type="hidden" name="screeningEndTime" id="input-screening-end-time">
				<input type="hidden" name="title" id="input-title">
				<input type="hidden" name="age" id="input-age">
				<input type="hidden" name="theaterName" id="input-theater-name">
			</form>
			<div class="row mt-5">
				<div class="col-12" style="border: 1px solid #eaeaea;">
					<ul class="mt-3">
						<li>지연입장에 의한 관람불편을 최소화하고자 본 영화는 약 10분 후 시작됩니다.</li>
						<li>쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</li>
					</ul>
				</div>
			</div>
			<!-- 일자별 영화관 스케쥴 -->
		</div>
		<!-- 극장 상세정보 탭(상영시간표) -->

		<!-- 극장 상세정보 탭(관람료) -->
		<div class="moviePrice" style="display: none;">
			<div class="row mt-2">
				<div class="col-12">
					<h4>영화 관람료</h4>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-6">
					<ul>
						<li>2D</li>
					</ul>
				</div>
				<div class="col-6">
					<ul>
						<li>IMAX</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>조조(06:00~)</td>
								<td>9,000</td>
								<td>7,000</td>
							</tr>
							<tr>
								<td>일반(10:01~)</td>
								<td>13,000</td>
								<td>10,000</td>
							</tr>
							<tr>
								<td>심야(23:00~)</td>
								<td>12,000</td>
								<td>9,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>조조(06:00~)</td>
								<td>10,000</td>
								<td>7,000</td>
							</tr>
							<tr>
								<td>일반(10:01~)</td>
								<td>14,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>심야(23:00~)</td>
								<td>13,000</td>
								<td>10,000</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>조조(06:00~)</td>
								<td>13,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>16,000</td>
								<td>12,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>17,000</td>
								<td>13,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>조조(06:00~)</td>
								<td>13,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>18,000</td>
								<td>13,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>18,000</td>
								<td>13,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-6">
					<ul>
						<li>4DX</li>
					</ul>
				</div>
				<div class="col-6">
					<ul>
						<li>ScreenX</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>조조(06:00~)</td>
								<td>12,000</td>
								<td>10,000</td>
							</tr>
							<tr>
								<td>브런치(11:01~)</td>
								<td>16,000</td>
								<td>10,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>17,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>조조(06:00~)</td>
								<td>13,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>브런치(11:01~)</td>
								<td>18,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>18,000</td>
								<td>11,000</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>조조(06:00~)</td>
								<td>10,000</td>
								<td>9,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>13,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>14,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>조조(06:00~)</td>
								<td>10,000</td>
								<td>9,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>15,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>15,000</td>
								<td>11,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-6">
					<ul>
						<li>CINE de CHEF</li>
					</ul>
				</div>
				<div class="col-6">
					<ul>
						<li>GOLD CLASS</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>모닝(06:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
							<tr>
								<td>브런치(15:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
							<tr>
								<td>일반(18:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>모닝(06:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
							<tr>
								<td>브런치(15:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
							<tr>
								<td>일반(18:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>모닝(06:00~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>모닝(06:00~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-12">
					<h4>요금제</h4>
				</div>
				<ul>
					<li>
						<p>어린이 할인 만7세 ~ 만12세 초등학생 (의료보험증, 주민등록 초/등본 확인, 키즈관만 적용)</p>
					</li>
					<li>
						<p>48개월 미만의 경우 증빙원(예 : 의료보험증, 주민등록 초/등본 등) 지참 시에만 무료 관람 가능</p>
					</li>
				</ul>
			</div>
			<div class="row mt-3">
				<div class="col-12">
					<h4>우대적용</h4>
				</div>
				<ul>
					<li>
						<p>국가유공자 현장에서 국가유공자증을 소지한 본인 외 동반 1인까지 적용</p>
					</li>
					<li>
						<p>장애인 현장에서 복지카드를 소지한 장애인(중증까지 동반 1인까지 적용/경증은 본인에 한함)</p>
					</li>
					<li>
						<p>경로 만65세 이상 본인에 한함(신분증 확인)</p>
					</li>
					<li>
						<p>미취학아동 부모 동반한 만4세~ 만6세까지 본인(의료보험증, 주민등록 초/등본 확인)</p>
					</li>
					<li>
						<p>소방종사자 공무원증을 소지하거나 정복을 입은 소방관 본인</p> <br>
						<p>(단, 특별관에는 우대요금이 적용되지 않습니다.)</p>
					</li>
				</ul>
			</div>
		</div>
		<!-- 극장 상세정보 탭(관람료) -->

		<!-- 탑페이지 이동 탭 -->
		<div class="quick-area container position-relative"
			style="display: block;">
			<a href="" class="btn-go-top" title="top"><i
				class="fas fa-arrow-circle-up"
				style="font-size: 50px; color: black;"></i></a>
		</div>
		<!-- 탑페이지 이동 탭 -->
		<%@include file="../common/footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(function() {
			// 공지사항 제목 색상 토글
			$('.noticeLink').mouseover(function() {
				$(this).addClass('text-warning');
			})
			$('.noticeLink').mouseleave(function() {
				$(this).removeClass('text-warning');
			})
			// 더보기 색상 토글
			$('.more').mouseover(function() {
				$(this).children().addClass('text-warning');
			})
			$('.more').mouseleave(function() {
				$(this).children().removeClass('text-warning');
			})
			
			// top페이지
			$(window).scroll(function() {
				if ($(this).scrollTop() > 200) {
					$('.btn-go-top').fadeIn();
				} else {
					$('.btn-go-top').fadeOut();
				}
			});
			$('.btn-go-top').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
			
			// 지역별 풍선
			$('.locationNav').mouseover(function() {
				$('#theaterNm').hide();
				var location = $(this).find('a').text();
				console.log(location);
				var $loca = $(".balloon");
				// 지역별 풍선 ajax
				$.ajax({
					type:"GET",
					url:"theater/place",
					data: {location: location},
					dataType: 'json',
					success: function(allLocations) {
						$(".balloon").stop().css('display','flex').show();
						$loca.text("");
						$.each(allLocations, function(index, item) {
							var $div = $("<div class='col-3'></div>");
							var $ul = $("<ul class='list-group list-group-horizontal'></ul>")
							var $li = $("<li class='list-group-item flex-fill'></li>")
							var $a = $("<a class='text-body nav-link'></a>")
							$a.attr("href", "detailTheater?no="+ item.theaterNo + "&number=" +item.theaterNumber).text(item.theaterName).appendTo($li).appendTo($ul).appendTo($div);
							$loca.append($div);
						})
					},
					error: function() {
						alert("지역 조회중 오류가 발생하였습니다.");
					}
				});
			})
			$('.balloon').mouseleave(function() {
				$(".balloon").stop().hide();
				$('#theaterNm').show();
			})
			
			// nav탭 테두리
			$(".nav-tabs li").click(function() {
				$(this).css({"border-top": "2px solid #ffc107", "border-left": "2px solid #ffc107", "border-right": "2px solid #ffc107"}).siblings().css({"border-top": "none", "border-left": "none", "border-right": "none"});
			})
			
			// 해당 탭 띄우기
			$(".theaterInfoNav").click(function() {
				$(".screeningTime").hide();
				$(".moviePrice").hide();
				$(".theaterInfo").show();
			})
			$(".screeningTimeNav").click(function() {
				$(".screeningTime").show();
				$(".moviePrice").hide();
				$(".theaterInfo").hide();
			})
			$(".moviePriceNav").click(function() {
				$(".screeningTime").hide();
				$(".moviePrice").show();
				$(".theaterInfo").hide();
			})
			
			var facilityD = $("#facilityData").data('facility');
			var facilityNames = $.trim(facilityD.split(' '));
			var facilityNmS = facilityNames.split(',');
			var array;
			for (var i=0; i <= facilityNmS.length; i++) {
				if('돌비' == facilityNmS[i] || '부티크' == facilityNmS[i] || '컴포트' == facilityNmS[i] || '스폐셜석' == facilityNmS[i] || '스위트룸' == facilityNmS[i] || 'MX' == facilityNmS[i]) {
					array = [];
					array = facilityNmS[i];
					console.log('1:'+array);
					for(var j=0; j = 1; j++) {
						facilityNmS[i] = array[j];
						break;
					}
					facilityNmS[i] = "";
				}
			}
			
			if('돌비' == array || '부티크' == array || '컴포트' == array || '스폐셜석' == array || '스위트룸' == array || 'MX' == array) {
				var content = '<th> ' +
							  '    <img alt="'+array+'" src="resources/images/facility/ico-facility-sweet.png"> ' +
							  '</th> ';
				$("#theader").append(content);
				var content = '<td> ' +
							  ' 특별관 ' +
							  '</td> ';
				$("#tbodyDown").append(content);
				
			}
			
			for (var i=0; i <= facilityNmS.length; i++) {
				if('일반상영관' == facilityNmS[i]) {
					var content = '<th> ' +
								  '    <img alt="'+facilityNmS[i]+'" src="resources/images/facility/ico-facility-theater.png"> ' +
								  '</th> ';
					$("#theader").append(content);
					var content = '<td> ' +
								  ' ' + facilityNmS[i] + ' ' +
								  '</td> ';
					$("#tbodyDown").append(content);
				}
				
				if('장애인석' == facilityNmS[i]) {
					var content = '<th> ' +
								  '    <img alt="'+facilityNmS[i]+'" src="resources/images/facility/ico-facility-disabled.png"> ' +
								  '</th> ';
					$("#theader").append(content);
					var content = '<td> ' +
								  ' ' + facilityNmS[i] + ' ' +
								  '</td> ';
					$("#tbodyDown").append(content);
				}
				
				if('커플석' == facilityNmS[i]) {
					var content = '<th> ' +
								  '    <img alt="'+facilityNmS[i]+'" src="resources/images/facility/ico-facility-couple.png"> ' +
								  '</th> ';
					$("#theader").append(content);
					var content = '<td> ' +
								  ' ' + facilityNmS[i] + ' ' +
								  '</td> ';
					$("#tbodyDown").append(content);
				}
				
				if('2인소파석' == facilityNmS[i]) {
					var content = '<th> ' +
								  '    <img alt="'+facilityNmS[i]+'" src="resources/images/facility/ico-facility-twopulson.png"> ' +
								  '</th> ';
					$("#theader").append(content);
					var content = '<td> ' +
								  ' ' + facilityNmS[i] + ' ' +
								  '</td> ';
					$("#tbodyDown").append(content);
				}
				
				if('4인소파석' == facilityNmS[i]) {
					var content = '<th> ' +
								  '    <img alt="'+facilityNmS[i]+'" src="resources/images/facility/ico-facility-fourpulson.png"> ' +
								  '</th> ';
					$("#theader").append(content);
					var content = '<td> ' +
								  ' ' + facilityNmS[i] + ' ' +
								  '</td> ';
					$("#tbodyDown").append(content);
				}
			}
			
			
			var lng = $("#latLng").data('lng');
			var lat = $("#latLng").data('lat');
			var theaterNm = $("#theaterNm").text();
			
			// kakaoMap
			$("#mapBtn").on('shown.bs.modal', function() {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = { 
				    center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
				    level: 3 // 지도의 확대 레벨
				};
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(lat, lng); 

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				var iwContent = '<div class="text-center p-2" style="width:240px; border:none;">' +
								'	<i class="fas fa-film mx-2"></i>CINEMA BOX <br> '+theaterNm+'점 <br>' +
								'	<button class="btn btn-primary btn-sm mt-1" style="background-color: #ffc107;"><a href="https://map.kakao.com/link/map/CINEMA BOX'+theaterNm+','+lat+','+lng+'" style="color:white; text-decoration:none;" target="_blank"><i class="bi bi-map"></i> 큰지도보기</a></button>' +
								'	<button class="btn btn-primary btn-sm mt-1" style="background-color: #ffc107;"><a href="https://map.kakao.com/link/to/CINEMA BOX'+theaterNm+','+lat+','+lng+'" style="color:white; text-decoration:none;" target="_blank"><i class="fas fa-directions"></i> 길찾기</a></button>' +
								'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker);
				
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				
// 				// 커스텀 오버레이에 표시할 내용입니다     
// 				// HTML 문자열 또는 Dom Element 입니다 
// 				var content = '<div class="overlaybox">' +
// 				    '    <div class="boxtitle">CINEMA BOX 영화순위</div>' +
// 				    '    <div class="first">' +
// 				    '        <div class="triangle text">1</div>' +
// 				    '        <div class="movietitle text">드래곤 길들이기2</div>' +
// 				    '    </div>' +
// 				    '    <ul>' +
// 				    '        <li class="up">' +
// 				    '            <span class="number">2</span>' +
// 				    '            <span class="title">명량</span>' +
// 				    '        </li>' +
// 				    '        <li>' +
// 				    '            <span class="number">3</span>' +
// 				    '            <span class="title">해적(바다로 간 산적)</span>' +
// 				    '        </li>' +
// 				    '        <li>' +
// 				    '            <span class="number">4</span>' +
// 				    '            <span class="title">해무</span>' +
// 				    '        </li>' +
// 				    '        <li>' +
// 				    '            <span class="number">5</span>' +
// 				    '            <span class="title">안녕, 헤이즐</span>' +
// 				    '        </li>' +
// 				    '    </ul>' +
// 				    '</div>';

// 				// 커스텀 오버레이가 표시될 위치입니다 
// 				var position = new kakao.maps.LatLng(lat, lng);  

// 				// 커스텀 오버레이를 생성합니다
// 				var customOverlay = new kakao.maps.CustomOverlay({
// 				    position: position,
// 				    content: content,
// 				    xAnchor: 0.3,
// 				    yAnchor: 0.91
// 				});

// 				// 커스텀 오버레이를 지도에 표시합니다
// 				customOverlay.setMap(map);

				map.relayout();
			})
			
			// 약도보기
// 			$("#map").hide();
// 			$("#mapBtn").click(function() {
// 				$("#map").toggle();
// 			}) 
			
			// 상영시간표 날짜 출력
			   /* 달력 날짜 표시하기 */
			   //화살표 클릭 시 날짜 변경
			   var count = 0;
			   $('#btn-next').click(function(){
			      count++;
				  $('#btn-prev').prop("disabled", false);
				  if(count == 1) {
					  $(this).prop("disabled", true);
				  }
			      week++;
			      changeDays();
			   })
			   $('#btn-prev').click(function(){
				  count--;
				  if(count == 0) {
					  $(this).prop("disabled", true);
					  $('#btn-next').prop("disabled", false);
				  } 
			      week--;
			      changeDays();
			   })
			   //2주 단위로 날짜 변경하기
			   var week = 0;
			   function changeDays(){
			      var $days = $('#ul-days').empty();
			      
			      var weekDays = [];
			      for(var i=0; i<14; i++){
			         weekDays.push({
						selectedDay : moment().add(i+(week*14), 'd').format("YYYYMMDD"),
			            month : moment().add(i+(week*14), 'd').format("M월"),
			            day : moment().add(i+(week*14), 'd').format("D"),
			            dayOfWeek : moment().add(i+(week*14), 'd').format("ddd")
			         });
			      }
			      var prev;
			      $.each(weekDays, function(index, item){
			    	 var monthPosition = item.month;
					 var selectedDay = item.selectedDay;
			         var content = "<li class='d-inline-block' style='width: 7%;' data-select-day="+selectedDay+">";
			    	 if(!prev || prev != monthPosition) {
				         content += "<strong class='d-block' style='font-size:0.7rem;'>"+monthPosition+"</strong>";
			    	 }
			    	 prev = monthPosition;
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
			         
			         //오늘 날짜는 무조건 선택되어 있게 하기
			         var mon = moment().add('d').format("M월");
			         var today = moment().add('d').format("D");
			         if(item.month == mon && item.day == today){
			            $('#ul-days li:eq(0)').trigger('click');
			         }
			      });
			   }
			   //날짜를 눌렀을 때 체크되게하기
			   $('#ul-days').on('click', 'li', function(){
			      $(this).addClass('day-act').siblings().removeClass('day-act');
			      $(this).css({"font-weight": "bolder", "border-bottom": "4px solid #ffc107", "box-shadow": "0px 0px 0px #ffc107"}).siblings().css({"border-bottom": "none", "box-shadow": "none", "font-weight": ""});
			   })
			   changeDays();
				
			   $('#detailScheduleId li').mouseover(function() {
				  $(this).find(".quickTicketing").show();
			   })
			   $('#detailScheduleId li').mouseleave(function() {
				   $(this).find(".quickTicketing").hide();
			   })
		})
	</script>
</body>
</html>