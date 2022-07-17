<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>MAKLUMAT DIRI</title>
      <link rel="stylesheet" href="styles.css">
   </head>
   <body>
   	  <form class=committee name="myForm" action="CommitteeHandler" method="post" onsubmit ="return matchPassword()">
      <fieldset class="fieldset">
         <legend class="legend">MAKLUMAT DIRI</legend>
         <div class='center'>
            <p>Semua bertanda (<span>*</span>) adalah wajib</p>
               <br>
               <label id="labelid" for="id">No Kad Pengenalan <span>*</span></label>
               <input type="text" class="forInput" name="committeeID" placeholder="Sila masukkan no kad pengenalan anda" required>
               <br><br>
               <label id="labelid" for="name">Nama penuh <span>*</span></label>
               <input type="text" class="forInput" name="committeeName" placeholder="Sila masukkan nama penuh anda" required>
               <br><br>
               <label id="labelid" for="phoneno">Nombor Telefon <span>*</span></label>
               <input type="tel" pattern=[0-9]{10} placeholder="012-3456789" name="committeePhoneNumber" class="forInput" id="phoneno" required>
               <br><br>
               <label id="labelid" for="email">Alamat Email <span>*</span></label>
               <input type="email" name="committeeEmail" class="forInput" id="email" placeholder="Sila masukkan email anda" required>
               <br><br>
               <label id="labelid" for="address">Alamat Rumah <span>*</span></label>
               <input type="text" name="committeeAddress" class="forInput" id="address" placeholder="Sila masukkan alamat rumah" required>
               <br><br>
               <label id="labelid" for="city">Bandar <span>*</span></label>
               <input type="text" name="committeeCity" class="forInput" id="city" placeholder="Sila masukkan bandar" required>
               <br><br>
               <label id="labelid" for="postcode">Poskod <span>*</span></label>
               <input type="number" name="committeePostcode" class="forInput" id="postcode" placeholder="Sila masukkan poskod" required>
               <br><br>
               <label id="labelid" for="state">Negeri <span>*</span></label>
               <select name="committeeState" id="state" class="forInput">
                  <option value="">--Sila Pilih Negeri--</option>
                  <option value="Johor">Johor</option>
                  <option value="Kedah">Kedah</option>
                  <option value="Kelantan">Kelantan</option>
                  <option value="Kuala Lumpur">Kuala Lumpur</option>
                  <option value="Melaka">Melaka</option>
                  <option value="Negeri Sembilan">Negeri Sembilan</option>
                  <option value="Pahang">Pahang</option>
                  <option value="Perak">Perak</option>
                  <option value="Perlis">Perlis</option>
                  <option value="Pulau Pinang">Pulau Pinang</option>
                  <option value="Sabah">Sabah</option>
                  <option value="Sarawak">Sarawak</option>
                  <option value="Selangor">Selangor</option>
                  <option value="Terengganu">Terengganu</option>
               </select>
               
            <br><br>
			<label for="id"><b>Kata Laluan </b><span>*</span></label><br>
			<input type="password" name="committeePassword">
			<br><br>
			<label for="id"><b>Pengesahan Kata Laluan </b><span>*</span></label><br>
			<input type="password" name="password">
			<br><br>
               
         </div>
         <button class="button1" onclick="document.location='committeeLogin.jsp'">KEMBALI</button>
         <input type="hidden" name="action" value="createCommittee">
         <button type="submit" class="button2" name="submit" formaction="CommitteeHandler">DAFTAR</button><br><br>
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
   </style>
   <script>
	 function matchPassword() {  
	  var pw1 = document.getElementById("committeePassword");  
	  var pw2 = document.getElementById("password");  
	  if(pw1 != pw2)  
	  {   
	    alert("Kata Laluan Tidak Sama");  
	  }
	}
   </script>
</html>