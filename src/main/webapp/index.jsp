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
            <img src = "Image/Logo.png" alt = "logo" height="70" >
            <li><a class="navi" href="#" onclick="document.location='LoginAccount.html'">LOGKELUAR</a>
            <li><a class="navi" href="#" onclick="document.location='ViewAccount.html' ">AKAUN</a>
            <li><a class="navi" href="#" onclick="document.location='buttonApplicationCommittee.html'">PERMOHONAN</a>
            <li><a class="navi" href="#" onclick="document.location='donationList.jsp' ">BANTUAN</a>
        </div>
    </ul>
</nav>
<h1 class="title" >
    <%= "MASJID SULTAN AZLAN SHAH" %>
    <h3 class="title" >
            <%= "Ahli Jawatankuasa" %>
        <br>
        <img class="img" src="msas.png" alt="msas" style="width:100%">
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
    .img {
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
    .title {
        margin-top: 20px;
        margin-bottom: 20px;
        text-align: center;
    }
</style>
</html>