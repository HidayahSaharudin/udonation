<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<title>List of Donation Type</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/style.css">
	<script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<sql:setDataSource var="ic" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/udonation"
                   user = "postgres"
                   password="syauqi2826"/>
<sql:query dataSource="${ic}" var="oc">
	SELECT donationID, donationName, donationDescription, TO_CHAR(donationOpenDate, 'dd/MM/YYYY')donationOpenDate, TO_CHAR(donationCloseDate, 'dd/MM/YYYY') donationCloseDate FROM donation where donationID>0
</sql:query>
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
            <button class="navi" href="#"><i>BANTUAN</i></button>
        </div>
</nav>
<a class="tambah" href=donationForm.jsp>TAMBAH</a>
<br>
<div class="content" >
	<br>
	<h2 class="title">Senarai Bantuan</h2>
	<div style="overflow-x:auto;">
		<table style="text-align: center;" id="donationList">
			<tr>
				<th onclick="sortTable(0)" style="width: 50px; height: 50px;">DONATION ID</th>
				<th onclick="sortTable(1)" style="width: 250px;">NAMA BANTUAN</th>
				<th onclick="sortTable(2)" style="width: 500px;">MAKLUMAT BANTUAN</th>
				<th onclick="sortTable(3)" style="width: 150px;">TARIKH BUKA</th>
				<th onclick="sortTable(4)" style="width: 150px;">TARIKH TUTUP</th>
				<th style="width: 120px;">TINDAKAN</th>
			</tr>
			<c:forEach var="result" items="${oc.rows}">
				<tr>
					<td class="donationID">
						<c:out value="${result.donationID}"/>
					</td>
					<td class="donationName">
						<c:out value="${result.donationName}"/>
					</td>
					<td class="donationDescription">
						<c:out value="${result.donationDescription}"/>
					</td>
					<td class="donationOpenDate">
						<c:out value="${result.donationOpenDate}"/>
					</td>
					<td class="donationCloseDate">
						<c:out value="${result.donationCloseDate}"/>
					</td>
					<td>
						<form method="post">
							<button  class="action"  type="update" formaction="updateDonation.jsp?id=${result.donationID}">KEMASKINI
							</button>
						</form>
						<form method="post">
							<input type="hidden" name="donationID" value="${result.donationID}">
							<input type="hidden" name="action" value="deleteDonation">
							<button  class="action"  type="delete" formaction="DonationHandler" onclick="return confirm('Anda pasti untuk membuang bantuan ini?');">PADAM</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br><br><br>
</div>
</body>
<style>
	body{
		font-family: "Lucida Console", "Courier New", monospace;
		color: black;
		background-color: #ffffff;
	}
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;}
	a, a:hover{
		text-decoration: none;}
	nav a.navi:hover{
		margin-top: 10px;
		color: #BBE9FE;}
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
	div.a {
		position: relative;
		display: block;
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
	.title {
		font-weight: bold;
		font-size: 30px;
		font-family: "Bahnschrift", "Courier New", monospace;
		color: #000000;
		margin-left: 15px;
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
	.tambah {
		background-color: #b3e6ff;
		color: black;
		font-size: 18px;
		width: 98px;
		padding: 10px;
		margin: 10px 0;
		border: 2px solid black;
		cursor: pointer;
		border-radius: 25px;
		position: absolute;
		top: 120px;
		right: 60px;
	}
	.action, .tambah {
		font-family: "Berlin Sans FB", "Courier New", monospace;
	}
</style>
</html>