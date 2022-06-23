<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Create Donation Page</title>
</head>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap');
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;}
	body{
		font-family: "Lucida Console", "Courier New", monospace;
		color: black;
		background-color: #ffffff;
	}
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
<body>
<nav>
	<ul>
		<div class = "logo">
			<img src = "Logo.png" alt = "logo" height="70" >
			<li><a class="navi" href="#" onclick="document.location='LoginAccount.html'">LOGOUT</a>
			<li><a class="navi" href="#" onclick="document.location='ViewAccount.html' ">AKAUN</a>
			<li><a class="navi" href="#" onclick="document.location='buttonApplicationCommittee.html'">PERMOHONAN</a>
			<li><a class="navi" href="#" onclick="document.location='createDonation2.html' ">BANTUAN</a>
			<li><a class="MSAS" href="#">MASJID SULTAN AZLAN SHAH</a>
		</div>
	</ul>
</nav>
< class="form">
<form class="donation" method="post" action="DonationHandler">
	<fieldset class="fieldset">
		<legend class="legend">CIPTA JENIS SUMBANGAN</legend>
		<div class="insideForm">
			<label>Nama Sumbangan: </label><br>
			<input class="box" type= "text" name = "donationName" value="" required><br><br>
			<label>Penerangan Derma dan Butiran Kelayakan: </label><br>
			<input class="box" type= "text" name = "donationDescription"><br><br>
			<label>Tarikh Buka: </label><br>
			<input type= "date" name = "donationOpenDate"><br><br>
			<label>Tarikh Tutup: </label><br>
			<input type= "date" name = "donationCloseDate"><br><br>
		</div>
	</fieldset>
	<button type="cancel" class="button1" name="action"  value="cancel" formaction="DonationHandler">KEMBALI</button>
	<input type="hidden" name="action" value="createDonation">
	<button type="submit" class="button2" name="submit" >CIPTA</button><br><br>
</form>
</body>
</html>