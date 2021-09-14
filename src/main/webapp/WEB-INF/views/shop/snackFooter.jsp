<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul class="dropdown-menu1 border" aria-labelledby="navbarDropdown1" id="btn-1">
	<li>구매 후 취소에 관한 내용보기 <span class="float-end">▽</span><br>
		<p id="box-1" style="display:none;">
		■ 연장/취소/환불 안내<br>
		- 본 상품은 구매일로부터 10일 이내에 취소 가능합니다.<br>
		- 유효기간은 본 상품의 유효기간 내에서 연장 신청이 가능하며, 1회 연장 시 3개월(92일) 단위로 연장됩니다.<br>
		- 구매일로부터 5년까지 유효기간 연장이 가능합니다.<br>
		- 최초 유효기간 만료 후에는 결제금액의 90%에 대해 환불 요청 가능하며, 환불 처리에 7일 이상의 시간이 소요될 수 있습니다. (접수처: 1544-0070)<br>
		- 구매 취소 및 환불 요청은 미사용 상품에 한해 가능하며, 사용한 상품에 대해서는 불가합니다.<br>
		- 본 상품은 현금으로 환불이 불가합니다.<br>
		- 환불 요청한 포인트 중 소멸 포인트가 포함되어있다면 환불 요청한 월의 말일까지 사용 가능한 포인트로 돌아갑니다.<br>
		<br>
		※ 2020년 2월 4일 이후 구매 상품에 한하여 유효기간 연장 신청이 가능합니다.</p>
	</li>
</ul>
<br>
<br>
<ul class="dropdown-menu2 border" aria-labelledby="navbarDropdown2" id="btn-2">
	<li>상품 이용안내 내용보기 <span class="float-end">▽</span><br>
		<p id="box-2" style="display:none;">
		- 본 상품의 사용 기한은 구매일로부터 92일까지입니다.<br>
		- 영화관 매점에서 스토어 쿠폰번호 제시 후 상품으로 교환하실 수 있습니다.<br>
		- 본 상품은 온라인 전용 판매 상품으로 현장 구매는 불가합니다.<br>
		- 구매한 상품은 “마이페이지 > 스토어 구매내역”에서 확인할 수 있습니다.<br>
		- 팝콘 및 음료의 맛, 크기, 종류 변경 시 추가 금액이 발생할 수 있습니다.<br>
		- 본 상품은 포인트 사용분 외 실 결제금액에 한하여 교환권 사용시 적립 가능합니다.</p>
	</li>
</ul>
<script type="text/javascript">
$("#btn-1").click(function() {
    $( "#box-1" ).slideToggle( "slow" );
});

$("#btn-2").click(function() {
    $( "#box-2" ).slideToggle( "slow" );
}); 
</script>
      

