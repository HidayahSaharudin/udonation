<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Log Masuk Ahli Pemohon</title>
   </head>
   <body>
      <div class="container">
         <br><br>
         <fieldset class="fieldset">
            <legend class="legend">PEMOHON</legend>
            
            <form action="/action_page.php" method="post">
               <input class="button1" type="button" value="Log Masuk">
               <input class="button" type="button" value="Daftar" onclick="document.location='applicantRegistration.jsp'">
               <br><br><br>
               <label for="id"><b>ID Pengguna</b></label><br>
               <input type="text" name="applicantID" placeholder="No Kad Pengenalan tanpa -" required>
               <br><br>
               <label for="psw"><b>Kata Laluan</b></label><br>
               <input type="password" name="applicantPassword" required><br>
               <span class="psw"><a href="#">Lupa kata laluan?</a></span>
               <br><br><br>
               <input type="hidden" name="action" value="loginApplicant">
               <button class=button type="submit" formaction=ApplicantHandler>Log Masuk</button>
      </div>
      </form>
      </fieldset>
   </body>
   <style>
      span.psw 
      {
      float: right;
      padding-top: 16px;
      }
      body
      {
      padding-right: 165px;
      font-family: "Poppins", sans-serif;
      background-image: url('Image/msas.png');
      background-repeat: no-repeat;	
      background-attachment: fixed;
	  background-size: cover;
  	  background-size: 1300px;
      }
      h2
      {
      padding-left: 80px;
      }
      input
      {
      height: 30px;
      width: 310px;
      }
      .container
      {
      margin-right: 1%;
      margin-left: 68%;
      }
      button
      {
      border:  groove;
      border-radius: 3px;
      width: 150px;
      height: 40px;
      background-color: #66c2ff;
      cursor: pointer;
      font-weight: bold;
      font-size: 16px;
      margin-left: 84px;
      }
      .button, .log
      {
      border:  groove;
      border-radius: 3px;
      width: 150px;
      height: 40px;
      background-color: #66c2ff;
      cursor: pointer;
      font-weight: bold;
      font-size: 16px;
      }
      .button1, .log
      {
      border:  groove;
      border-radius: 3px;
      width: 160px;
      height: 40px;
      background-color: #66c2ff;
      cursor: pointer;
      font-weight: bold;
      font-size: 16px;
      cursor: not-allowed;
      opacity: 0.5;
      }
      .log
      {
      margin-left: 80px;
      }
      .submit
      {
      margin-left: 85px;
      }
      .fieldset {
      padding: 50px;
      background-color: #b3e6ff;
      }
      .legend {
      font-weight: bold;
      font-size: 25px;
      font-family: Arial, Helvetica, sans-serif;
      color: #000000;
      margin-left: auto;
      margin-right:auto;
      }
      .button:hover {
      background-color: #617C8D;
      }
   </style>
</html>