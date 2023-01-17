<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of Applicatiion</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
</head>
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
        <button class="navi" href="#" ><i>PERMOHONAN</i></button>
        <button class="navi" href="#" onclick="document.location='donationList.jsp'">BANTUAN</button>
    </div>
</nav>
<br>
<form action="" method="post"></form>
	<div class="content" >
	    <br>
	    <h2 class="title">Senarai Permohonan Bagi Bantuan <c:out value="${result.donationID}"/></h2>
	    <div style="overflow-x:auto;">
	        <table style="text-align: center;" id="donationList">
	            <tr>
	                <th onclick="sortTable(0)" style="width: 150px; height: 50px;">ID PEMOHON</th>
	                <th onclick="sortTable(1)" style="width: 150px; ">ID PERMOHONAN</th>
	                <th onclick="sortTable(2)" style="width: 250px;">TARIKH PERMOHONAN</th>
	                <th onclick="sortTable(3)" style="width: 250px;">MASA PERMOHONAN</th>
	                <th onclick="sortTable(4)" style="width: 200px;">STATUS PERMOHONAN</th>
	            </tr>
<%
Class.forName("org.postgresql.Driver");
String DB_CONNECTION = "jdbc:postgresql://localhost:5432/udonation";
String DB_USER = "postgres";
String DB_PASSWORD = "syauqi2826";

int donationID = Integer.parseInt(request.getParameter("donationID"));
String sql= "select applicantID, applicantid, applicationid, applicationid, applicationDate, applicationTime, applicationStatus from application join donation using(donationid) where donationID='"+donationID+"';";
Connection con=DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
	
%>	
	                <tr>
	                    <td class="applicantID">
						<form method="post">
							<button  class="applicantID" formaction="committeeViewApplicant.jsp?applicantID=<%=rs.getString("applicantID")%>&applicationID=<%=rs.getString("applicationID")%>"><%=rs.getString("applicantID") %></button>							
						</form>
	                    </td>
	                    <td class="applicationID">
	                        <%=rs.getString("applicationID") %>
	                    </td>
	                    <td class="applicationDate">
	                        <%=rs.getString("applicationDate") %>
	                    </td>
	                    <td class="applicationTime">
	                        <%=rs.getString("applicationTime") %>
	                    </td>
	                    <td class="applicationStatus">
							<%=rs.getString("applicationStatus") %>
						</td>	
	                </tr>
<%} %>	
	        </table>
	    </div>
	    <br><br><br>
	</div>
</form>
</body>
<style>
    body{
        font-family: "Bahnschrift Light", "Courier New", monospace;
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
    div.a {
        position: relative;
        display: block;
    }
    table, th, td {
        border: 1px solid;
        border-collapse: collapse;
        text-align: left;
        margin-top: 50px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }
    td {
        padding-left: 10px;
        font-family: "Bahnschrift Light", "Courier New", monospace;
    }
    th {
        text-align: center;
        font-family: "Bahnschrift SemiBold", "Courier New", monospace;
    }

    .title {
        text-align: center;
        font-weight: bold;
        font-size: 30px;
        font-family: "Bahnschrift", "Courier New", monospace;
        color: #000000;
    }

    input[type=checkbox]
    {
        text-align: center;
    }

    .view
    {
        background-color: #b3e6ff;
        width: 50px;
        height: 20px;
    }

    .view:hover
    {
        background-color: #617C8D;
    }
</style>
</html>