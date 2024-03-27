<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,   thenolja.admin.refund.model.vo.AdminRefund , thenolja.common.model.vo.PageInfo" %>        
<%
	AdminRefund adminRefund = (AdminRefund)request.getAttribute("adminRefund");

	ArrayList<AdminRefund> list = (ArrayList<AdminRefund>)request.getAttribute("selectRefundNonMemberList");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	int currentPage = pageInfo.getCurrentPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();

%>    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <title>환불 비회원 목록</title>
	
 	<link rel="stylesheet" href="resources/css/admin_select.css">    
</head>
<body>
    
    <div id="wrap">
        <div id="header">
        
       		<%@ include file="../../common/adminMenubar.jsp" %> 

        </div>
               
        <div id="content">
            <div id="content_1">

                <form action="#" method="get" id="search_member">
                    <div id="search_id">
                        <input type="text" placeholder="예약자명 입력" name="memId">
                    </div>
        
                    <div id="search_btn">
                        <button type="submit" class="btn btn-outline-info">검색</button>
                    </div>
                </form>

            </div>
            <div id="content_2">

                <div id="mem_list_header">

                    <div id="mem_title">
                        <h2>비회원 환불 목록</h2>
                    </div>
        
                    <div id="mem_sort">
                        <select>
                            <option value="newest">최신순</option>
                            <option value="oldset">오래된순</option>
                        </select>
        
                    </div>
        
                </div>
        
                <div id="mem_list">
                    <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>예약번호</th>
                            <th>예약자명</th>
                            <th>전화번호</th>
                            <th colspan="2"></th>
                          </tr>
                        </thead>
                        <tbody>
                        
                        <% if(list.isEmpty()) { %>
                        	<tr>
                        		<th colspan="3">환불 비회원이 존재하지 않습니다.</th>
                        	</tr>
                        <% } else { %>
                        	<% for(AdminRefund refunNonMem : list) { %>
                        		<tr>
                        			<td><%=refunNonMem.getReserNo() %></td>
                        			<td><%=refunNonMem.getReserName() %></td>
                        			<td><%=refunNonMem.getMemPhone() %></td>
                        			<td><button class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#myModal" onclick="selectRefundMember(<%=refunNonMem.getReserNo()%>)">조회</button></td>
                        		</tr>
                        	<% } %>
                        <% } %>
    
                   
                        </tbody>
                      </table>

                </div>
        
                <div class="paging-area" align="center";>
                	
                	<%if(currentPage > 1) { %>
                    <button class="btn btn-sm btn-outline-secondary" onclick="location.href='<%=contextPath%>/refundNonMem?currentPage=<%=currentPage - 1%>'"><</button>
                    <% } %>
                    
                    <% for(int i = startPage; i <= endPage; i++) { %>
                    	<% if(currentPage != i) {%>
                    		<button class="btn btn-sm btn-outline-secondary" onclick="location.href='<%=contextPath%>/refundMem?currentPage=<%=i%>'"><%=i %></button>
                    	<% } else { %>
                    		<button  disabled class="btn btn-sm btn-outline-secondary"><%=i %></button>
                    	<% } %>
                    
                    <% } %>
                    
                    <% if(currentPage != maxPage) { %>
                    <button class="btn btn-sm btn-outline-secondary">></button>
                	<% } %>
                </div>
        

            </div>
        </div>
        <div id="footer"></div>

    </div>
    
    <script>
    	function selectRefundMember(e){
    		console.log(e);
    		$.ajax({
    			url : 'refundMember.do',
    			data : {reserNo : e},
    			type : 'get',
    			success : function(result){
					$('#hotelName').text(result.hotelName);
					$('#refundName').text(result.refundName);
					$('#reserDate').text(result.reserDate);
					$('#bank').text(result.bank);
					$('#refundPrice').text(result.refundPrice);
					$('#refundAccNo').text(result.refundAccNo);
    			}
    		})
    	}
    
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    

 <!-- 회원 상세 조회 모달 -->
 <div class="modal" id="myModal">

    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
            <p class="modal-title"> 환불 상세 정보</p>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <table>
                <tr>
                    <td colspan="5" rowspan="5" width="120" height="120" ><img src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/82237660.jpg?k=cb5db13896d348f7c4b47e3922a6753f83b5c36ba7b71a6f820523d07365fc2c&o=&hp=1" alt="" width="120px"></td>
                    <td width="200">숙소 정보</td>
                    <td>환불자 정보</td>
                </tr>
                <tr>
                    <td><span id="hotelName"></span></td>
                    <td>예금주 : <span id="refundName"></span></td>
                
                </tr>
                <tr>
                    <td>예약일 : <span id="reserDate"></span></td>
                    <td>은행 : <span id="bank"></span></td>
                </tr>
    
                <tr>
                    <td>환불 금액 : <span id="refundPrice"></span></td>
                    <td>계좌번호 : <span id="refundAccNo"></span></td>
                </tr>

              </table>

        </div>

    
        
      </div>
    </div>
  </div>
  











</body>
</html>