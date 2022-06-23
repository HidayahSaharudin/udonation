<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Donation</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%
    Class.forName("org.postgresql.Driver");
    String dbURL = "jdbc:postgresql://ec2-3-228-235-79.compute-1.amazonaws.com/ddrev47ip327l0";
    String user = "hlcietwdsgkwyq";
    String pass = "f6078446e3932c85a4d99b3753e1b04295a6add4a27ee4fdc3649c1efb1a04f1";
    
    String id=request.getParameter("id");
    int num=Integer.parseInt(id);
    String sql= "select * from donation where donationID='"+ num +"'";
    Connection con=DriverManager.getConnection(dbURL, user, pass);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>
	<nav>
		<ul>
		  <div class = "logo">
		  <img src = "Image/Logo.png" alt = "logo" height="70">
			<li><a class="navi" href="#" onclick="document.location='LoginAccount.html'">LOGOUT</a>
			<li><a class="navi" href="#" onclick="document.location='ViewAccount.html' ">AKAUN</a>
			<li><a class="navi" href="#" onclick="document.location='buttonApplicationCommittee.html'">PERMOHONAN</a>
			<li><a class="navi" href="#" onclick="document.location='createDonation2.html' ">BANTUAN</a>
			<li><a class="MSAS" href="#">MASJID SULTAN AZLAN SHAH</a>
		  </div>
		</ul>
	</nav>
<div class="form">
    <form class="donation" method="post" action="DonationHandler">
        <fieldset class="fieldset">
            <legend class="legend">CIPTA JENIS SUMBANGAN</legend>
            <div class="insideForm">
            <input type="hidden" name="id" value='<%=rs.getString("donationID") %>'/>
                <label>Nama Sumbangan: </label>
                <input class="box" type="text" name="donationName" value='<%=rs.getString("donationName") %>' required><br>

                <label>Penerangan Derma dan Butiran Kelayakan: </label><br>
                <input class="box" type="text" name="donationDescription" value='<%=rs.getString("donationDescription") %>'><br>

                <label>Tarikh Buka: </label><br>
                <input type="date" name="donationOpenDate" value='<%=rs.getString("donationOpenDate") %>'><br>

                <label>Tarikh Tutup: </label><br>
                <input type="date" name="donationCloseDate" value='<%=rs.getString("donationCloseDate") %>'><br>

        </div>
            <%} %>

            <div id="mybutton" class="button">
                <!-- <button type="cancel" name="action"  value="cancel" formaction="DonationHandler">BATAL</button> -->
                <input type="hidden" name="action" value="updateDonation">
                <button class="button1" type="submit" formaction="DonationHandler" onclick="return confirm('Yakin untuk kemaskini ?');">KEMASKINI</button>
                <br><br>
            </div>
            </fieldset>
        </form>
    </div>
</div>

<br><br><br>
</body>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap');

    body{
        font-family: "Lucida Console", "Courier New", monospace;
        color: black;
        background-color: #ffffff;}

    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;}

    a, a:hover{
        text-decoration: none;}

    nav a.navi:hover{
        margin-top: 10px;
        color: #BBE9FE;}

    .logo{
        flex: 1;}

    .logo a{
        display: flex;
        align-items: center;
        font-size: 20px;}

    .logo img{
        width: 70px;
        margin-right: 10px;}

    ul{
        list-style-type: none;
        overflow: hidden;
        background-color: #BBE9FE;
        height: 70px;
        width:100%;}

    li{
        float: right;}

    .MSAS{
        margin-right: 640px;
        margin-top: 25px;
        color: black;
        font-family: Arial, Helvetica, sans-serif;}

    .navi{
        display: block;
        color: #4d4d4d;
        font-weight: bold;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        margin-top: 10px;
        margin-right: 10px;}

    li a.navi:hover{
        background-color: #4d4d4d;}

    div.a{
        position: relative;
        display: block;}

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

    .title{
        margin-top: 20px;
        text-align: center;}

    .box{
        height: 40px;
        width: 500px;}

    .legend{
        font-weight: bold;
        font-size: 30px;
        font-family: Arial, Helvetica, sans-serif;
        color: #000000;
        margin-left: auto;
        margin-right:auto;}

    .fieldset{
        margin-left: 20%;
        margin-right: 20%;
        background-color: #b3e6ff;}

    .form{
        padding: 40px;}

    .insideForm{
        align: center;
        padding: 50px;}

</style>
</html>