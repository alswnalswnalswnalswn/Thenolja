<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="thenolja.member.model.vo.Member, thenolja.tb_coupon.model.vo.Coupon, thenolja.nonmem.model.vo.SelectNonmemReser" %>
<%@ page import="java.util.ArrayList" %>   
<%
	ArrayList<Coupon> list = (ArrayList<Coupon>)request.getAttribute("insertReservation");

	SelectNonmemReser snr = (SelectNonmemReser)request.getAttribute("snr");
%>   
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>숙소이용목록상세조회</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    * {
        box-sizing: border-box;
    }
    #content{
    	padding-top: 20px;
        width: 900px;
        height: 1500px;
        margin: auto;
    }

    #detail{
        height: 95%;
    }

    #left_img{
        width: 5%;       
        float: left;
    }
    #left_title{
        width: 95%; 
    }
    #reser_info{
        width: 100%;
        height: 25%;
        border-bottom: 1px solid silver;
    }
    #reser_info, #reser_price{width: 100%;}
    #reser_hotel_img{
        width: 30%;
        height: 90%;
        margin-left: 30px;
        float: left;
    }
    #reser_hotel_img > img{
        border-radius: 10px;
        width: 250px;
        height: 250px;
        margin-left: 20px;
        margin-top: 20px;
    }
    #reser_detail{
        width: 70%;
        height: 90%;
        padding-top: 40px;
        font-size: 20px;
        margin-left: 400px;
    }
    #price_info{
        width:100%;
        height: 80%;
    }
    #reser_price{
        width:100%;
        height: 10%;
        font-size: 23px;
        padding-top: 40px;
        border-bottom: 1px solid silver;
        text-align: center;
    }
    #reser_mem_info{
        width: 100%;
        height: 28%;
        border-bottom: 1px solid silver;
    }
    #reser_mem_info > *{
        margin-top: 10px;
        height: 100%;
    }
    #mem-name{
        width: 50%;
        height: 70%;
        float: left;
        padding-left: 50px;
    }

    #mem-bicycle{
        padding-left: 50px;
        height: 30%;
        padding-bottom: 20px;
        margin-top: 10px;
    }
    #mem-bicycle > input{
        margin-top: 20px;
        margin-left: 20px;
    }
    #reser-coupon{
        padding-left: 50px;
        width: 100%;
        height: 27%;
        margin-top: 20px;
        margin-bottom: 50px;
    }
    #in-coupon{
        width: 100px;
        height: 40px;
        margin-left: 3px;
        border-radius: 5px;
        border: 0;
        background-color: #5BA199;
        color: white;
        font-size: 17px;
        font-weight: bold;
    }
    #in-coupon:hover{font-size: 18px;}
    #reser_pay{
        width: 100%;
        height: 28%;
        padding-left: 50px;
        padding-top: 40px;
        padding-bottom: 50px;
        border-top: 1px solid silver;
    }
    #payment{
        border-radius: 5px;
        border: 0;
        background-color: #5BA199;
        color: white;
        font-size: 23px;
        font-weight: bold;
        width: 300px;
        height: 50px;
    } 
    #payment:hover, #reser-btn:hover{
        font-size: 24px;
    }
    #reservation{
        width: 100%;
        height: 7%;
    }
    #reser-btn{
        width: 50%;
        height: 50px;
        border-radius: 5px;
        border: 0;
        background-color: #5BA199;
        color: white;
        font-size: 23px;
        font-weight: bold;
        margin-left: 300px;
    }
</style>
</head>
<body>
    
    <%@ include file="../common/menubar.jsp" %>
	<% if(loginUser == null) { %>
	<script>
		alert("로그인이 되어있지 않습니다. 로그인페이지로 이동합니다.");
		location.href = '<%=contextPath%>/loginPage';
	 </script>
	<% } else {%>
    <!-- 0. 전체 감싸는 div 시작 -->
    <div id="content">
    
    	<!-- 0-1. 왼쪽 상단 '<' 숙소예약 시작 -->
        <div id="content_title">
        
            <div id="left_img">
                <a href="<%= contextPath%>"><img src="https://www.pngarts.com/files/2/Left-Arrow-PNG-Free-Download.png" alt="왼쪽 화살표" width="40px"></a>
            </div>
            
            <div id="left_title">
            	<h2>숙소 예약</h2>
            </div>
        </div>
        <!-- /0-1. 왼쪽 상단 '<' 숙소예약 끝 -->
        
       <!-- 0-2. 호텔정보 & 가격 & 예약자 & 쿠폰 & 결제  정보 시작 -->
		<div id="detail">
		
			<!-- 0-2-1. 호텔 정보 -->
			<div id="reser_info">
				
	    		<div id="reser_hotel_img">
	    			<img src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/82237660.jpg?k=cb5db13896d348f7c4b47e3922a6753f83b5c36ba7b71a6f820523d07365fc2c&o=&hp=1" alt="" width="300px" height="300px">
    			</div>
	
				<div id="reser_detail">
					<input type="hidden" name="hotelNo" value="<%=snr.getHotelNo() %>">
			        <h2><%=snr.getHotelName() %></h2>
			        <p><%=snr.getRoomName() %></p>
			        <p><%=snr.getMaxPeople() %></p>
			        <p><%=snr.getPaymentPrice() %></p>
			        <p><%=snr.getCheckInTime() %> ~ <%=snr.getCheckOutTime() %></p>
			        
    			</div>
			</div>
			<!-- /0-2-1. 호텔 정보 끝 -->
			
			<!-- 0-2-2. 가격 & 예약자 & 쿠폰 & 결제 정보 시작 -->
	        <div id="price_info">
	        	
	        	<!-- 0-2-2-1. 가격정보 시작 -->
	        	<div id="reser_price">
	        		<table>
	        			<tr>
	        				<td width="400px">결제금액 : 333,000원</td>
							<td width="20px"><img src="https://cdn-icons-png.flaticon.com/512/561/561179.png" alt="" width="20px"></td>
							<td width="400px">할인 금액 : 0원</td>
							<td width="25px"><img src="https://cdn-icons-png.flaticon.com/512/6492/6492285.png" alt="" width="25px"></td>
							<td width="400px" style="font-weight: bold;">결제금액 : 333,000원</td>
						</tr>
	               </table>
				</div>
				<!-- /0-2-2-1. 가격정보 끝 -->

				<form action="<%= contextPath %>/insert.reser?memNo=<%=loginUser.getMemNo() %>&hotelNo=<%=snr.getHotelNo() %>" method="post" id="insert-form">
				
					<!-- 0-2-2-2. 예약자 정보 시작(얘 정보 뽑아서 DB에 저장할 용도) -->
					<div id="reser_mem_info">
						
		                <br>
						<h3 id="info" style="margin-left: 50px;">예약자 정보</h3>
						<br>
	               		<div id="mem-name">
		                    <h5>예약자 이름</h5>
		                    <input type="text" id="reser-name" name="memName" placeholder="이름을 입력해주세요" style="width:300px; height:40px; border-radius: 5px;">
	           			</div>
		                <div id="mem-phone">
		                    <h5>전화 번호</h5>
		                    <input type="text" id="reser-phone" name="memPhone" placeholder="전화번호를 입력해주세요" style="width:300px; height:40px; border-radius: 5px;">
		                </div>
		                <div id="mem-bicycle">
							<br> <h5>이동 방식</h5>
						    <input type="radio" name="bicycle" id="car" value="차량"> 차량
						    <input type="radio" name="bicycle" id="walk" checked value="도보"> 도보
						</div>
						
	                </div>
	                <!-- /0-2-2-2. 예약자 정보 끝 -->
	                
	                <!-- 0-2-2-3. 쿠폰 정보 시작 -->
	                <div id="reser-coupon">
	                
	                    <br>
	                    <h3>할인</h3>
	                    <br>
	                    <h5>쿠폰</h5>
	                    <br>
	                    <input type="text" name="couponName" style="width:300px; height:40px; border-radius: 5px;" placeholder="[10% 혜택] 회원 등급 쿠폰">
	                    
	                    <button type="button" data-toggle="modal" data-target="#myModal" id="in-coupon">쿠폰 적용</button>
	           
	                </div>
	                <!-- /0-2-2-3. 쿠폰 정보 끝 -->
	                
	                <!-- 0-2-2-4. 결제 정보 시작 -->
	                <div id="reser_pay">
	                    <h3>결제 수단</h3>
	                    <br>
	                    <input type="button" id="payment" value="무통장 입금">
	                    <br><br>
	                    <h5>신한은행 110-424-432780 예금주((주)더놀자)</h5>
	                    <h5 style="color:red">"반드시 예약자 성함으로 입금해주세요"</h5>
	                </div>
	                <!-- /0-2-2-4. 결제 정보 끝 -->
	                
	                <!-- 0-2-2-5. 폼태그 안에 있는 모든 정보를 서블릿으로 보내주는 버튼 div 시작 -->
	                <div id="reservation">
	                    <button type="submit" id="reser-btn">?원 결제하기</button>
	                </div>

	                <!-- /0-2-2-5. 폼태그 안에 있는 모든 정보를 서블릿으로 보내주는 버튼 div 끝 -->
	            </form>
			</div>
			<!-- /0-2-2. 가격 & 예약자 & 쿠폰 & 결제 정보 끝 -->
		</div>
		<!-- /0-2. 호텔정보 & 가격 & 예약자 & 쿠폰 & 결제  정보 끝 -->
    </div>
    <!-- /0. 전체 감싸는 div 끝 -->
    
    
    <div class="container">
    	<!-- The Modal -->
	 	<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-dialog-centered">
	      		<div class="modal-content">
	        		<div class="modal-header">
			        <h4 class="modal-title">내 쿠폰</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        		</div>
	        
			        <div class="modal-body">
			        <table class="table table-hover">
		        
					<% if(list.isEmpty()) { %>
		                <tr>
		                   <th colspan="5">쿠폰이 존재하지 않습니다.</th>
		                </tr>
		             <% } else { %>
		               
			             <% for(Coupon c : list) { %>
			             	<tr class="list">
			                <td><%= c.getCouponNo() %></td>
			                <td><%= c.getCouponContent() %></td>
			                <td><%= c.getCouponDate() %></td>
			                <td><%= c.getCouponCode() %></td>
			                </tr>
		                <% } %>
	                <% } %>
	                </table>
					</div>
				
					<div class="modal-footer">
		         	<button type="button" class="btn btn-secondary" data-dismiss="modal">적용</button>
		       		</div>
	     		</div>
			</div>
		</div>
	</div>
<% } %>
</body>
</html>