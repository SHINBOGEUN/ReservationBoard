<%@page import="javax.security.auth.Subject"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>success</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>	
	
	<section>
	<%
		request.setCharacterEncoding("UTF-8");
		String empno = request.getParameter("empno");
	%>
		<h2>사원 번호 : <%=empno %>님의 좌석예약 조회</h2>
		<form style ="display: flex; justify-content: center; align-items: center;">
			<table border="1">
				<tr>
					<td>사원번호</td>
					<td>이름</td>
					<td>근무일자</td>
					<td>좌석번호</td>
					<td>좌석위치</td>
					<td>내선번호</td>
				</tr>
				
	<%
		try{
			Connection conn= Util.getConnection();
			String sql = "SELECT re.empno, empname, resvdate, re.seatno, office, callno " + 
			"FROM tbl_emp_202108 em, tbl_seat_202108 se, tbl_resv_202108 re " +
			"WHERE em.empno=re.empno AND se.seatno=re.seatno AND re.empno=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empno); 
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()){
				String resvdate = rs.getString(3);
				String date = resvdate.substring(0,4) + "년" +
				resvdate.substring(4,6) + "월" + resvdate.substring(6,8)+ "일";
				%>
				
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=date %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %></td>
					</tr>
		<%
			}
		
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
			</table>
			
		</form>
		<div style= "text-align: center;">
			<input type = button value = "돌아가기" onclick="window.location = 'list.jsp'">
		</div>
		
		
	</section>
	
		<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>





