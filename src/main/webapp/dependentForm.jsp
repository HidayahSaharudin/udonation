<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Maklumat Tanggungan</title>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js">
  </script>
</head>
<body>
<%String applicantID = request.getParameter("applicantID"); %>
<form class="applicant" name="myForm" formaction="ApplicantHandler" method="post" onsubmit ="return matchPassword()">
  <fieldset class="fieldset">
  <legend class="legend">MAKLUMAT TANGGUNGAN</legend>
  <div class='center'>
    <input type="hidden" name="applicantID" value="<%=applicantID%>">
    <br>
    <label for="dependentID">No Kad Pengenalan</label>
    <input type="text" class="forInput" name="dependentID" placeholder="Sila masukkan no kad pengenalan tanggungan anda" required>
    <br><br>
    <label for="dependentName">Nama penuh</label>
    <input type="text" class="forInput" name="dependentName" placeholder="Sila masukkan nama penuh tanggungan anda" required>
    <br><br>
    <label for="dependentRelationship">Jenis Hubungan</label>
    <select name="dependentRelationship" id="dependentRelationship" class="forInput">
      <option value="">--Sila Pilih Hubungan--</option>
      <option value="Anak-beranak">Anak-beranak</option>
      <option value="Anak-angkat">Anak angkat</option>
    </select>
    <br><br>
  <button class="button1" onclick="document.location='dependentRegistration.jsp'">KEMBALI</button>
  <input type="hidden" name="action" value="createDependent">
  <button type="submit" class="button2" name="submit" formaction="ApplicantHandler">HANTAR</button><br><br>

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

  label {
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

  table, th, td
  {
    border: 1px solid black;
    border-collapse: collapse;
  }

  .tambah, .buang
  {
    background-color: #66c2ff;
    height: 20px;
    border-style: groove;
    border-radius: 3px;
    border-color: #66c2ff;
  }

  .buang
  {
    margin-left: 15px;
  }

  .tambah:hover, .buang:hover
  {
    background-color: #617C8D;
  }
</style>
<script type="text/javascript">

  function matchPassword()
  {
    var pw1 = document.getElementById("applicantPassword");
    var pw2 = document.getElementById("password");
    if(pw1 != pw2)
    {
      alert("Kata Laluan Tidak Sama");
    }
  }
</script>
</html>