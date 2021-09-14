<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<script src="https://kit.fontawesome.com/b4347bf02c.js" crossorigin="anonymous"></script>
<title>마이페이지</title>
<style type="text/css">
   header .navbar-brand,
   #top-nav>li>a,
   #mainnav-02>li>a{z-index:100000;}

   .mainnav>a{z-index:100000;}

   #myPageBg{
      background: linear-gradient(to bottom, #ffc107 80%, #f8f8f8 20%);
      display: flex;
      justify-content: center;
      vertical-align: middle;
      width:auto;
      height:auto;
   }
   
   #myPage{
      background-color:	#ffffff;
      width:90%;
      height: auto;
      margin-top : 60px;
      border-radius: 30px;
   }
   
   td{
   	 border : none;
   }
   
   .bg-warning{
   	
   }
   
   .level-img{
   	  width: 50px;
   	  height: 30px;
   }
   
   .infoTabBack{
   	  background-color : #ffc107;
  
   }
   
   .infoTab{
   	color : white;
   }
 
   #ryan{
	   width:150px;
	   height:150px;
   
   }
   
   .wishlistMovie{
   		cursor:pointer;
   }
   
   #couponWidth{
   		width:500px;
   }
   
   .couponList{
   		cursor:pointer;
   }
   
   .moviePoint{
   		cursor:pointer;
   }
   
   .modal-dialog{
   
	   width: 304px;
	   height: fit-content;
   }
   
   #wishNum{
   		padding-top: 4px;
   		padding-left: 10px;
   }
   
</style>
</head>
<body>
<%@include file="../common/header.jsp" %>
   <div class="container-fluid" id="myPageBg">
      <div class="container" id="myPage">
         <div id="myPageInfo" class="mb-2">
            <div class="row mx-2 mt-4">
				<div class="col text-end">
					<div class="row mt-3">
						<div class="col">
							<div class="text-center" id="levelIcon">
								<span class="badge rounded-pill bg-success">Green</span>
							</div>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col text-center">
							<strong>${LOGINED_USER.name }</strong>님 반가워요!
						</div>
					</div>
				</div>
				<div class="col-6"></div>
				<div class="col"></div>
            </div>
            <div class="row mx-2 mb-3">
            	<div class="col-6 offset-3 text-center" style="font-size : 20px">
            	</div>
            </div>
            <div class="row mt-4 mb-1">
            	<div class="col-6 offset-3 text-center">
            		<a href="#"><span class="badge rounded-pill bg-dark text-white text-center" id="MembershipBadge">Membership Zone</span></a>
            	</div>
            </div>
            <div class="row mx-2 mb-4 justify-content-center">
            	<div class="col-8 mt-3 mb-2">
            		<table class="table">
 						<thead>
 							<tr class="text-center">
 								<th>Green</th>
 								<th>Silver</th>
 								<th>Gold</th>
 								<th>VIP</th>
 								<th></th>
 							</tr>
 						</thead>
 						<tbody>
 							<tr>
 								<td class="align-middle text-center">0</td>
 								<td class="align-middle text-center">30만원</td>
 								<td class="align-middle text-center">60만원</td>
 								<td class="align-middle text-center">90만원</td>
 							</tr>
 						</tbody>
 					</table>
            	</div>
            </div>
            <div class="row mx-2 mt-4 mb-4 border-top border-bottom">
            	<div class="col text-center" style="padding:20px 20px">
					<span class="moviePoint"><strong>POINT</strong></span>
					<span>${user2.point } p</span>
            	</div>
            	<div class="3tabs col text-center" style="padding:20px 20px">
					<span class="couponList"><strong>쿠폰함</strong></span>
					<span class="couponList"><ins style="color:#DC143C">${countCoupon }</ins>개</span>
            	</div>
            	<div class="3tabs col text-center" style="padding:20px 20px">
					<span class="wishlistMovie"><strong>찜한 영화</strong></span>
					<span class="wishlistMovie">${countWish }개</span>
            	</div>
            </div>
         </div>
         <ul class="nav nav-tabs  d-flex justify-content-around" style="padding-top : 15px"id="myTab" role="tablist">
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link active" id="movie-tab" data-bs-toggle="tab" data-bs-target="#movie" type="button" role="tab" aria-controls="movie" aria-selected="true"><strong>예매내역</strong></button>
            </li>
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link" id="payment-tab" data-bs-toggle="tab" data-bs-target="#payment" type="button" role="tab" aria-controls="payment" aria-selected="false"><strong>결제 내역</strong></button>
            </li>
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link" id="movieNote-tab" data-bs-toggle="tab" data-bs-target="#movieNote" type="button" role="tab" aria-controls="movieNote" aria-selected="false"><strong>MY 무비노트</strong></button>
            </li>
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link" id="qna-tab" data-bs-toggle="tab" data-bs-target="#qna" type="button" role="tab" aria-controls="qna" aria-selected="false"><strong>1:1 문의</strong></button>
            </li>
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button" role="tab" aria-controls="info" aria-selected="false"><Strong>MY 정보관리</Strong></button>
            </li>
         </ul>
         <div class="tab-content" id="myTabContent">
         	<div class="tab-pane fade show active mt-4 mb-4" id="movie" role="tabpanel" aria-labelledby="movie-tab">
               <div class="text-center" style="padding:20px">
               		<table class="table">
            			<thead>
            				<tr>
	            				<th>예매 번호</th>
	            				<th>영화 정보</th>
	            				<th>결제 금액</th>
	            				<th>결제 수단</th>
	            				<th>예매 날짜</th>
	            				<th>적립 포인트</th>
            				</tr>
            			</thead>
            			<tbody>
            				<c:choose>
	           					<c:when test="${not empty tickets }">
	           						<c:forEach var="t" items="${tickets }">
	           							<tr>
	           								<td class="align-middle text-center">${t.reservationNo }</td>
	           								<td class="align-middle text-center">${t.movieTitle }</td>
	           								<td class="align-middle text-center">
	           									<fmt:formatNumber value="${t.reservationPrice }" pattern="#,###"/>
	           								</td>
	           								<td class="align-middle text-center">${t.reservationPayment }</td>
	           								<td class="align-middle text-center">
	           									<fmt:formatDate value="${t.reservationCreatedDate }" pattern="yyyy-MM-dd"/>
	           								</td>
	           								<td class="align-middle text-center">${t.reservationPoint }</td>
	           							</tr>
	           						</c:forEach>
	           					</c:when>
	           					<c:otherwise>
	           						<tr>
					               		<td colspan="6" class="text-center py-5"><img alt="ryan" src="./resources/images/user/myPage/ryan.gif" id="ryan" style="padding: 20px"><br/>
					               		최근 관람하신 영화가 없습니다.</td>
	           						</tr>
	           					</c:otherwise>
           					</c:choose>
            			</tbody>
            		</table>
               </div>
            </div>
            <div class="tab-pane fade mt-4 mb-4" id="payment" role="tabpanel" aria-labelledby="payment-tab">
            	<div class="text-center" style="padding:20px">
            		<table class="table">
            			<thead>
            				<tr>
	            				<th>구매 번호</th>
	            				<th>상품 정보</th>
	            				<th>구매 개수</th>
	            				<th>결제 금액</th>
	            				<th>결제 날짜</th>
            				</tr>
            			</thead>
            			<tbody>
            				<c:choose>
	           					<c:when test="${not empty orders }">
	           						<c:forEach var="o" items="${orders }">
	           							<tr>
	           								<td class="align-middle text-center">${o.orderNo }</td>
	           								<td class="align-middle text-center"><a href="/cinemabox/gift">${o.name }</a></td>
	           								<td class="align-middle text-center">${o.orderAmount } 개</td>
	           								<td class="align-middle text-center">
	           									<fmt:formatNumber value="${o.orderPrice }" pattern="#,###"/>원
	           								</td>
	           								<td class="align-middle text-center">
	           									<fmt:formatDate value="${o.orderDate }" pattern="yyyy-MM-dd"/>
	           								</td>
	           								
	           							</tr>
	           						</c:forEach>
	           					</c:when>
	           					<c:otherwise>
	           						<tr>
					               		<td colspan="6" class="text-center py-5"><img alt="ryan" src="./resources/images/user/myPage/ryan.gif" id="ryan" style="padding: 20px"><br/>
					               		최근 결제하신 내역이 없습니다.</td>
	           						</tr>
	           					</c:otherwise>
           					</c:choose>
            			</tbody>
            		</table>
               </div>
            </div>
            <div class="tab-pane fade mt-4 mb-4" id="movieNote" role="tabpanel" aria-labelledby="movieNote-tab">
            	<p class="text-center" style="padding:20px">
               		<img alt="ryan" src="./resources/images/user/myPage/ryan.gif" id="ryan" style="padding: 20px"><br/>
               		작성하신 무비노트가 없습니다.
               </p>
            </div>
            <div class="tab-pane fade mt-4 mb-4" id="qna" role="tabpanel" aria-labelledby="qna-tab">
            	<p class="text-center" style="padding:20px">
               		<button type="button" class="btn btn-warning" onclick="location.href='customerCenter/userInfo'">나의 문의 내역 확인하기</button>
               </p>
            </div>
            <div class="tab-pane fade mt-4 mb-4" id="info" role="tabpanel" aria-labelledby="info-tab">
            	<div class="row">
            		<div class="col-6 offset-3 text-center">
            			<form id="form-register" method="post" action="updateUserInfo" novalidate="novalidate">
						<div class=" border pr-3 pl-3 mb-3">
							<div class="form-group row mb-1">
								<label class="col-3 col-form-label">아이디</label>
								<label class="col-3 col-form-label">${LOGINED_USER.id } 님</label>
							</div>
							<div class="form-group row mb-1">
								<label class="col-3 col-form-label">이름</label>
								<label class="col-3 col-form-label">${LOGINED_USER.name }</label>
							</div>
							<div class="form-group row mb-1">
								<label class="col-3 col-form-label">비밀번호</label>
								<div class="col-8">
									<div class="form-group row mb-1">
										<label class="col-8 col-form-label"><button class="btn btn-outline-warning">비밀번호 변경하기</button></label>
									</div>
									<!--  
									<div class="form-group row mb-1">
										<label class="col-4 col-form-label">새로운 비밀번호</label>
										<div class="col-8">
											<input type="password" id="newPassword" name="newPassword"class="form-control">
										</div>
									</div>
									<div class="form-group row mb-1">
										<label class="col-4 col-form-label">비밀번호 확인</label>
										<div class="col-8">
											<input type="password" id="newPasswordConfirm" name="newPasswordConfirm" class="form-control">
										</div>
									</div>
									-->
								</div>
							</div>
							<div class="form-group row mb-1">
								<label class="col-3 col-form-label">주소</label>
								<div class="col-8">
									<input type="text" id="address" name="address" class="form-control">
								</div>
							</div>
							<div class="form-group row mb-1">
								<label class="col-3 col-form-label">이메일</label>
								<div class="col-8">
									<input type="text" id="email" name="email" class="form-control">
								</div>
							</div>
							<div class="form-group row mb-3">
								<label class="col-3 col-form-label">전화번호</label>
								<div class="col-8">
									<input type="text" id="phoneNumber" name="phoneNumber" class="form-control">
								</div>
							</div>
							</div>
							<div class="text-center mb-2">
								<button type="button" class="btn btn-warning px-5" id="updateButton">확인</button>
							</div>
						</form>
            		</div>
            	</div>
            </div>
        </div>
     </div>
  </div>
<!-------------------쿠폰함 모달  ---------------------------->
<!-- Vertically centered modal -->
<div class="modal fade" id="couponModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" id="couponWidth">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><strong>${LOGINED_USER.name }</strong>님의 쿠폰함<i class="fas fa-paper-plane"></i></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="row">
       		<div class="col d-flex justify-content-center">
       			<table class="table">
           			<thead>
           				<tr class="text-center">
           					<th>쿠폰 번호</th>
           					<th>쿠폰</th>
           					<th>만료 기간</th>
           			</thead>
            		<tbody>
	            		<c:choose>
	            			<c:when test="${not empty coupons }">
	            				<c:forEach var="c" items="${coupons }">
	            					<tr>
	            						<td class="align-middle text-center">${c.couponNo }</td>
	            						<td class="align-middle text-center">${c.couponType }</td>
	            						<td class="align-middle text-center">
	            							<fmt:formatDate value="${c.couponExpDate }" pattern="yyyy-MM-dd"/>
	            						</td>
	            					</tr>
	            				</c:forEach>
	            			</c:when>
	            			<c:otherwise>
	            				<tr>
				               		<td colspan="6" class="text-center py-5"><img alt="ryan" src="./resources/images/user/myPage/ryan.gif" id="ryan" style="padding: 20px"><br/>
				               		소유하신 쿠폰이 없습니다.</td>
			               		</tr>            			
	            			</c:otherwise>
	            		</c:choose>
	            	</tbody>
            	</table>
       		</div>
       	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning btn-sm" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-------------------찜한 영화 모달 --------------------------->
 <div class="modal fade" id="wishlistMovieModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="exampleModalLabel"><strong>${LOGINED_USER.name }</strong>님이 <i class="fas fa-heart"></i> 한 영화</h5><small id="wishNum">  ${countWish }개</small>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
      		<div class="modal-body">
        		<div class="row">
        			<div class="col d-flex justify-content-center">
    					<c:choose>
    						<c:when test="${not empty wishlists }">
    							<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
							  		<div class="carousel-inner">
    									<c:forEach var="wish" varStatus="loop" items="${wishlists }">
							    			<div class="carousel-item ${loop.index eq 0 ?'active': '' }">
							      				<a href="/cinemabox/movieDetail?no=${wish.movieNo }"><img  
							      					class="img-thumbnail" src="/cinemabox/resources/images/movie/${wish.movieNo }.jpg"></a>
							      			<div class="d-flex justify-content-center"><strong><${wish.movieTitle }></strong></div>
							    		</div>
    									</c:forEach>
							  		</div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>
    						</c:when>
    						<c:otherwise>
    								<div colspan="6" class="text-center py-5"><img alt="ryan" src="./resources/images/user/myPage/ryan.gif" id="ryan" style="padding: 20px"><br/>
    								찜한 영화가 없습니다.</div>
    						</c:otherwise>
    					</c:choose>
        			</div>
        		</div>
      		</div>
    	</div>
  	</div>
</div>
<%@include file="../common/footer.jsp" %>
<script type="text/javascript">
$(function(){
	var wishlistMovieModal = new bootstrap.Modal(document.getElementById("wishlistMovieModal"), {
	    keyboard: false
	});
	 
	var couponModal = new bootstrap.Modal(document.getElementById("couponModal"),{
		keyboard:false	
	});
	
	$(".wishlistMovie").click(function(){
		wishlistMovieModal.show();
	});
	
	$(".couponList").click(function(){
		couponModal.show();
	});
});

</script>
</body>
</html>