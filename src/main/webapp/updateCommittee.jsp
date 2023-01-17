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
      <meta charset="ISO-8859-1">
      <title>MAKLUMAT DIRI</title>
      <link rel="stylesheet" href="styles.css">
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
            
            <button class="navi" href="#" onclick="document.location='committeeAccount.jsp'">AKAUN</button>
            <button class="navi" href="#" onclick="document.location='applicationType.jsp'">PERMOHONAN</button>
            <button class="navi" href="#" onclick="document.location='donationList.jsp' ">BANTUAN</button>
        </div>
</nav>
   	  <form class=committee name="myForm" action="CommitteeHandler" method="post" onsubmit ="return matchPassword()">
   	  <input type="hidden" name="committeeID" class="forInput"  value='<%=rs.getString("committeeID")%>'>
      <fieldset class="fieldset">
         <legend class="legend">KEMASKINI MAKLUMAT DIRI</legend>
         <div class='center'>
               <br>
               
				<label id="labelid" for="name">Nombor Kad Pengenalan: <%=rs.getString("committeeID") %> </label> 
				
				<label id="labelid" for="name">Nama penuh: </label>
				<input type="text" class="forInput" name="committeeName" value='<%=rs.getString("committeeName") %>'>
				<br><br>
				<label id="labelid" for="phoneno">Nombor Telefon: </label>
				<input type="tel" pattern=[0-9]{10} name="committeePhoneNumber" class="forInput" id="phoneno" value='<%=rs.getString("committeePhoneNumber") %>'>
				<br><br>
				<label id="labelid" for="email">Alamat Email: </label>
				<input type="email" name="committeeEmail" class="forInput" id="email" value='<%=rs.getString("committeeEmail") %>'>
				<br><br>
				<label id="labelid" for="address">Alamat Rumah: </label>
				<input type="text" name="committeeAddress" class="forInput" id="address" value='<%=rs.getString("committeeAddress") %>'>
				<br><br>
				<label id="labelid" for="city">Bandar: </label>
				<input type="text" name="committeeCity" class="forInput" id="city" value='<%=rs.getString("committeeCity") %>'>
				<br><br>
				<label id="labelid" for="postcode">Poskod: </label>
				<input type="number" name="committeePostcode" class="forInput" id="postcode" value='<%=rs.getString("committeePostcode") %>'>
				<br><br>
				<label id="labelid" for="state">Negeri: </label>
				<input type="text" name="committeeState" class="forInput" id="state" value='<%=rs.getString("committeeState") %>'>
				
         </div>
            <%} %>
         <button class="button1" onclick="document.location='committeeAccount.jsp'">KEMBALI</button>
         <input type="hidden" name="action" value="updateCommittee">
         <button type="submit" class="button2" name="submit" formaction="CommitteeHandler" onclick="return confirm('Anda pasti untuk mengemaskini akaun?');">KEMASKINI</button><br><br>
      </fieldset>
      </form>
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
      #labelid {
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
   </style>
</html>