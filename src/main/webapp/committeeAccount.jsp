<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>MAKLUMAT DIRI</title>
</head>
<body>
<%
Class.forName("org.postgresql.Driver");
String DB_CONNECTION = "jdbc:postgresql://localhost:5432/udonation";
String DB_USER = "postgres";
String DB_PASSWORD = "syauqi2826";

String committeeID=(String)session.getAttribute("committeeID");
String sql= "select * from committee where committeeID='"+ committeeID +"'";
Connection con=DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
%>
<nav>
  <div class = "logo">
    <img src = "Image/Logo.png" alt = "logo">
    <span class="add">Masjid Sultan Azlan Shah, Jalan Raja Musa Mahadi, Institut Tadbiran Islam Perak, 31400 Ipoh, Perak, Malaysia 05-5456779</span>

    <form class="bar" method="get" action="CommitteeHandler">
      <input type="hidden" name="action" value="logoutCommittee">
      <button class="navi" href="#" onclick="return confirm('Anda pasti untuk log keluar?');">LOG KELUAR</button>
    </form>

    <button class="navi" href="#"><i>AKAUN</i></button>
    <button class="navi" href="#" onclick="document.location='applicationType.jsp'">PERMOHONAN</button>
    <button class="navi" href="#" onclick="document.location='donationList.jsp' ">BANTUAN</button>
  </div>
</nav>
<br>
<form method="post">
  <input type="hidden" name="action" value="updateCommittee">
  <button class="butangg" class="action"  formaction="updateCommittee.jsp?id=${result.committeeID}">KEMASKINI</button>
</form>
<fieldset class="fieldset">
  <legend class="legend">MAKLUMAT DIRI</legend>
  <form id="maklumat" action="" method="post">
    <div id="form">

      <input type="hidden" name="id" value='<%=rs.getString("committeeID") %>'/>

      No Kad Pengenalan: <%=rs.getString("CommitteeID") %>
      <br><br>

      Nama Penuh: <%=rs.getString("CommitteeName") %>
      <br><br>

      Nombor Telefon: <%=rs.getString("CommitteePhoneNumber") %>
      <br><br>

      Email: <%=rs.getString("CommitteeEmail") %>
      <br><br>

      Alamat: <%=rs.getString("CommitteeAddress") %>
      <br><br>

      Bandar: <%=rs.getString("CommitteeCity") %>
      <br><br>

      Poskod: <%=rs.getInt("CommitteePostcode") %>
      <br><br>

      Negeri: <%=rs.getString("CommitteeState") %>
      <br><br>
      <%} %>
    </div>
  </form>
</fieldset>
</body>
<style>
  body
  {
    font-family: "Lucida Console", "Courier New", monospace;
    color: black;
    background-color: #e6f7ff;
  }
  *
  {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  /*css for navigation bar*/
  .add {
    position: absolute;
    left: 90px;
    width: 270px;
    border: none;
    padding: 20px 16px;;
    font-size: 14px;
    color: #455a64;
    font-family: "Bahnschrift", "Courier New", monospace;}

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

  /*css for navigation bar*/

  div.a
  {
    position: relative;
    display: block;
  }
  h1
  {
    padding-left: 100px ;
  }
  form
  {
    padding-left: 70px;
    font-family: "Poppins", sans-serif;
  }
  .button
  {
    background-color: #66c2ff;
    height: 50px;
    width: 150px;
    padding: 15px 32px;
    margin: 10px 0;
    border-style: groove;
    cursor: pointer;
    border-radius: 25px;
    padding: 10px;
    display: inline;
    margin-left: auto;
    margin-right:auto;
    position: absolute;
    bottom: 6px;
    left: 16px;
  }
  .butang
  {
    background-color: #66c2ff;
    height: 40px;
    width: 130px;
    border-style: groove;
    cursor: pointer;
    border-radius: 25px;
    padding: 5px;
    position: absolute;
    bottom: 380px;
    right: 16px;
    margin-left: 1150px;
  }
  .butangg
  {
    background-color: #66c2ff;
    height: 40px;
    width: 130px;
    text-align: center;
    border-style: groove;
    cursor: pointer;
    padding: 10px;
    position: absolute;
    bottom: 430px;
    right: 16px;
    margin-left: 1150px;
    border-color: black;
    color: black;
  }
  .button:hover
  {
    background-color: #617C8D;
  }
  .butang:hover
  {
    background-color: #617C8D;
  }
  .butangg:hover
  {
    background-color: #617C8D;
  }
  .page
  {
    image-rendering: background;
  }
  .fieldset
  {
    margin-right: 200px;
    margin-left: 200px;
    margin-top: 10px;
    padding: 40px;
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
</style>
</html>