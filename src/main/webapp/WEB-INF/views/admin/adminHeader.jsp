<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />    

<header class="py-4 container" id="header">
	<nav class="row">
		<div class="text-center p-0" id="topnav-container">
			<a class="navbar-brand" href="#" style="font-size:25px; color:black; font-weight: bolder;"><i class="fas fa-film mx-2"></i>CINEMA BOX ADMIN</a>
			<ul class="nav justify-content-end" id="top-nav">
				<li class="nav-item"><a class="nav-link last-a" href="#">Admin 계정</a></li>
			</ul>
		</div>
		<div class="position-relative p-0" id="sticky-nav">
			<div class="navbar justify-content-center" id="mainnav-container">
				<ul class="nav text-center justify-content-center" id="mainnav-01">
					<li class="nav-item mainnav"><a class="nav-link text-body" href="#">영화</a>
						<ul class="nav justify-content-center bg-white subnav" id="subnav-01">
							<li class="nav-item"><a class="nav-link text-body" href="movieInsert">영화 등록</a></li>
							<li class="nav-item"><a class="nav-link text-body" href="movieList">영화 목록</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="#">이벤트</a>
						<ul class="nav justify-content-center bg-white subnav" id="subnav-02">
							<li class="nav-item"><a class="nav-link text-body" href="event/main">이벤트 목록</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="">스토어</a>
						<ul class="nav justify-content-center subnav bg-white bg-white" id="subnav-03">
							<li class="nav-item"><a class="nav-link text-body" href="giftInsert">GIFT 상품 등록</a></li>
							<li class="nav-item"><a class="nav-link text-body" href="snackInsert">SNACK 상품 등록</a></li>
							<li class="nav-item"><a class="nav-link text-body" href="gift">스토어 목록</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="#">공지사항</a>
						<ul class="nav justify-content-center subnav bg-white" id="subnav-04">
							<li class="bg-white"><a class="nav-link text-body" href="notice/add">새 글 등록</a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav" id="mainnav-02">
					<li><a class="nav-link text-body" href="home"><i class="fas fa-sign-in-alt"></i> 나가기</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
