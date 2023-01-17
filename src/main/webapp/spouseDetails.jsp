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
  <title>Maklumat Pasangan</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
</head>
<body>
<nav>
  <div class = "logo">
    <img src = "Image/Logo.png" alt = "logo">
    <span class="add">Masjid Sultan Azlan Shah, Jalan Raja Musa Mahadi, Institut Tadbiran Islam Perak, 31400 Ipoh, Perak, Malaysia 05-5456779</span>

    <form class="bar" method="get" action="ApplicantHandler">
      <input type="hidden" name="action" value="logoutApplicant">
      <button class="navi" href="#" onclick="return confirm('Anda pasti untuk log keluar?');">LOG KELUAR</button>
    </form>
    <button class="navi" href="#" onclick="document.location='applicantAccount.jsp'"><i>AKAUN</i></button>
    <button class="navi" href="#" onclick="document.location='applicantApplicationList.jsp'">PERMOHONAN</button>
    <button class="navi" href="#" onclick="document.location='donationType.jsp' ">BANTUAN</button>
    <button class="navi" href="#" ><ion-icon name="notifications-outline"></ion-icon></button>   
  </div>
</nav>
<br>

<fieldset class="fieldset">
  <legend class="legend">Maklumat Pasangan</legend>
  <form class="applicant" name="myForm" action="" method="post">

    <div class='center'>
<%
Class.forName("org.postgresql.Driver");
String DB_CONNECTION = "jdbc:postgresql://localhost:5432/udonation";
String DB_USER = "postgres";
String DB_PASSWORD = "syauqi2826";

String applicantID=(String)session.getAttribute("applicantID");
String sql= "select spouseid,spousename, spousephonenumber, spouseoccupation,spousesalary, applicantID from spouse where applicantid='"+applicantID+"';";
Connection con=DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
%>
      <input type="hidden" name="id" value='<%=rs.getString("applicantID") %>'/>

      <%if(rs.getString("spouseID").equalsIgnoreCase(" ")) {%>
      No Kad Pengenalan: Tiada Info
      <br><br>   	  
      <%}else {%>
      No Kad Pengenalan: <%=rs.getString("spouseID") %>
       <br><br> 	  
      <%}%>
      
      <%if(rs.getString("spouseName").equalsIgnoreCase(" ")) {%>
      Nama penuh: Tiada Info
      <br><br>   	  
      <%}else {%>
      Nama penuh: <%=rs.getString("spouseName") %>
      <br><br>	  
      <%}%>
      
      <%if(rs.getString("spousePhoneNumber").equalsIgnoreCase(" ")) {%>
      Nombor Telefon: Tiada Info
      <br><br>   	  
      <%}else {%>
      Nombor Telefon: <%=rs.getString("spousePhoneNumber") %>
      <br><br>	  
      <%}%>
      
      <%if(rs.getString("spouseOccupation").equalsIgnoreCase(" ")) {%>
      Pekerjaan: Tiada Info
      <br><br>   	  
      <%}else {%>
      Pekerjaan: <%=rs.getString("spouseOccupation") %>
      <br><br>	  
      <%}%>
      
      <%if(rs.getDouble("spouseSalary")==0) {%>
      Gaji Bulanan: Tiada Info
      <br><br>   	  
      <%}else {%>
      Gaji Bulanan: <%=rs.getString("spouseSalary") %>
      <br><br>  
      <%}%>
         
      <%} %>
    </div>  
    
         
         <input type="hidden" name="action" value="updateSpouse">
         <br><br><br>
  </form>
  <button class="button1" onclick="document.location='applicantAccount.jsp'" onclick="return confirm('Anda pasti untuk membatalkan kemaskini akaun?');">KEMBALI</button><br><br>
</fieldset>
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
    margin-left: 65%;
  }
  
  .button1:hover {
    background-color: #617C8D;}

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
    height: 60%;
    padding: 30px 20px;
    background-color: white;
    border-radius: 5px 5px 5px 5px;
    min-height:300px;
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

</style>
</html>