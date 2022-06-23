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
				   url="jdbc:postgresql://ec2-3-228-235-79.compute-1.amazonaws.com/ddrev47ip327l0"
				   user = "hlcietwdsgkwyq"
				   password="f6078446e3932c85a4d99b3753e1b04295a6add4a27ee4fdc3649c1efb1a04f1"/>
<sql:query dataSource="${ic}" var="oc">
	SELECT row_number() over () "rank",donationID,donationName,donationDescription,donationOpenDate, donationCloseDate from donation where donationId>0
</sql:query>
<nav>
	<ul>
		<div class = "logo">
			<img src = "Image/Logo.png" alt = "logo" height="70" >
			<li><a class="navi" href="#" onclick="document.location='LoginAccount.html'">LOG KELUAR</a>
			<li><a class="navi" href="#" onclick="document.location='ViewAccount.html' ">AKAUN</a>
			<li><a class="navi" href="#" onclick="document.location='buttonApplicationCommittee.html'">PERMOHONAN</a>
			<li><a class="navi" href="#" onclick="document.location='createDonation2.html' ">BANTUAN</a>
		</div>
	</ul>
</nav>
<a class="tambah" href=donationForm.jsp>Tambah</a>
<br>
<div class="content" >
	<br>
	<h2 class="title">Senarai Bantuan</h2>
	<div style="overflow-x:auto;">
		<table style="text-align: center;" id="donationList">
			<tr>
				<th onclick="sortTable(0)" style="width: 50px; height: 50px;">No. </th>
				<th onclick="sortTable(1)" style="width:400px;">Nama Bantuan</th>
				<th onclick="sortTable(2)" style="width: 350px;">Penerangan Bantuan</th>
				<th onclick="sortTable(3)" style="width: 450px;">Tarikh Buka</th>
				<th onclick="sortTable(4)" style="width: 450px;">Tarikh Tutup</th>
				<th style="width: 100px;">Action</th>
			</tr>
			<c:forEach var="result" items="${oc.rows}">
				<tr>
					<td class="donationID">
						<c:out value="${result.rank}"/>
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
							<button  class="action"  type="delete" formaction="DonationHandler">PADAM</button>
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
	.logo{
		flex: 1;}
	.logo a{
		display: flex;
		align-items: center;
		font-size: 20px;
	}
	.logo img{
		width: 70px;
		margin-right: 10px;
	}
	ul {
		list-style-type: none;
		overflow: hidden;
		background-color: #BBE9FE;
		height: 70px;
		width:100%;}
	li {
		float: right;}
	.navi {
		display: block;
		color: #4d4d4d;
		font-weight: bold;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
		margin-top: 10px;
		margin-right: 10px;
	}
	li a.navi:hover {
		background-color: #4d4d4d;
	}
	div.a {
		position: relative;
		display: block;
	}
	table, th, td {
		border: 1px solid;
		border-collapse: collapse;
	}
	.title {
		font-weight: bold;
		font-size: 30px;
		font-family: Arial, Helvetica, sans-serif;
		color: #000000;
		margin-left: auto;
		margin-right:auto;
	}
	.action {
		background-color: #b3e6ff;
		font-size: 10px;
		height: 35px;
		width: 75px;
		padding: 10px;
		margin: 10px 0;
		border-bottom-style: groove;
		cursor: pointer;
		border-radius: 25px;
	}
	.tambah {
		background-color: #b3e6ff;
		color: #000000;
		height: 30px;
		width: 80px;
		padding: 10px;
		border-bottom-style: groove;
		border-radius: 25px;
		position: absolute;
		top: 80px;
		right: 30px;
	}
</style>
</html>