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
            
            <button class="navi" href="#" onclick="document.location='applicantAccount.jsp'">AKAUN</button>
            <button class="navi" href="#" onclick="document.location='applicantApplicationList.jsp'">PERMOHONAN</button>
            <button class="navi" href="#" onclick="document.location='donationType.jsp' ">BANTUAN</button>
            <button class="navi" href="#" ><ion-icon name="notifications-outline"></ion-icon></button> 
        </div>
</nav>
   	  <form class=applicant name="myForm" action="ApplicantHandler" method="post" onsubmit ="return matchPassword()">
   <%
    Class.forName("org.postgresql.Driver");
   String DB_CONNECTION = "jdbc:postgresql://localhost:5432/udonation";
   String DB_USER = "postgres";
   String DB_PASSWORD = "syauqi2826";
	
	String applicantID=(String)session.getAttribute("applicantID"); 
	String sql= "select a.applicantid, a.applicantname, a.applicantphonenumber, a.applicantemail, a.applicantaddress, a.applicantcity, a.applicantpostcode, a.applicantstate, a.applicantemploymenttype, a.applicantpassword, s.studentlevel, s.studentinstitution, e.employeeoccupation, e.employeesalary  from applicant a left outer join student s on(a.applicantid=s.applicantid) left outer join employee e on(a.applicantid=e.applicantid) where a.applicantid='"+applicantID+"';";
    Connection con=DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
   %> 
      <input type="hidden" name="applicantID" class="forInput"  value='<%=rs.getString("applicantID")%>'>
      <fieldset class="fieldset">
         <legend class="legend">KEMASKINI MAKLUMAT DIRI</legend>
         <div class='center'>
               <br>
               
				<label id="labelid" for="name">Nombor Kad Pengenalan: <%=rs.getString("applicantID") %> </label> 
				
				<label id="labelid" for="name">Nama penuh: </label>
				<input type="text" class="forInput" name="applicantName" value='<%=rs.getString("applicantName") %>'>
				<br><br>
				<label id="labelid" for="phoneno">Nombor Telefon: </label>
				<input type="text" name="applicantPhoneNumber" class="forInput" id="phoneno" value='<%=rs.getString("applicantPhoneNumber") %>'>
				<br><br>
				<label id="labelid" for="email">Alamat Email: </label>
				<input type="text" name="applicantEmail" class="forInput" id="email" value='<%=rs.getString("applicantEmail") %>'>
				<br><br>
				<label id="labelid" for="address">Alamat Rumah: </label>
				<input type="text" name="applicantAddress" class="forInput" id="address" value='<%=rs.getString("applicantAddress") %>'>
				<br><br>
				<label id="labelid" for="city">Bandar: </label>
				<input type="text" name="applicantCity" class="forInput" id="city" value='<%=rs.getString("applicantCity") %>'>
				<br><br>
				<label id="labelid" for="postcode">Poskod: </label>
				<input type="text" name="applicantPostcode" class="forInput" id="postcode" value='<%=rs.getInt("applicantPostcode") %>'>
				<br><br>
				<label id="labelid" for="state">Negeri: </label>
				<input type="text" name="applicantState" class="forInput" id="state" value='<%=rs.getString("applicantState") %>'>
				<br><br>
				<label id="labelid" for="state">Jenis Pemohon: </label>
				<input type="text" name="applicantEmploymentType" class="forInput" id="state" value='<%=rs.getString("applicantEmploymentType") %>' >
				<br><br>
      
      <%if(rs.getString("studentLevel")==null) {%>
				<label id="labelid" for="state">Peringkat Pengajian: </label>
				<input type="text" name="studentLevel" class="forInput" id="state" value="Tiada Info" disabled>
      <br><br>   	  
      <%}else {%>
				<label id="labelid" for="state">Peringkat Pengajian: </label>
				<input type="text" name="studentLevel" class="forInput" id="state" value='<%=rs.getString("studentLevel") %>'>
				<br><br>	  
      <%}%>

      <%if(rs.getString("studentInstitution")==null) {%>
				<label id="labelid" for="state">Institusi: </label>
				<input type="text" name="studentInstitution" class="forInput" id="state" value="Tiada Info" disabled>
      <br><br>   	  
      <%}else {%>
				<label id="labelid" for="state">Institusi: </label>
				<input type="text" name="studentInstitution" class="forInput" id="state" value='<%=rs.getString("studentInstitution") %>'>
				<br><br>  
      <%}%>	

      <%if(rs.getString("employeeOccupation")==null) {%>
				<label id="labelid" for="state">Pekerjaan: </label>
				<input type="text" name="employeeOccupation" class="forInput" id="state" value="Tiada Info" disabled>
				<br><br>   	  
      <%}else {%>
				<label id="labelid" for="state">Pekerjaan: </label>
				<input type="text" name="employeeOccupation" class="forInput" id="state" value='<%=rs.getString("employeeOccupation") %>'>
				<br><br>
      <%}%>	              				

      <%if(rs.getString("employeeSalary")==null) {%>
				<label id="labelid" for="state">Gaji: </label>
				<input type="text" name="employeeSalary" class="forInput" id="state" value="Tiada Info" disabled>
				<br><br>  
      <%}else {%>
				<label id="labelid" for="state">Gaji: </label>
				<input type="text" name="employeeSalary" class="forInput" id="state" value='<%=rs.getString("employeeSalary") %>'>
				<br><br>
      <%}%>	 														
         </div>
            <%} %>
         <input type="hidden" name="action" value="updateApplicant">
         <button type="submit" class="button2" name="submit" formaction="ApplicantHandler" onclick="return confirm('Anda pasti untuk mengemaskini akaun?');">KEMASKINI</button><br><br>
      </fieldset>
      </form>
               <button class="button1" onclick="document.location='applicantAccount.jsp'" onclick="return confirm('Anda pasti untuk membatalkan kemaskini akaun?');">KEMBALI</button>
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