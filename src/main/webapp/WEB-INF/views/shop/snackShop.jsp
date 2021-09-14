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
<title>SNACK[Shop]</title>
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
                <p class="lead fw-normal text-white-50 mb-0">CINEMA BOX SNACK[Shop]</p>
            </div>
        </div>
    </header>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
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
					                	<!--png 파일  -->
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
        </div>
    </section>
<!-- Footer-->
<footer class="py-5 bg-warning">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; CINEMA BOX</p></div>
</footer>
<%@include file="../common/footer.jsp" %>
</div>
</body>
</html>