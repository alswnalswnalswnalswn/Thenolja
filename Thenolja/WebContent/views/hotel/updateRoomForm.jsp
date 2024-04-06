<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, thenolja.tb_hotel.model.vo.*" %>    
    <%
    	int roomNo = (int)request.getAttribute("roomNo");
    	Room room = (Room)request.getAttribute("room");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateRoom Form</title>
<style>
div {
	box-sizing: border-box;
}

#title-div {
	width: 100%;
	height: 10%;
	margin: auto;
	border-bottom:  1px solid gray;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#title-div>h2 {
	margin-top: 15px;
	margin-left: 15px;
	font-weight: bold;
}

#wrap {
	width: 1200px;
	height: 850px;
	margin: auto;
	padding : 10px;
}
#content-div{
	width: 100%;
	height: 80%;
	padding: 10px;
}
#content-add-form{
	width:100%;
	height: 80%;
}
#timeOptions{
	display: flex;
	align-items: center;
	flex-wrap: nowrap;
}
#timeOptions label{
	font-size: 12px;
}
.content-div-1{
	width: 32%;
	height: 60%;
	padding: 5px;
	margin: auto;
	border-radius: 8px;
	box-shadow: 5px 3px 3px gray;
	display: inline-block;
}
#content-add-sect{
	display:flex;
	align-items: center;
}
#btn-div{
	margin-top: 20px;
}
.form-group > input {
	margin-left: 10px;
}
 input[type="time"] {
	width: 65%;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="wrap">
		<div id="title-div">
			<h2>객실정보수정</h2>
		</div>
		<div id="content-div">
			<form id="content-add-form" action="<%= contextPath %>/updateRoom.rooms" enctype="multipart/form-data" method="post">
			<input type="hidden" name="roomNo" value="<%= roomNo %>" >
			<section id="content-add-sect">
				<div class="content-div-1">
					<div class="form-group">
					  <label>객실이름</label>
					  <input type="text" class="form-control" name="roomName" required oninput="testVal(this,roomName);" value="<%= room.getRoomName() %>">
					</div>
					
					<div class="form-group">
					  <label>최대인원</label>
					  <input type="text" class="form-control" maxlength="3" name="maxPeople" required oninput="testVal(this,maxPeople);"  value="<%= room.getMaxPeople() %>" >
					</div>
					
					<div class="form-group">
					  <label>객실 사진</label>
					  <input type="file"  name="roomImg" oninput="testVal(this, roomImg);" >
					  <img width="100px" height="100px" src="<%= room.getRoomImgPath() %>" >
					  <input type="hidden" name="roomImgBefore" value="<%= room.getRoomImgPath() %>">
					  <input type="hidden" name="roomImgNo" value="<%= room.getRoomImgNo() %>">
					</div>
					
					<div class="form-grop">
						<label>입실시간</label>
						<input type="time" name="in_time" required value="<%= room.getCheckInTime() %>"><br>				
						<label>퇴실시간</label>
						<input type="time" name="out_time" required value="<%= room.getCheckOutTime() %>">
					</div>
					
					<div class="form-group">
					  <label>객실 가격</label>
					  <input type="text"  name="roomPrice" maxlength="9" required oninput="testVal(this, roomPrice);" value="<%= room.getRoomPrice() %>">
					</div>
					
					<div class="form-group">
					  <label>객실 번호</label>
					  <input type="text"  name="roomNum" maxlength="9" required oninput="testVal(this, roomNum);" value="<%= room.getRoomNum() %>">
					</div>
				</div>
				</section>
				<div id="btn-div" align="center">
					<button type="submit" class="btn btn btn-info">객실 수정</button>
				</div>
			</form>
		</div>
	</div>
	<script>
	const regRoomName = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\s]+$/;
	const regNum = /^[1-9]+$/;
	
	function testVal(e, tag) {
		if($(e).val() == " "){
			alert('입력은 공백으로 시작할수 없습니다.');
			$(e).val('');
			return;
		}
		
		if(tag.name === 'roomName'){
			if(!regRoomNameW.test($(e).val())){
				alert('입력할수 없는 문자입니다.');
				$(e).val('');
				return;
			}	
		}
		else if(tag.name === 'maxPeople' ||
				tag.name === 'roomPrice' ||
				tag.name === 'roomNum') {
					if($(e).val() == " "){
						return;
					}
					if(!regNum.test($(e).val())){
						alert('공백과 문자가 없는 숫자만 입력해주세요.');
						$(e).val('');
						return;
					}
		}
		else if(tag.name === 'roomImg'){
			if($(e).val().substring($(e).val().lastIndexOf(".")) !== ".jpg" &&
			   $(e).val().substring($(e).val().lastIndexOf(".")) !== ".png" &&
			   $(e).val().substring($(e).val().lastIndexOf(".")) !== ".jpeg"
			) {
				alert('.jpg, .png, .jpeg 형식의 사진 파일만 가능합니다.');
				$(e).val('');
				return;
			}
		}
	}
	</script>
</body>
</html>