<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Donation Page</title>
</head>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<body>
<nav>
    <ul>
        <div class = "logo">
            <img src = "Image/Logo.png" alt = "logo">
            <span class="add">Masjid Sultan Azlan Shah, Jalan Raja Musa Mahadi, Institut Tadbiran Islam Perak, 31400 Ipoh, Perak, Malaysia 05-5456779</span>
            <li><a class="navi" href="#" onclick="document.location='LoginAccount.html'">LOG KELUAR</a>
            <li><a class="navi" href="#" onclick="document.location='ViewAccount.html' ">AKAUN</a>
            <li><a class="navi" href="#" onclick="document.location='buttonApplicationCommittee.html'">PERMOHONAN</a>
            <li><a class="navi" href="#" onclick="document.location='donationList.jsp' ">BANTUAN</a>
        </div>
    </ul>
</nav>
<div class="form">
    <form class="applicant" method="post" action="ApplicantHandler">
        <fieldset class="fieldset">
            <legend class="legend">MAKLUMAT PEMOHON</legend>
            <div class="insideForm">
                <label>Nama: </label><br><br>
                <textarea type="text" class="box1" id="applicantName" rows="50" cols="100" name = "applicantName" value='' required></textarea><br><br>

                <label>Nombor IC(TANPA'-'): </label><br><br>
                <textarea type="text" class="box1" id="applicantID" rows="50" cols="500" name = "applicantID"></textarea><br><br>

                <label>Nombor Telefon: </label><br><br>
                <textarea type="text" class="box1" id="applicantPhoneNumber" rows="50" cols="500" name = "applicantPhoneNumber"></textarea><br><br>

                <label>Email: </label><br><br>
                <textarea type="text" class="box1" id="applicantEmail" rows="50" cols="500" name = "applicantEmail"></textarea><br><br>

                <label>Alamat: </label><br><br>
                <textarea type="text" class="box2" id="applicantAddress" rows="50" cols="500" name = "applicantAddress"></textarea><br><br>

                <label>Daerah: </label><br><br>
                <textarea type="text" class="box1" id="applicantCity" rows="50" cols="500" name = "applicantCity"></textarea><br><br>

                <label>Nombor Poskod: </label><br><br>
                <textarea type="text" class="box1" id="applicantPostcode" rows="50" cols="500" name = "applicantPostcode"></textarea><br><br>

                <label>Negeri: </label><br><br>
                <textarea type="text" class="box1" id="applicantState" rows="50" cols="500" name = "applicantState"></textarea><br><br>

                <label>Jenis Pemohon: </label><br><br>
                <input type="radio" id="option1" name="applicantEmploymentType" value="Student"><label>Pelajar</label><br><br>
                <input type="radio" id="option2" name="applicantEmploymentType" value="Employee"><label>Pekerja</label><br><br>
                <input type="radio" id="option3" name="applicantEmploymentType" value="Unemployed"><label>Tidak bekerja</label><br><br>

            </div>
            <button type="submit" class="button2" name="submit">CIPTA</button><br><br>
        </fieldset>
    </form>
    <form>
        <div class="insideForm">
            <fieldset class="fieldset">
        <%  String type = request.getParameter("applicantEmploymentType");
            if(type.equalsIgnoreCase("Student")){%>
        <label>Peringkat Pengajian: </label><br><br>
        <textarea type="text" class="box1" id="studentLevel" rows="50" cols="500" name = "studentLevel"></textarea><br><br>

        <label>Institusi: </label><br><br>
        <textarea type="text" class="box1" id="studentInstitution" rows="50" cols="500" name = "studentInstitution"></textarea><br><br>

        <%} else if (type.equals("Employee")) {%>
        <label>Jenis Pekerjaan: </label><br><br>
        <textarea type="text" class="box1" id="employeeOccupation" rows="50" cols="500" name = "employeeOccupation"></textarea><br><br>

        <label>Gaji Bulanan: </label><br><br>
        <textarea type="text" class="box1" id="employeeSalary" rows="50" cols="500" name = "employeeSalary"></textarea><br><br>
        <%} else {%>
        </div>
        <button type="cancel" class="button1" value="cancel" onclick="document.location='index.jsp'">KEMBALI</button>
        <input type="hidden" name="action" value="createApplicant">
        <button type="submit" class="button2" name="submit">CIPTA</button><br><br>
        <%}%>
    </form>
    </fieldset>
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
    .add {
        position: absolute;
        left: 90px;
        width: 270px;
        border: none;
        padding: 20px 16px;;
        font-size: 14px;
        color: #455a64;
        font-family: "Bahnschrift", "Courier New", monospace;}
    .logo{
        flex: 1;}
    .logo a{
        display: flex;
        align-items: center;
        font-size: 20px;
    }
    .logo img{
        width: 100px;
        height: 100px;
        margin-right: 10px;
    }
    ul {
        list-style-type: none;
        overflow: hidden;
        background-color: #BBE9FE;
        height: 100px;
        width:100%;}
    li{
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
    }
    li a.navi:hover {
        background-color: #617C8D;
        height: 5px;}
    div.a{
        position: relative;
        display: block;}
    .button1{
        background-color: #b3e6ff;
        height: 50px;
        width: 100px;
        border-radius: 25px;}
    .button2{
        background-color: #b3e6ff;
        border-radius: 25px;
        height: 50px;
        width: 100px;
        padding: 15px 10px;
        text-align: center;
        display: inline-block;
        cursor: pointer;
        bottom: 23px;
        margin-left: 1050px;}
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
        padding: 40px;}
    .insideForm{
        align: center;
        padding: 50px;}
    label {
        font-family: "Bahnschrift SemiBold", "Courier New", monospace;}
    .box1, .box2 {
        font-family: "Bahnschrift Light", "Courier New", monospace;}
</style>
</html>