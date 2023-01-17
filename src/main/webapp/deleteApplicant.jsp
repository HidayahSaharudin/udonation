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
    <title>Delete Account Page</title>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
</head>
<body>
    <%
    Class.forName("org.postgresql.Driver");
    String DB_CONNECTION = "jdbc:postgresql://localhost:5432/udonation";
    String DB_USER = "postgres";
    String DB_PASSWORD = "syauqi2826";
	
	String applicantID=(String)session.getAttribute("applicantID"); 
    String sql= "select * from applicant where applicantID='"+ applicantID +"'";
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
            
            <form class="bar" method="get" action="ApplicantHandler">
		        <input type="hidden" name="action" value="logoutApplicant">
		       	<button class="navi" href="#" onclick="return confirm('Anda pasti untuk log keluar?');">LOG KELUAR</button>
		    </form>
            
            <button class="navi" href="#" onclick="document.location='applicantAccount.jsp'">AKAUN</button>
            <button class="navi" href="#" onclick="document.location='buttonApplicationCommittee.html'">PERMOHONAN</button>
            <button class="navi" href="#" onclick="document.location='donationType.jsp' ">BANTUAN</button>
            <button class="navi" href="#" ><ion-icon name="notifications-outline"></ion-icon></button> 
        </div>
</nav>
<form class="bar" method="post" action="ApplicantHandler">
<input type="hidden" name="applicantID" class="forInput"  value='<%=rs.getString("applicantID")%>'>
<div class="form">
    <br>
    <p class="delete">Kenapa anda mahu memadam akaun anda?</p><br><br>
    <input type="radio" id="reason1" name="reason" value="Saya sudah tidak mahu menggunakan akaun saya lagi.">
    <label for="reason1">Saya sudah tidak mahu menggunakan akaun saya lagi.</label><br><br>
    <input type="radio" id="reason2" name="reason" value="Kebimbangan privasi.">
    <label for="reason2">Kebimbangan privasi.</label><br><br>
    <input type="radio" id="reason3" name="reason" value="Saya tidak lagi berminat untuk memohon bantuan.">
    <label for="reason2">Saya tidak lagi berminat untuk memohon bantuan.</label><br><br>
    <input type="radio" id="reason4" name="reason" value="Hal lain, sila nyatakan.">
    <label for="reason2">Hal lain, sila nyatakan.</label>
    <input class="box" type= "text" name = "reason">
</div>

	<button class="button1" onclick="document.location='applicantAccount.jsp" >KEMBALI</button>
	<input type="hidden" name="action" value="deleteApplicant">
	<input type="hidden" name="applicantID" value="${result.applicantID}">						
	<button type="submit" class="button3" name="submit" href="#" onclick="return confirm('Anda pasti untuk memadam akaun?');">PADAM</button>   
</form>
 <%} %>
</body>
<style>

    body
    {
        font-family: "Lucida Console", "Courier New", monospace;
        color: black;
        background-color: #e6f7ff;
    <!-- background-image: url('design.png');-->
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

    .delete
    {
        text-align: center;
    }

    /* Set a style for all buttons */
    button {
        background-color: #37a0a0;
        padding: 10px 15px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        border-radius: 25px;
        padding: 10px;
    }


    .button1{
        background-color: #b3e6ff;
        height: 50px;
        width: 100px;
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
        bottom: 8px;
        left: 16px;
    }

    .button2{
        background-color: #b3e6ff;
        height: 50px;
        width: 100px;
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
        bottom: 8px;
        right: 150px;
    }

    .button3{
        background-color: #b3e6ff;
        height: 50px;
        width: 100px;
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
        bottom: 8px;
        right: 16px;
    }

    .button1:hover
    {
        background-color: #617C8D;

    }

    .button2:hover
    {
        background-color: #617C8D;

    }

    .button3:hover
    {
        background-color: #617C8D;

    }

    .form {
        font-family: "Poppins", sans-serif;
        font-size: 18px;
        border-style: groove;
        margin-left: 200px;
        margin-right: 200px;
        margin-top: 50px;
        height: 380px;
        width: 800px;
        padding: 30px;
        background-color: #BBE9FE;
    }

    .box {
        margin-left: 53px;
    }

    button:hover {
        opacity:1;
    }

    /* Float cancel and delete buttons and add an equal width */
    .cancelbtn, .deletebtn {
        float: left;
        width: 50%;
    }

    /* Add a color to the cancel button */
    .cancelbtn {
        background-color: #ccc;
        color: black;
    }

    /* Add a color to the delete button */
    .deletebtn {
        background-color: #f44336;
    }

    /* Add padding and center-align text to the container */
    .container {
        padding: 16px;
        text-align: center;
    }

    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: #474e5d;
        padding-top: 50px;
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
        border: 1px solid #888;
        width: 40%; /* Could be more or less, depending on screen size */
    }

    /* Style the horizontal ruler */
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }

    /* The Modal Close Button (x) */
    .close {
        position: absolute;
        right: 35px;
        top: 15px;
        font-size: 40px;
        font-weight: bold;
        color: #f1f1f1;
    }

    .close:hover,
    .close:focus {
        color: #f44336;
        cursor: pointer;
    }

    /* Clear floats */
    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }

    /* Change styles for cancel button and delete button on extra small screens */
    @media screen and (max-width: 300px) {
        .cancelbtn, .deletebtn {
            width: 100%;
        }
    }
</style>
</html>