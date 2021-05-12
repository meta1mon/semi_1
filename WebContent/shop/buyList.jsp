<%@page import="java.text.NumberFormat"%>
<%@page import="bookshop.DAO.BuyDAO"%>
<%@page import="bookshop.VO.BuyVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member vo = (Member) request.getSession().getAttribute("loginMember");
String id = vo.getId();
%>

<html>
<head>
<meta charset="UTF-8">
<title>구매완료페이지</title>
</head>
<body>
	<%
		List<BuyVO> buyLists = null;
			BuyVO buyList = null;
			int count = 0;
			int number = 0;
			int number2 = 0;
			int total = 0;

			if (session.getAttribute("loginMember") == null) {
		response.sendRedirect("#");
			} else {
		BuyDAO buyProcess = BuyDAO.getinstance();
		count = buyProcess.getListCount(id);

		if (count == 0) {
	%>
	<h3>구매목록</h3>
	<table>
		<tr>
			<td>구매 목록이 없습니다.</td>
		</tr>
	</table>
	<input type="button" onclick="javascript:window.location='#'">
	<%
		} else {
		buyLists = buyProcess.getBuyList_id(id);
	%>
	<h4>
		<b>결제가 완료되었습니다 ♥</b>
	</h4>
	<h3>
		<b>구매목록</b>
	</h3>
		<table border="1">
		<p>책 구매목록</p>
					<tr>
						<td width="150">번호</td>
						<td width="300">책 이름</td>
						<td width="100">판매가격</td>
						<td width="50">수량</td>
						<td width="150">금액</td>
					</tr>
			<td>
				<%
					for (int i = 0; i < buyLists.size(); i++) {
							buyList = buyLists.get(i);

				%>
				
					<tr>
						<td align="center" width="150"><%=++number%></td>
					</tr>
					<tr>
						<td width="300" align="left"><img
							src="../imageFile/<%=buyList.getBimage()%>" width="30"
							height="50" align="middle"> <%=buyList.getBtitle()%></td>
						<td width="300" align="left">
						<td width="100">\<%=NumberFormat.getInstance().format(buyList.getBprice())%>
						</td>
						<td width="50"><%=buyList.getBuycount()%></td>
						<td width="150">
							<%
								total += buyList.getBuycount() * buyList.getBuyprice();
							%> \ <%=NumberFormat.getInstance().format(buyList.getBuycount() * buyList.getBprice())%>
						</td>
					</tr>
					
					<%
					}
					%>
				</table>
					<table border="1">
		<p>영상 구매목록</p>
					<tr>
						<td width="150">번호</td>
						<td width="300">책 이름</td>
						<td width="100">판매가격</td>
						<td width="50">수량</td>
						<td width="150">금액</td>
					</tr>
			<td>
				<%
					for (int i = 0; i < buyLists.size(); i++) {
							buyList = buyLists.get(i);

				%>
				
					<tr>
						<td align="center" width="150"><%=++number2%></td>
					</tr>
					<tr>
						<td width="300" align="left"><img
							src="../imageFile/<%=buyList.getVimage()%>" width="30"
							height="50" align="middle"> <%=buyList.getVtitle()%></td>
						<td width="300" align="left">
						<td width="100">\<%=NumberFormat.getInstance().format(buyList.getVprice())%>
						</td>
						<td width="50">1</td>
						<td width="150">
							<%
								total += 1 * buyList.getBuyprice();
							%> \ <%=NumberFormat.getInstance().format(buyList.getVprice())%>
						</td>
					</tr>
					
					<%
					}
					%>
				</table>
					<tr>
						<td colspan="5" align="right"><b>총 금액: \ <%=buyList.getBuyprice()%></b>
						</td>
					</tr>
					
			</td>
		</tr>
	</table>
	<br>
	<%
		}
	}
	%>
	<input type="button" value="메인으로" onclick="javascript:window.location"='#'">
	

<%@include file="../view/footer.jsp" %></section>
</html>