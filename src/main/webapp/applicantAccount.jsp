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
  <title>Applicant Account</title>
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
    <button class="navi" href="#"><i>AKAUN</i></button>
    <button class="navi" href="#" onclick="document.location='applicantApplicationList.jsp'">PERMOHONAN</button>
    <button class="navi" href="#" onclick="document.location='donationType.jsp' ">BANTUAN</button>
    <button class="navi" href="#" ><ion-icon name="notifications-outline"></ion-icon></button>   
  </div>
</nav>
<br>

<fieldset class="fieldset">
  <legend class="legend">MAKLUMAT DIRI</legend>
  <form class="applicant" name="myForm" action="" method="post">

    <div class='center'>
<%
Class.forName("org.postgresql.Driver");
String DB_CONNECTION = "jdbc:postgresql://ec2-3-228-235-79.compute-1.amazonaws.com/ddrev47ip327l0";
String DB_USER = "hlcietwdsgkwyq";
String DB_PASSWORD = "f6078446e3932c85a4d99b3753e1b04295a6add4a27ee4fdc3649c1efb1a04f1";

String applicantID=(String)session.getAttribute("applicantID");
String sql= "select a.applicantid, a.applicantname, a.applicantphonenumber, a.applicantemail, a.applicantaddress, a.applicantcity, a.applicantpostcode, a.applicantstate, a.applicantemploymenttype, a.applicantpassword, s.studentlevel, s.studentinstitution, e.employeeoccupation, e.employeesalary  from applicant a left outer join student s on(a.applicantid=s.applicantid) left outer join employee e on(a.applicantid=e.applicantid) where a.applicantid='"+applicantID+"';";
Connection con=DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
%>
      <input type="hidden" name="id" value='<%=rs.getString("applicantID") %>'/>

      No Kad Pengenalan: <%=rs.getString("applicantID") %>
      <br><br>

      Nama penuh: <%=rs.getString("applicantName") %>
      <br><br>

      Nombor Telefon: <%=rs.getString("applicantPhoneNumber") %>
      <br><br>

      Alamat Email: <%=rs.getString("applicantEmail") %>
      <br><br>

      Alamat Rumah: <%=rs.getString("applicantAddress") %>
      <br><br>

      Bandar: <%=rs.getString("applicantCity") %>
      <br><br>

      Poskod: <%=rs.getString("applicantPostcode") %>
      <br><br>

      Negeri: <%=rs.getString("applicantState") %>
      <br><br>

      Jenis Pemohon: <%=rs.getString("applicantEmploymentType") %>
      <br><br>
      
      <%if(rs.getString("studentLevel")==null) {%>
       Peringkat Pengajian: Tiada Info
      <br><br>   	  
      <%}else {%>
       Peringkat Pengajian: <%=rs.getString("studentLevel") %>
      <br><br>   	  
      <%}%>
      
      <%if(rs.getString("studentInstitution")==null) {%>
       Institusi: Tiada Info
      <br><br>   	  
      <%}else {%>
       Institusi: <%=rs.getString("studentInstitution") %>
      <br><br>   	  
      <%}%>

      <%if(rs.getString("employeeOccupation")==null) {%>
       Pekerjaan: Tiada Info
      <br><br>   	  
      <%}else {%>
       Pekerjaan: <%=rs.getString("employeeOccupation") %>
      <br><br>   	  
      <%}%>
      
      <%if(rs.getString("employeeSalary")==null) {%>
       Gaji: Tiada Info
      <br><br>   	  
      <%}else {%>
       Gaji: <%=rs.getString("employeeSalary") %>
      <br><br>   	  
      <%}%>
   
      <%} %>
    </div>
    <input type="hidden" name="action" value="updateApplicant">
    <button type="submit" class="button1" name="submit" formaction="updateApplicant.jsp?id=${result.applicantID}">KEMASKINI</button><br><br>
    <input type="hidden" name="action" value="deleteApplicant">
    <button type="submit" class="button2" name="submit" formaction="deleteApplicant.jsp?id=${result.applicantID}">PADAM</button><br><br>
  </form>
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