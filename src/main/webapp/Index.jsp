<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>MENU UTAMA</title>
   </head>
   <body>
      <input class="button1" type="button" value="Pemohon" onclick="document.location='applicantLogin.jsp'">
      <input class="button2" type="button" value="Ahli Jawatankuasa" onclick="document.location='committeeLogin.jsp'">
   </body>
   <style>
      body
      {
      font-family: "Poppins", sans-serif;
      background-image: url('Image/FRONTPAGE.png');	
      background-repeat: no-repeat;
  	  background-attachment: fixed;
  	  background-size: 1500px;
      }
      .button1
      {
      background-color: #66c2ff;
      font-weight: bold;
      border-radius: 30px;
      font-size: 20px;
      border-style: groove;
      color: black;
      cursor: pointer;
      width: 250px;
      height: 60px;
      margin-top: 280px;
      margin-left: 41%;
      position: absolute;
      }
      .button2
      {
      background-color: #66c2ff;
      font-weight: bold;
      border-radius: 30px;
      font-size: 20px;
      border-style: groove;
      color: black;
      cursor: pointer;
      width: 250px;
      height: 60px;
      margin-top: 380px;
      margin-left: 41%;
      position: absolute;			
      }
      .button1:hover 
      {
      background-color: #617C8D;
      }
      .button2:hover 
      {
      background-color: #617C8D;
      }
   </style>
</html>