<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Maklumat Diri</title>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js">
  </script>
</head>
<body>
<%String applicantID = request.getParameter("applicantID"); %>
<form class="applicant" name="myForm" formaction="ApplicantHandler" method="post" onsubmit ="return matchPassword()">
  <fieldset class="fieldset">
  <legend class="legend">MAKLUMAT DIRI</legend>
  <div class='center'>
    <p>Semua bertanda (<span>*</span>) adalah wajib</p>
    <br>
    <label for="applicantID">No Kad Pengenalan <span>*</span></label>
    <input type="text" class="forInput" name="applicantID" placeholder="Sila masukkan no kad pengenalan anda" required>
    <br><br>
    <label for="applicantName">Nama penuh <span>*</span></label>
    <input type="text" class="forInput" name="applicantName" placeholder="Sila masukkan nama penuh anda" required>
    <br><br>
    <label for="applicantPhoneNumber">Nombor Telefon <span>*</span></label>
    <input type="tel" pattern=[0-9]{10} placeholder="0123456789" name="applicantPhoneNumber" class="forInput" id="phoneno" placeholder="Sila masukkan nombor telefon anda tanpa (-)" required>
    <br><br>
    <label for="applicantEmail">Alamat Email <span>*</span></label>
    <input type="email" name="applicantEmail" class="forInput" id="email" placeholder="Sila masukkan email anda" required>
    <br><br>
    <label for="applicantAddress">Alamat Rumah <span>*</span></label>
    <input type="text" name="applicantAddress" class="forInput" id="address" placeholder="Sila masukkan alamat rumah" required>
    <br><br>
    <label for="applicantCity">Bandar <span>*</span></label>
    <input type="text" name="applicantCity" class="forInput" id="city" placeholder="Sila masukkan bandar" required>
    <br><br>
    <label for="applicantPostcode">Poskod <span>*</span></label>
    <input type="number" name="applicantPostcode" class="forInput" id="postcode" placeholder="Sila masukkan poskod" required>
    <br><br>
    <label for="applicantState">Negeri <span>*</span></label>
    <select name="applicantState" id="applicantState" class="forInput">
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
 <div id="radioContainer">
    <label for="pelajar">Jenis Pemohon?<span>*</span></label>
    <input type="radio" name="applicantEmploymentType" value="Pelajar" id="Pelajar">Pelajar
    <input type="radio" name="applicantEmploymentType" value="Pekerja" id="Pekerja">Bekerja
    <input type="radio" name="applicantEmploymentType" value="Tidak Bekerja" id="Tidak Bekerja">Tidak Bekerja
 </div>
      
    <br><br>
 <div id="form1" style="display:none">
    <label for="pelajar"><b>Sila Isi Maklumat Anda Sebagai Seorang Pelajar</b></label>
    <br>
    <label for="studentLevel">Peringkat Pengajian </label>
    <select name="studentLevel" id="studentLevel" class="forInput">
      <option value="">--Sila Pilih--</option>
      <option value="Ijazah">Ijazah</option>
      <option value="Diploma">Diploma</option>
      <option value="Sekolah Menengah">Sekolah Menengah</option>
    </select>
    <label for="studentInstitution">Institusi </label>
    <input type="text" name="studentInstitution" class="forInput" id="studentInstitution" placeholder="Sila masukkan institusi pengajian">
 </div>
 <div id="form2" style="display:none">
    <label for="pekerja"><b>Sila Isi Maklumat Anda Sebagai Seorang Pekerja</b></label>
    <br>
    <label for="employeeOccupation">Jenis Pekerjaan </label>
    <input type="text" name="employeeOccupation" class="forInput" id="employeeOccupation" placeholder="Sila masukkan pekerjaan">
    <label for="employeeSalary">Gaji: RM </label>
    <input type="number" name="employeeSalary" class="forInput" id="employeeSalary" placeholder="Sila masukkan gaji bulanan">  
 </div>
 <div id="form3" style="display:none">
 
 </div>      
    </fieldset>
    
    <br><br>
    <label for="id"><b>Kata Laluan </b><span>*</span></label><br>
    <input type="password" name="applicantPassword">
    <br>
    <label for="id"><b>Pengesahan Kata Laluan </b><span>*</span></label><br>
    <input type="password" name="password">
    <br><br>

  <button class="button1" onclick="document.location='applicantLogin.jsp'">KEMBALI</button>
  <input type="hidden" name="action" value="createApplicant">
  <button type="submit" class="button2" name="submit" formaction="ApplicantHandler">SETERUSNYA</button><br><br>

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
  const option1 = document.getElementById("Pelajar");
  const option2 = document.getElementById("Pekerja");
  const option3 = document.getElementById("Tidak Bekerja");
  const form1 = document.getElementById("form1");
  const form2 = document.getElementById("form2");
  const form3 = document.getElementById("form3");

  option1.addEventListener("change", function() {
      form1.style.display = "block";
      form2.style.display = "none";
      form3.style.display = "none";
  });

  option2.addEventListener("change", function() {
      form1.style.display = "none";
      form2.style.display = "block";
      form3.style.display = "none";
  });

  option3.addEventListener("change", function() {
      form1.style.display = "none";
      form2.style.display = "none";
      form3.style.display = "block";
  });
</script>
</html>