
<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <a href="/logout" > Wyloguj </a>
        <h2>Your profile</h2>
        <div> Name: ${client.name} ${client.surname} </div>
        <div> Mail: ${client.email} </div>
        <div> Phone: ${client.phoneNumber} </div>
        <div> Address: ${client.address} </div>
        <div> City: ${client.city.name} </div>
        
        <a href="editProfile">Edit your profile</a><br/>
        
        <a href="${client.id}/edit">Edit profile</a> <br/>
        <a href="http://localhost:8084/Kurierzy/">Back to the main page</a>
    </body>
    
</html>
