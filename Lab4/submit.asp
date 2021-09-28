<%@ Language="VBScript" %>
<!DOCTYPE html>
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<head>
		<title>Your result</title>
		<style>
			*{
				padding:0;
				margin:0;
			}
			body{
				background-color:#EDF1EC;
			}
			#title{
				padding:1em;
				font-size:1.3em;
				width:100%;
				text-align:center;
				color:#1aa260;
				font-weight:bold;
			}
			table{
				width:80%;
				table-layout:center;
				margin:auto;
				border:0.15em solid #1aa260;
				border-radius:1em;
				text-align:center;
				font-size:1.2em;
				font-family:"ink free";
			}
			th{
				border-bottom:0.15em solid #1aa260;
			}
			th,td{
				padding:0.25em;
			}
		</style>
	</head>
	<body>
	 	<%
		set conn=Server.CreateObject("ADODB.Connection")
		conn.Provider="Microsoft.Jet.OLEDB.4.0"
		conn.Open(Server.Mappath("score.mdb"))
		sql="INSERT INTO score (s_name,s_score) VALUES"   
		sql=sql & " ('" &Request.Form("userName") & "',"
		sql=sql & Request.Form("userMark") & ")"
		on error resume next
		conn.Execute sql,recaffected
		conn.close
		%>
		<%
		set conn=Server.CreateObject("ADODB.Connection")
		conn.Provider="Microsoft.Jet.OLEDB.4.0"
		conn.Open(Server.Mappath("score.mdb"))
		set rs = Server.CreateObject("ADODB.recordset")
		sql="SELECT s_name,s_score FROM score ORDER BY s_score DESC"
		rs.Open sql, conn
		%>
		<p id="title">History result<br/>Grades are sorted in reverse order</p>
		<table>
			<tr>
				<%for each x in rs.Fields
    				response.write("<th>" & x.name & "</th>")
				next%>
			</tr>
			
			<tr><td>AA</td><td>100</td></tr>
			<tr><td>SeeChen</td><td>100</td></tr>
			<tr><td>LSC</td><td>98</td></tr>
			<tr><td>SEECHEN</td><td>96</td></tr>
			<tr><td>SC Lee</td><td>90</td></tr>
			<tr><td>SC_Lee</td><td>80</td></tr>
			<tr><td>yoyoyo</td><td>60</td></tr>
			<tr><td>嘿嘿嘿</td><td>20</td></tr>
			<tr><td>SeeChen</td><td>0</td></tr>
			
			<%do until rs.EOF%>
    		<tr>
    		<%for each x in rs.Fields%>
       			<td><%Response.Write(x.value)%></td>
    		<%next
    		rs.MoveNext%>
    		</tr>
			<%loop
			rs.close
			%>
	</body>
</html>