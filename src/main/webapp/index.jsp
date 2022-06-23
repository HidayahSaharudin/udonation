<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Masjid Sultan Azlan Shah</title>
</head>
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
<h1 class="title" >
    <%= "MASJID SULTAN AZLAN SHAH" %>
    <h3 class="title" >
            <%= "Ahli Jawatankuasa Masjid" %>
        <br>
        <img class="img" src="Image/msas.png" alt="msas">
</h1>
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
    .add {
        position: absolute;
        left: 120px;
        width: 370px;
        border: none;
        padding: 18px 16px;;
        font-size: 20px;
        font-family: "Bahnschrift", "Courier New", monospace;}
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
        font-size: 30px;
    }
    .logo img{
        width: 130px;
        height: 130px;
        margin-right: 10px;
    }
    ul {
        list-style-type: none;
        overflow: hidden;
        background-color: #BBE9FE;
        height: 130px;
        width:100%;}
    li {
        float: right;}
    .navi {
        display: block;
        color: #4d4d4d;
        font-weight: bold;
        text-align: center;
        padding: 40px 16px;
        text-decoration: none;
        margin-top: 10px;
        margin-right: 10px;
    }
    li a.navi:hover {
        background-color: #617C8D;
    }
    div.a {
        position: relative;
        display: block;
    }
    .img {
        margin-left: auto;
        margin-right: auto;
        width:100%;
        height: 700px;
    }
    .title {
        margin-top: 20px;
        margin-bottom: 20px;
        text-align: center;
    }
</style>
</html>