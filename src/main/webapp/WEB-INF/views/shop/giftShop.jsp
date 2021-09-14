<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>   
<title>GIFT[Shop]</title>
</head>
<body>
<div class="container">
<%@include file="../common/header.jsp" %>
<%@include file="shopHeader.jsp" %>
<!-- Header-->
    <header class="bg-warning py-2">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">CINEMA BOX</h1>
                <p class="lead fw-normal text-white-50 mb-0">CINEMA BOX GIFT[Shop]</p>
            </div>
        </div>
    </header>
    <!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
    	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:choose>
				<c:when test="${empty gifts }">
					<tr>
						<td class="text-center" colspan="12">등록된 GIST정보가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="gift" items="${gifts }">
						<div class="col mb-5">
					    	<div class="card h-100">
          						<!-- Sale badge-->
								<c:if test="${gift.name eq '일반 관람권'}">
									<div class="badge bg-dark text-white position-absolute" style="top: 0.9rem; laft: 0.5rem;"><c:out value='대표 상품'></c:out></div>
								</c:if>
								<c:if test="${gift.discountPrice ne 0}">
									<div class="badge bg-warning text-white position-absolute" style="top: 0.9rem; right: 0.5rem"><c:out value='Sale'></c:out></div>
								</c:if>
								<!-- Product image-->
								<a href="giftDetail?giftNo=${gift.giftNo }">
									<img class="card-img-top" src="/cinemabox/resources/images/gift/${gift.giftNo }.jpg" alt="..." />
								</a>
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<strong><span style = "font-size:1.5em;">${gift.name }</span></strong>
										<p class="bundle">${gift.name }</p><hr>
										<c:choose>
											<c:when test="${gift.discountPrice eq 0}">
												<br><strong>${gift.price } 원</strong>
											</c:when>
											<c:otherwise>
												<span class="text-muted text-decoration-line-through"><fmt:formatNumber type="number" maxFractionDigits="3" value="${gift.price }" /> 원</span><br>
												<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${gift.discountPrice }" /> 원</strong>
												</c:otherwise>
										</c:choose>
								    </div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								    <div class="text-center" id="purchase">
								  		<a href="giftDetail?giftNo=${gift.giftNo}" class="btn btn-outline-warning mt-auto">구매하기</a>
								    </div>
					           	</div>
					    	</div>
						</div>
        			</c:forEach>
				</c:otherwise>
			</c:choose>
       </div>
	</div>
</section>
<!-- Footer-->
<footer class="py-5 bg-warning">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; CINEMA BOX</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">
$("#test").click(function() {
	var isLogined = $("[name=isLogined]").val();
	if(isLogined == 'no'){
		alert("로그인이 필요한 서비스입니다.");
			loginModal.show();
		return false;
	}
})

</script>
</body>
</html>