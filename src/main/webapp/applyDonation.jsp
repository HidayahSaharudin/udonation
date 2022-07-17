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
<meta charset="UTF-8">
<title>Declaration Page</title>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
</head>
<body>
   <%
   Class.forName("org.postgresql.Driver");
   String DB_CONNECTION = "jdbc:postgresql://ec2-3-228-235-79.compute-1.amazonaws.com/ddrev47ip327l0";
   String DB_USER = "hlcietwdsgkwyq";
   String DB_PASSWORD = "f6078446e3932c85a4d99b3753e1b04295a6add4a27ee4fdc3649c1efb1a04f1";
	
	String applicantID=(String)session.getAttribute("applicantID"); 
	int donationID = Integer.parseInt(request.getParameter("donationID"));
    String sql= "select applicantID from applicant where applicantID='"+ applicantID +"'";
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

    <form class="bar" method="get" action="ApplicationHandler">
      <button class="navi" href="#" onclick="return confirm('Anda pasti untuk log keluar?');">LOG KELUAR</button>
    </form>
    <button class="navi" href="#"><i>AKAUN</i></button>
    <button class="navi" href="#" onclick="document.location='application.jsp'">PERMOHONAN</button>
    <button class="navi" href="#" onclick="document.location='donationType.jsp' ">BANTUAN</button>
    <button class="navi" href="#" ><ion-icon name="notifications-outline"></ion-icon></button>  
  </div>

	<fieldset class="fieldset">
	<legend class="legend">BORANG DEKLARASI</legend>
	
	<form method="post" action="ApplicationHandler" onclick="return checkForm(this);">
	  <input type="hidden" name="applicantID" class="forInput"  value='<%=rs.getString("applicantID")%>'>
	  <input type="hidden" name="donationID" class="forInput"  value="<%=donationID%>"/>
	  <input type="checkbox" id="verify" name="verify" value="verified" required>
	  <label for="verify">Saya memahami bahawa keputusan permohonan yang dikeluarkan kelak 
	  adalah muktamad dan tertakluk kepada pihak masjid. </label><br><br><br><br><br><br>
	
	<input class="button1" type="button" value="KEMBALI" onclick="document.location=('donationType.jsp')">
	<input type="hidden" name="action" value="createApplication">
	<button class="button2"  type="submit" class="button2" name="submit">HANTAR</button>   

	</form>
	</fieldset>
</nav>
<%} %>
</body>
<script>

function checkForm(form)
{
  if(!form.verify.checked) {
    alert("Sila nyatakan bahawa anda bersetuju menerima segala keputusan yang akan dibuat. ");
    form.verify.focus();
    return false;}
  else{
	  alert("Perhatian! Permohonan ini tidak boleh dikemaskini dan padam setelah dihantar. Adakah anda pasti untuk meneruskan permohonan ini ?");
	  return true;}
}
</script>
<style>
	
    body
    {
    	background-color: #e6f7ff;
    	font: 1em Helvetica;
        font-family: "Bahnschrift", "Courier New", monospace;
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

		.button1{
		background-color: #b3e6ff;
		height: 50px;
		width: 100px;
		padding: 15px 32px;
		margin: 10px 0;
		border-bottom-style: groove;
		cursor: pointer;
		border-radius: 25px;
		padding: 10px;
		display: inline;
		margin-left: auto;
		margin-right:auto;
		position: absolute;
		bottom: 8px;
		left: 16px;}
		
		.button2{
		background-color: #b3e6ff;
		height: 50px;
		width: 100px;
		padding: 15px 32px;
		margin: 10px 0;
		border-bottom-style: groove;
		cursor: pointer;
		border-radius: 25px;
		padding: 10px;
		display: inline;
		margin-left: auto;
		margin-right:auto;
		position: absolute;
		bottom: 8px;
		right: 16px;}
        
        button:hover {
          opacity:1;
        }
        
        .button1:hover 
    	{
        	background-color: #617C8D;
        	
    	}
    	
    	.button2:hover 
    	{
        	background-color: #617C8D;
        	
    	}
        
        .fieldset {
		margin-top: 30px;
		background-color: #b3e6ff;
		margin-right:2%;	
		margin-left:2%;
		height: 300px;
		padding: 40px;	
		font-size: 20px;
		}
		
		.legend {
		font-weight: bold;
		font-size: 30px;
		font-family: Arial, Helvetica, sans-serif;
		color: #000000;
		margin-left: auto;
		margin-right:auto;
		}	
</style>
</html>