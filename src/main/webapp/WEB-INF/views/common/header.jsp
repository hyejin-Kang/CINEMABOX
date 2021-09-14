<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('99049ace9c7bdff941b33ca319b803c8');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
        Kakao.isInitialized();
        
        //탑배너
		$("#img-top-banner").ready(function(){
			var yourImages = ["/cinemabox/resources/images/banner/top/Puppy_98080.jpg",
     		   				 "/cinemabox/resources/images/banner/top/Sence_98080.jpg",
     		   				 "/cinemabox/resources/images/banner/top/Sake_98080.jpg",
     		   				 "/cinemabox/resources/images/banner/top/Maly_98080.jpg",
     		   				 "/cinemabox/resources/images/banner/top/Sangy_98080.jpg"];
			var randomImage = Math.trunc(Math.random()*yourImages.length);
			$("#img-top-banner").attr("src", yourImages[randomImage]);
			$("#div-top-banner img[src*='Puppy']").parent().attr("href","movieDetail?no=20219381").parent().parent().css("background", "rgb(0, 164, 236)");
			$("#div-top-banner img[src*='Sence']").parent().attr("href","movieDetail?no=20218985").parent().parent().css("background", "rgb(0, 0, 0)");
			$("#div-top-banner img[src*='Sake']").parent().attr("href","movieDetail?no=20219185").parent().parent().css("background", "rgb(252, 243, 228)");
			$("#div-top-banner img[src*='Maly']").parent().attr("href","movieDetail?no=20219311").parent().parent().css("background", "rgb(0, 0, 0)");
			$("#div-top-banner img[src*='Sangy']").parent().attr("href","movieDetail?no=20217742").parent().parent().css("background", "rgb(0, 0, 0)");
        })
</script>
<!-- top banner start -->
<div class="navbar navbar-light p-0 justify-content-center" id="div-top-banner">
	<div class="position-relative">
		<a><img alt="" id="img-top-banner"></a>
		<i id="i-close-top-banner" class="fas fa-times text-white position-absolute" style="right:15px; top:10px; cursor: pointer;"></i>
	</div>
</div>
<!-- top banner end -->
<header class="pt-4 container" id="header">
	<nav class="row">
		<div class="text-center p-0" id="topnav-container">
			<a class="navbar-brand" href="/cinemabox/home" style="font-size:25px; color:black; font-weight: bolder;"><i class="fas fa-film mx-2"></i>CINEMA BOX</a>
				<ul class="nav justify-content-end" id="top-nav">
					<li id="login-link" class="nav-item" style="display:${empty LOGINED_USER ? '' :'none'}"><a class="nav-link" id="loginForm">로그인</a></li>
					<li id="register-link" class="nav-item" style="display:${empty LOGINED_USER ? '' : 'none'}"><a class="nav-link" href="/cinemabox/register">회원가입</a></li>
					<li id="myPage-link" class="nav-item" style="display:${not empty LOGINED_USER ? '' : 'none'}"><a class="nav-link" href="/cinemabox/myPage">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="/cinemabox/customerCenter/main">고객센터</a></li>
					<li id="logout-link" class="nav-item" style="display:${not empty LOGINED_USER ? '' : 'none'}"><a class="nav-link" href="/cinemabox/logout">로그아웃</a></li>
				</ul>
		</div>
		<div class="position-relative p-0" id="sticky-nav">
			<div class="navbar justify-content-center" id="mainnav-container">
				<ul class="nav text-center justify-content-center" id="mainnav-01">
					<li class="nav-item mainnav"><a class="nav-link text-body" href="/cinemabox/ticket">예매</a>
						<ul class="nav justify-content-center subnav" id="subnav-01">
							<li class="nav-item"><a class="nav-link" href="/cinemabox/ticket">예매하기</a></li>
							<li class="nav-item"><a class="nav-link" href="/cinemabox/schedule">상영시간표</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="/cinemabox/movie">영화</a>
						<ul class="nav justify-content-center subnav" id="subnav-02">
							<li class="nav-item"><a class="nav-link" href="/cinemabox/movie">현재상영작</a></li>
							<li class="nav-item"><a class="nav-link" href="/cinemabox/movie?type=scheduled">상영예정작</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="/cinemabox/theaterHome">극장</a>
						<ul class="nav justify-content-center subnav" id="subnav-03">
							<li class="nav-item"><a class="nav-link" href="/cinemabox/theaterHome">전체극장</a></li>
							<li class="nav-item"><a class="nav-link" href="/cinemabox/specialHall">특별관</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="/cinemabox/event/main">이벤트</a>
						<ul class="nav justify-content-center subnav" id="subnav-04">
							<li class="nav-item"><a class="nav-link" href="/cinemabox/event/main">홈</a></li>
							<li class="nav-item"><a class="nav-link" href="/cinemabox/event/discount">제휴할인</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="/cinemabox/gift">스토어</a>
						<ul class="nav justify-content-center subnav" id="subnav-05">
							<li class="nav-item"><a class="nav-link" href="/cinemabox/gift">시네마 티켓</a></li>
							<li class="nav-item"><a class="nav-link" href="/cinemabox/snack">팝콘/음료 세트</a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav" id="mainnav-02">
					<li><a class="nav-link text-body" id="a-search"><i class="fas fa-search mx-2"></i>검색</a></li>
					<li><a class="nav-link text-body" href="/cinemabox/ticket"><i class="far fa-calendar-alt mx-2"></i>빠른예매</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<!-- search start -->
<div id="div-search" style="display: none;">
	<div class="container d-flex justify-content-center">
		<div class="row col-9 justify-content-center">
			<div class="col-4 row" style="margin-top:65px;">
				<h6 style="cursor: default;"><strong style="border-bottom: 2px solid black;">예매율순</strong></h6>
				<div id="div-search-rank-cont" class="row">
					<div class="col-6 text-center" id="div-search-poster">
						<div id="carouselSearchSlidesOnly" class="carousel slide rounded-3 shadow" data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="now" items="${NOW_MOVIES }" begin="1" end="5" varStatus="loop">
									<div class="carousel-item ${loop.index eq 1 ? 'active':'' }">
										<img src="/cinemabox/resources/images/movie/${now.no}.jpg" class="d-block" alt="...">
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="col-6 ps-3">
						<ul id="ul-search-movie-rank" class="p-0">
							<c:forEach var="now" items="${NOW_MOVIES }" begin="1" end="5" varStatus="loop">
								<li>
									<span class="me-2">${loop.index }</span>
									<a href="movieDetail?no=${now.no}">${now.title}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-8">
				<form action="search" method="post" id="form-search" class="text-center">
					<input type="text" name="keyword" placeholder="영화를 검색하세요" />
					<button class="btn"><i class="fas fa-search"></i></button>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$("#a-search").click(function(){
		$("#div-search").toggle();
	})
	$("#form-search button").click(function(){
		var searchMovie = $("#form-search input").val();
		if(!searchMovie){
			alert("영화명을 입력하세요.");
			return false;
		}
		$("#form-search").submit();	
	})
</script>
<!-- search end -->
<!-- ----------------------------------------------로그인 모달------------------------------------------ -->
<div class="modal" tabindex="0" id="loginModal">
  	<div class="modal-dialog modal-dialog-centered modal-lg">
    	<div class="modal-content">
      		<div class="modal-header" style="background-color:#ffc107">
        		<h5 class="modal-title">로그인</h5>
        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
      		<div class="modal-body">
        		<div class="row">
        			<div class="col-6 py-4" data-kakaoLog="${value}">
        				<form action="kakaoLogin" method="post" id="login-kakao">
        					<input type="hidden" value="id" id="kakaoId" name="id">
        					<input type="hidden" value="name" id="kakaoName" name="name">
        				</form>
        				<form id="form-login" method="post" action="login" novalidate="novalidate">
        					<div class="mt-4" id="error-message" style="color:red; display:none;">
     										
        					</div>
        					<div class="row px-2 mb-3">
        						<input type="text" class="form-control" id="userId" name="id" placeholder="아이디">
        					</div>
        					<div class="row px-2 mb-3">
        						<input type="password" class="form-control" id="userPassword" name="password" placeholder="비밀번호">
        					</div>
        					<div class="row px-2 mb-3">
        						<div class="form-check">
  									<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
  									<label class="form-check-label" for="flexCheckChecked">
    									<small>아이디 저장</small>
  									</label>
								</div>
        					</div>
        					<div class="row">
        						<div class="col mt-2 d-grid gap-2 col-6 mx-auto">
        							<button type="submit" class="btn btn-light btn-lg" style="color:black; font-size:15px; length:150px" id="btn-login">로그인</button>
        						</div>
        					</div>
        				</form>
        				<div class="row">
        					<div class="col-6 offset-3">
        						<span><small>ID/PWD 찾기</small></span>
        						<a href="/cinemabox/register"><span><small>| 회원가입</small></span></a>
        					</div>
        				</div>
        				<div class="row mt-4">
        					<div class="sign-logo">
        						<div class=" text-center">
        							<img alt="naver" src="/cinemabox/resources/images/user/login/naver.png" class="me-2">
        							<a id="custom-login-btn" href="javascript:loginWithKakao()">
        								<img alt="kakao" src="/cinemabox/resources/images/user/login/kakao.png">
        							</a>
        						</div>
        						<div class=" col-3 mt-2 d-grid mx-auto d-inline-block">
        						</div>
        					</div>
        				</div>
        			</div>
        			<div class="col-6">
        				<a href="https://direct.hi.co.kr/service.do?m=3293e8e708&HDMS1=banner&HDMS2=megabox&HDMS3=%eb%a1%9c%ea%b7%b8%ec%9d%b8%ed%8c%9d%ec%97%85_%ec%9a%b0%ec%b8%a1&HDMS4=%EB%A7%8C%EA%B8%B0%EB%9D%BC%EB%A9%B4_STOP&src=image&kw=03EBFE&utm_source=megabox&utm_medium=display&utm_campaign=%eb%a1%9c%ea%b7%b8%ec%9d%b8%ed%8c%9d%ec%97%85_%ec%9a%b0%ec%b8%a1&utm_content=%EB%A7%8C%EA%B8%B0%EB%9D%BC%EB%A9%B4_STOP"><img alt="hyundaiAd" src="/cinemabox/resources/images/user/login/Hyundai.jpg"></a>
        			</div>
        		</div>
      		</div>
    	</div>
  	</div>
</div>
<script type="text/javascript">

var loginModal = new bootstrap.Modal(document.getElementById("loginModal"), {
	     keyboard: false
	  });
	   
$("#loginForm").click(function(){
	loginModal.show();
});


$("#form-login").submit(function(event){
	$("#error-message").hide();
	event.preventDefault();
	
	// 아이디, 비밀번호 입력했는지 체크
	if ($("#userId").val() == "") {
		$("#error-message").text("아이디는 필수입력값입니다.").show();
		$("#userId").focus();
		return false;
	}
	
	if($("#userPassword").val() == ""){
		$("#error-message").text("비밀번호는 필수 입력값입니다.").show();
		$("userPassword").focus();
		return false;
	}
	
	$.ajax({
		type:"post",
		url:"userLogin/login",
		data: {id:$("#userId").val(), password:$("#userPassword").val()},
		success:function() {
			
			//관리자가 로그인 했을 때
			var id = $("#userId").val();
			
            if (id == "admin"){
               location.href="admin";
            }else{
				$("#login-link").hide();
				$("#register-link").hide();
				$("#logout-link").show();
				$("#myPage-link").show();
            
				loginModal.hide();
				location.href = location.href.replace('error=login','')
				location.reload();
				
            };
		},
		error:function() {
			$("#error-message").text("아이디 비밀번호가 올바르지 않습니다.").show();
		}
	});
})


function loginWithKakao(){
    Kakao.Auth.login({
      success: function(authObj) {
    	//console.log(JSON.stringify(authObj))
        var accessToken = authObj.access_token;
    	Kakao.Auth.setAccessToken(accessToken);
    	Kakao.API.request({
    	    url: '/v2/user/me',
    	    success: function(response) {
    	    	var result = confirm("카카오 로그인으로 회원가입  & 로그인 하시겠습니까?");
    	    	var id = response.id;
    	    	var name = response.properties.nickname;
    	    	//var birth = response.kakao_account.birthday;
    	    	
    	    	if(result){
    	    		$.ajax({
    	    			type:"post",
    	    			url:"userLogin/kakaoLogin",
    	    			data:{id:id, name:name},
    	    			success: function(){
    	    				$("#login-link").hide();
    	    				$("#register-link").hide();
    	    				$("#logout-link").show();
    	    				$("#myPage-link").show();
    	    				
    	    				loginModal.hide();
    	    				location.href = location.href.replace('?error=login','')
    	    				location.reload();
    	    			}
    	    		})
    	    	}
    	    },
    	   fail: function(error) {
    	    	alert(error);
    	   }
    	});
     },
     fail: function(err) {
       alert(JSON.stringify(err))
     },
   })
};
 
 /*
브라우져 쿠키에 값을 저장한다.
name은 쿠키명, value는 쿠키값, days는 만료일까지의 일 수
*/
function setCookie(name, value, days) {
	var d = new Date();
	d.setTime(d.getTime() + (days*24*60*60*1000));
	var expires = "expires=" + d.toUTCString();
	// 쿠키는 name=value; expires=Thu, 18 Dec 2021 12:00:00 UTC; path=/
	document.cookie = name + "=" + value + ";" + expires + ";path=/";
};

//브라우져 쿠키저장소에 지정된 이름의 쿠키값을 찾아서 반환한다.
function getCookie(name) {
	name = name + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var items = decodedCookie.split(";");
	for (var i=0; i<items.length; i++) {
	var item = items[i];
	while (item.charAt(0) == ' ') {
	  	item = item.substring(1);
		}
		if (item.indexOf(name) == 0) {
	  	return item.substring(name.length, item.length);
		}
	}
	return "";
};
	/*
	document.getElementById("register-link").onclick= function(event){
		event.preventDefault()
		setCookie("step","level1",1);
		location.href="/cinemabox/register" 
	};
	*/
</script>
<c:if test="${param.error eq 'login' }">
	<script>
		$('#error-message').text("로그아웃 되어 로그인이 필요합니다.").show();
		loginModal.show();
	</script>
</c:if>
