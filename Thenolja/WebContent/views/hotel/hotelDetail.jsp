<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="thenolja.tb_hotel.model.vo.*" %>    
    
    <%
     	DetailHotel dh = (DetailHotel)request.getAttribute("hotelDetail");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#detail-content{
	width: 100%;
	height: 100%;
	padding-bottom: 50px;
}
#detail-wrap {
	width: 1200px;
	height: auto;
	margin: auto;
}
#content-title {
	display: flex;
	align-items: center;
	justify-content: space-around;
}
#detail-content-btns{
	float: right;
}
#detail-content-title{
	margin: auto;
	margin-top: 30px;
	width: 80%;
}
#detail-content-img{
	margin: auto;
	width: 80%;
	border-radius: 10px;
	box-shadow: 2px 2px 2px gray;
}
#detail-content-img > img{
	width:100%;
	height: 500px;
	border-radius: 10px;
}
#detail-content-imgInfo{
	margin: auto;
	width: 80%;
	display: flex;
	justify-content: space-between;
	height: 40px;
	border-bottom: 1px solid gray;
	padding: 10px;
}
#detail-content-services{
	margin: auto;
	width: 80%;
	height: 50px;
	border-bottom: 1px solid gray;
}
#detail-content-services > ul {
	list-style: none;
	margin: 0px;
}

#detail-content-services li {
	padding: 10px;
	float: left;
}
#detail-content-rooms {
	margin: auto;
	width: 80%;
	padding: 10px;
}
.content-rooms-card{
	width: 80%;
	height: 28%;
	margin: auto;
	border: 1px solid gray;
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 10px;
	padding: 10px;
}
.content-rooms-card:hover{
	scale: 102%;
	cursor: pointer;
	border-color: skyblue;
}
.content-rooms-card img {
	width: 30%;
	height: 90%;
	border-radius: 10px;
	box-shadow: 2px 2px 2px gray;

}
#detail-content-intro {
	border-top: 1px solid gray;
}
#detail-content-intro, #detail-content-cancel {
	width: 80%;
	text-align: center;
	margin: auto;
	border-bottom: 1px solid gray;
}
#detail-content-intro, #detail-content-cancel {
	padding: 10px;
}
#detail-content-review {
	width: 80%;
	height: auto;
	overflow:hidden;
	margin: auto;
	padding: 10px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}
.content-review-1 {
	width: 60%;
	height: 80px;
	margin: auto;
	margin-top: 15px;
	border-radius: 12px;
	padding: 10px;
	float:left;
}
.review-1-div {
	display: flex;
	justify-content: space-between;
	margin: 0px 3px;	
}
.review-1-content {
	font-size: 14px;
}
.admins {
	float: right;
}
#detail-content-imgInfo span{
	padding: 3px;
}
.content-rooms-card div {
	padding: 5px;
	font-size: 14px;
}
.room-infos {
	width: 40%;
}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div id="detail-wrap">
		<%@ include file="./common/searchForm.jsp" %>
		<%if(dh != null) { %>
		<div id="detail-content">
			<div id="detail-content-btns">
				<button class="btn btn-sm btn-primary" >예약하기</button>
				<button class="btn btn-sm btn-primary" >비회원예약하기</button>
			</div>
			
			<div id="detail-content-title">
				<h3>
					<span><%= dh.getHotelName() %></span> <span>호텔</span>
				</h3>
			</div>
			<div id="detail-content-img">
				<img src="<%= dh.getHotelPath() %>" alt="pic">
			</div>
			
			<div id="detail-content-imgInfo">
				<div>
					 <span>★</span>
					 <span><%= dh.getCountReviews() %> 개의 리뷰</span>
					 <span>리뷰조회</span>
				</div>
				<div>
					<span><%= dh.getHotelCate() %></span>
				</div>
			</div>
			
			<div id="detail-content-services">
				<ul>
					<%for(ServiceList sl : dh.getSerList()) { %>
						<li><%= sl.getServiceName() %></li>
					<%} %>
					
				</ul>
			</div>
			
			<div id="detail-content-rooms">
				<h3 style="text-align: center; margin-top: 5px;">객실</h3>
					<%for(RoomInfo ri : dh.getRoomList()) { %>
					<div class="content-rooms-card">
						<img src="<%= ri.getRoomImg() %>">
						<div class="room-infos">
							<h4><%= ri.getRoomName() %></h4>
							<p>입실시간 : <%= ri.getCheckInTime() %></p>
							<p>퇴실시간 : <%= ri.getCheckOutTime() %></p>
							<p>가격 : <%= ri.getRoomPrice() %></p>
						</div>
						<div>
							<p>쿠폰적용가능</p>
							<%-- 객실예약 기능 추가 예정 --%>
							<button class="btn btn-sm btn-info">객실 예약</button>
						</div>
					</div>			
					<%} %>
			</div>
			
			<div id="detail-content-intro">
				<h3>숙소소개</h3>
				<p><%= dh.getHotelIntro() %></p>
			</div>
			
			<div id="detail-content-cancel">
				<h3>예약 취소 및 환불 규정</h3>
				<p>
				    자세한 사항은 더놀자 홈페이지 고객센터의 자주 묻는 질문에서 확인해주세요.
				</p>
			</div>
			
			<div>
				<h3 style="text-align: center; margin-top: 10px;">이용자 후기</h3>
				<div id="detail-content-review">
					<%for(HotelReview hr : dh.getReviewList() ){ %>
					<div class="content-review-1 card" id="<%= hr.getReserNo() %>">
						<div class="review-1-div">
							<span>작성자 : <%= hr.getReserName() %> </span>
							<span>작성일 : <%= hr.getCreateDate() %> </span>
							<span>리뷰 점수 <%= hr.getReviewScore() %></span>
						</div>
						<div class="review-1-content">
							<span><%= hr.getReviewContent() %></span>
						</div>
					</div>
					<%} %>
				</div>
			</div>
			
		</div>
		<%} else { %>
			<h1>찾을 수 없습니다.</h1>
		<%} %>
	</div>
	
	<script>
		$(function(){
			$.ajax({
				url: "commentAdmin.jqAjax",
				data: {
					hotelNo: '<%= dh.getHotelNo() %>'
				},
				type: 'get',
				success: function(result){
					for(let i = 0; i < result.length; i++){
						$('.content-review-1').each(function(idx, ele){
							if($(ele).attr('id') == result[i].reserNo){
								console.log(result);
								$(ele).after('<div class="content-review-1 card admins" style="border: 1px solid skyblue;" >'
											+'<div class="review-1-div">'
											  +'<p>작성자 : '+ result[i].nickname +'</p>'
											  +'<p>작성일 : '+ result[i].createDate +'</p>'   
										    +'</div>'
										    +'<div class="review-1-content" >'
										    	+'<span>'+result[i].commentContent+'</span>'
										    +'</div>'
										+'</div>');
							
							}
						});
						
						
					}
				},
				error : function(result){
					console.log(result);
				},
				
			});
			
		});
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>