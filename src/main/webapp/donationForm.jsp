<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Create Donation Page</title>
</head>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<body>
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
<div class="form">
	<form class="donation" method="post" action="DonationHandler">
		<fieldset class="fieldset">
			<legend class="legend">CIPTA JENIS BANTUAN</legend>
			<div class="insideForm">
				<label>Nama Sumbangan: </label><br><br>
				<textarea type="text" class="box1" id="donationName" rows="50" cols="100" name = "donationName" value='' required></textarea><br><br>
				<label>Penerangan Derma dan Butiran Kelayakan: </label><br><br>
				<textarea type="text" class="box2" id="donationDescription" rows="50" cols="500" name = "donationDescription"></textarea><br><br>
				<label>Tarikh Buka: </label><br><br>
				<input class="box1" type= "date" name = "donationOpenDate"><br><br>
				<label>Tarikh Tutup: </label><br><br>
				<input class="box1" type= "date" name = "donationCloseDate"><br><br>
			</div>
		</fieldset>
		<br><br><br><br><br><br>
		<button type="cancel" class="button1" name="action"  value="cancel" formaction="DonationHandler">KEMBALI</button>
		<input type="hidden" name="action" value="createDonation">
		<button type="submit" class="button2" name="submit" >CIPTA</button><br><br>
	</form>
</div>
</body>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap');
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
		
	div.a{
		position: relative;
		display: block;}
	.button1{
		background-color: #b3e6ff;
		height: 50px;
		width: 100px;
		border-radius: 25px;
		margin-left: 10px;}
	.button2{
		background-color: #b3e6ff;
		border-radius: 25px;
		height: 50px;
		width: 100px;
		padding: 15px 10px;
		text-align: center;
		display: inline;
		cursor: pointer;
		bottom: 23px;
		margin-left: 500px;}
	.box1{
		height: 40px;
		width: 800px;
		font-size: 17px;}
	.box2{
		height: 120px;
		width: 800px;
		font-size: 17px;}
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
		padding: 30px;
		margin-left: -50px;}
	.insideForm{
		align: center;
		padding: 50px;}
	label {
		font-family: "Bahnschrift SemiBold", "Courier New", monospace;}
	.box1, .box2 {
		font-family: "Bahnschrift Light", "Courier New", monospace;}
</style>
</html>