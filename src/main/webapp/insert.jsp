<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<script type="text/javascript" src ="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h2>근무좌석예약</h2>
		<form name="frm" action="i_action.jsp" method = "post" style ="display: flex; justify-content: center; align-items: center;">
			<table border ="1">
				<tr> 
					<td>예약 번호</td>
					<td><input type = text name = "resvno"> 예) 20210001</td>
				</tr>
				<tr> 
					<td>사원 번호</td>
					<td><input type = text name = "empno"> 예) 1001</td>
				</tr>
				<tr> 
					<td>근무 일자</td>
					<td><input type = text name = "resvdate"> 예) 20211231</td>
				</tr>
				<tr> 
					<td>좌석 번호</td>
					<td><input type = text name = "seatno"> 예) S001~S009</td>
				</tr>
				<tr style= "text-align:center;">
					<td colspan=2>
						<input type = "button" onclick ="addCheck();"value="등록"> &nbsp;
						<input type = "button" onclick ="res();"value="다시쓰기">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>