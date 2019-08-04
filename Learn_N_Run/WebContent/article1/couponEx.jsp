<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(function() {
	$("#coupon_h").click(function() {
		$(".coupon_modal_h").toggle();
		$.ajax({
			url:"selectCouponCount.do",
			type:"post",
			success : function(data) {
				var jsonInfo = JSON.parse(data);
				$(".coupon1_h").text(jsonInfo.sale1+'개');
				$(".coupon2_h").text(jsonInfo.sale2+'개');
				$(".coupon3_h").text(jsonInfo.sale3+'개');
			}
		});
	});	
});	
</script>

<title>Insert title here</title>
<style type="text/css">
	.coupon_modal_h{
		    background-color: white;
		    position: fixed;
		    display: none;
		    z-index: 1;
		    overflow: hidden;
		    left: 0;
		    top: 0;
		    width: 300px;
   			height: 400px;
		    -webkit-border-radius: 3px;
		    -webkit-box-shadow: 0px 0px 20px #999;
		    left: 15%;
		    top: 11%;
		}
		
		.coupon_title_h{
		    width: 100%;
			  height: 40px;
			  text-align: center;
			  font-size: 20px;
			  font-weight: 700;
			  border-bottom: 0.5px solid lightgray;
			  background-color: black;
			  color: white;
			  line-height: 40px;
		}
		
		.coupon_modal_h table{
			    width: 100%;
			    border-spacing: 10px;
			    border-collapse: separate;
		}
		
		.coupon_modal_h tr{
			padding: 5px 5px 5px 10px;
		}
		
		.coupon_modal_h th{
			width: 80%;
			height: 90px;
			
			background-color: black;
		}
		
		.coupon_modal_h td{
			font-size: 20px;
			font-weight: 700;
			text-align: center;
			
		}
		
		.coupon_bottom_h{
			line-height: 40px;
			text-align: center;
			font-size: 20px;
			font-weight: 700;
		}
		
		.coupon1{
			background: url("img/5000coupon.png");
			background-size: 100% 100%;
		}
		
		.coupon2{
			background: url("img/7000coupon.png");
			background-size: 100% 100%;
		}
		
		.coupon3{
			background: url("img/10000coupon.png");
			background-size: 100% 100%;
		}

</style>
</head>
<body>
	<div class="coupon_modal_h">
		<div class="coupon_title_h">내 쿠폰 보유 현황</div>
		<table class ="coupon_cate_h">
			<tr>
				<th class="coupon1"></th>
				<td class="coupon1_h"></td>
			</tr>
			<tr>
				<th class="coupon2"></th>
				<td class="coupon2_h"></td>
			</tr>
			<tr>
				<th class="coupon3"></th>
				<td class="coupon3_h"></td>
			</tr>
		</table>
		<a href="event.do"><div class="coupon_bottom_h">쿠폰 받으러 가기!</div></a>
	</div>
</body>
</html>