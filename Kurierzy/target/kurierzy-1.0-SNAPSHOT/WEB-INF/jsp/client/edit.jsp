<%-- 
    Document   : edit
    Created on : 2016-05-08, 09:53:11
    Author     : Przemek
--%>

<%@ include file="/WEB-INF/jsp/includes.jsp"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit your profile</h1>
        <form:form name="input" method="post" modelAttribute="client" action="update">
            <form:input type="hidden" path="id" />
            <form:input type="hidden" path="password" />
            <div>
                <label>Name:</label>
                <form:input type="text" path="name" />
            </div>
            <div>
                <label>Surname:</label>
                <form:input type="text" path="surname"/>
            </div>
            <div>
                <label>Email:</label>
                <form:input type="text" path="email"/>
            </div>
            <div>
                <label>Phone:</label>
                <form:input type="text" path="phoneNumber"/>
            </div>
            <div>
                <label>Address:</label>
                <form:input type="text" path="address"/>
            </div>
            <div>
                <label>City:</label>
                <form:select items="${cities}" path="city.id" itemValue="id" itemLabel="name"></form:select>
            </div>

            <div>
                <input type="submit" value="Update" />
            </div>

        </form:form>
    </body>
</html>
