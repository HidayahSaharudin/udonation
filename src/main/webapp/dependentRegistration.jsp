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
  }

  .button1:hover
  {
    background-color: #617C8D;
  }

  .button2{
    background-color: #66c2ff;
    height: 40px;
    width: 27%;
    padding: 15px 32px;
    border-style: groove;
    cursor: pointer;
    padding: 10px;
    display: inline;
    position: absolute;
    margin-left: 65%;
  }
  .button2:hover {
    background-color: #617C8D;}

  label {
    margin-bottom: 2px;
    display: block;}

  .forInput{
    width: 100%;
    margin-bottom: 25px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;}

  input[type=text],[type=password]{
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;}

  .center{
    float: center;
    width: 90%;
    height: 100%;
    padding: 30px 20px;
    background-color: white;
    border-radius: 5px 5px 5px 5px;
    min-height:500px;
    margin-left: 50px;
    margin-right: 50px;
    margin-top:50px;
    background :#FFFFFF;
    position :relative;
    text-align: justify;
    margin-bottom: 50px;}

  form
  {
    padding-left: 20px;
    padding-right: 20px;
    font-family: "Poppins", sans-serif;
  }

  .fieldset
  {
    float: center;
    margin-top: 10px;
    padding: 10px;
    background-color: #b3e6ff;
  }
  .legend
  {
    font-weight: bold;
    font-size: 30px;
    font-family: Arial, Helvetica, sans-serif;
    color: #000000;
    margin-left: auto;
    margin-right:auto;
  }

  table, th, td
  {
    border: 1px solid black;
    border-collapse: collapse;
  }

  .tambah, .buang
  {
    background-color: #66c2ff;
    height: 20px;
    border-style: groove;
    border-radius: 3px;
    border-color: #66c2ff;
  }

  .buang
  {
    margin-left: 15px;
  }

  .tambah:hover, .buang:hover
  {
    background-color: #617C8D;
  }
</style>
<script type="text/javascript">

  function matchPassword()
  {
    var pw1 = document.getElementById("applicantPassword");
    var pw2 = document.getElementById("password");
    if(pw1 != pw2)
    {
      alert("Kata Laluan Tidak Sama");
    }
  }
</script>
</html>