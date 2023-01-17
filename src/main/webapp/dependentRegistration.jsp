<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Maklumat Tanggungan</title>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js">
  </script>
</head>
<body>
<%String applicantID = request.getParameter("applicantID"); %>	
<div class="content" >
	<br>
	<h2 class="title">Maklumat Tanggungan</h2>
	<div style="overflow-x:auto;">
<a class="add" href=dependentForm.jsp?applicantID=<%=applicantID %>>Tambah Tanggungan</a>
		<table style="text-align: center;" id="donationList">
			<tr>
			    <th onclick="sortTable(1)" style="width: 150px; ">ID TANGGUNGAN</th>
				<th onclick="sortTable(0)" style="width: 400px; height: 50px;">NAMA TANGGUNGAN</th>
				<th onclick="sortTable(2)" style="width: 200px;">HUBUNGAN TANGGUNGAN</th>
				<th onclick="sortTable(2)" style="width: 150px;">TINDAKAN</th>
			</tr>
<%
Class.forName("org.postgresql.Driver");
String DB_CONNECTION = "jdbc:postgresql://localhost:5432/udonation";
String DB_USER = "postgres";
String DB_PASSWORD = "syauqi2826";

String sql= " select dependentID, dependentName, dependentRelationship, applicantID from dependent where applicantid='"+applicantID+"';";
Connection con=DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
%>				
<form class="applicant" name="myForm"  method="post" >
				<tr>
					<td class="dependentID">
						<%=rs.getString("dependentID") %>
					</td>
					<td class="dependentName">
						<%=rs.getString("dependentName") %>
					</td>
					<td class="dependentRelationship">
						<%=rs.getString("dependentRelationship") %>
					</td>
					<td>
						<form method="post">
							<input type="hidden" name="dependentID" value="<%=rs.getString("dependentID") %>">
							<input type="hidden" name="applicantID" value="<%=rs.getString("applicantID") %>">
							<input type="hidden" name="action" value="deleteDependent">
							<button  class="action"  type="delete" formaction="ApplicantHandler" onclick="return confirm('Anda pasti untuk membuang Tangunggan ini?');">PADAM</button>
						</form>
					</td>
				</tr>
		<%} %>				
		</table>
    
  <button class="button1" onclick="document.location='spouseRegistration.jsp'">KEMBALI</button>
  <br><br>
  <input type="hidden" name="action" value="createSpouse">
  <button type="submit" class="button2" name="submit" onclick="document.location='applicantLogin.jsp'">DAFTAR</button><br><br>

</form>
	</div>
	<br><br><br>
</div>
</body>
<style>
    body{
    background-color: #E7E9EC;
    background-color: #e6f7ff;
    font: 1em Helvetica;}

    /*css for navigation bar*/
  .add {
    position: absolute;
    left: 90px;
    width: 270px;
    border: none;
    padding: 20px 16px;;
    font-size: 14px;
    color: #455a64;
    font-family: "Bahnschrift", "Courier New", monospace;
}

  nav {
    background-color: #b3e6ff;
  }

  nav a.navi:hover{
    margin-top: 10px;
    color: #BBE9FE;}
  .logo{
    flex: 1;}
  .logo button {
    display: flex;
    align-items: center;
    font-size: 20px;
  }
  .logo img{
    width: 100px;
    height: 100px;
    margin-right: 10px;
  }
  button {
    float: right;}

  .navi {
    display: block;
    color: #455a64;
    font-weight: bold;
    text-align: center;
    padding: 30px 16px;
    text-decoration: none;
    margin-top: 10px;
    margin-right: 10px;
    border: none;
    background-color: #b3e6ff;
  }

  .bar {
    display: inline;
  }

  button.navi:hover {
    background-color: #617C8D;
    height: 5px;
  }

  span{
    color: red;}

  .button1{
    background-color: #66c2ff;
    height: 40px;
    width: 27%;
    padding: 15px 32px;
    border-style: groove;
    cursor: pointer;
    padding: 10px;
    display: inline;
    position: absolute;
    margin-left: 64%;
    margin-top: 5%;
}

.button1:hover {
    background-color: #617C8D;}

.button2{
    background-color: #66c2ff;
    height: 40px;
    width: 27%;
    border-style: groove;
    cursor: pointer;
    padding: 10px;
    position: absolute;
    margin-left: 64%;
    margin-top: 5%;
  }
  .button2:hover {
    background-color: #617C8D;}

.tambah {
    background-color: #b3e6ff;
    color: black;
    font-size: 15px;
    width: 130px;
    padding: 10px;
    margin: 10px 0;
    border: 2px solid black;
    cursor: pointer;
    border-radius: 25px;
    position: absolute;
    top: 150px;
    right: 60px;
}

.action {
		background-color: #b3e6ff;
		font-size: 10px;
		height: 35px;
		width: 100px;
		padding: 10px;
		margin: 10px 0;
		cursor: pointer;
		border-radius: 25px;
	}

table, th, td {
		border: 1px solid;
		border-collapse: collapse;
		text-align: left;
		margin-top: 50px;
		margin-left: auto;
  		margin-right: auto;
	}
	
td {
    padding-left: 10px;
    font-family: "Bahnschrift Light", "Courier New", monospace;
}

th {
    text-align: center;
        font-family: "Bahnschrift SemiBold", "Courier New", monospace;
}

#donationList tr:nth-child(even) {
    background-color: #a7a7a7;
}

#donationList tr:nth-child(odd) {
    background-color: #dfdddd;
}

#donationList th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #b3e6ff;
    color: black;
}
</style>