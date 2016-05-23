<%-- 
    Document   : clientAdd
    Created on : 2016-05-06, 12:21:58
    Author     : Przemek
--%>




<!-- wszystko co bedzie zaczynalo sie od form bedzie dotyczylo tego tabliba, sprawia to, ?e u?ywane s? tagi spring MVC -->
<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Person adding</title>
    </head>
    
    <body>
      
        <h1>Dear customer, here you can create your account</h1>
        <!-- nazwa obiektu do ktorego jest bindowany formularz, metoda, co dalej tutaj juz nie trzeba dodawac /client -->
       <form:form modelAttribute="client" method="POST" action="save">
            
           <!-- from:errors gdzie umie?ci? info o b??dzie dla konkretnej nieprawid?owej zmiennej -->
           <!-- path - atrybuty modelu -->
            <form:hidden path="id"/>
            <form:input path="name" placeholder="Name" required="true" /><form:errors path="name"/><br/>
            <form:input path="surname" placeholder="Surname" required="true"/><form:errors path="surname"/><br/>
            <form:input path="address"  placeholder="Address" required="true" /><form:errors path="address"/> <br/>
            <form:input path="email" type="email" placeholder="E-mail" required="true" /><form:errors path="email"/> <br/>
            <form:input path="phoneNumber" placeholder="Phone" /><form:errors path="phoneNumber"/><br/>  
            <form:input path="password" placeholder="Password" /><form:errors path="password"/><br/>
            <form:select items="${cities}" path="city.id" itemValue="id" itemLabel="name"></form:select>
            
            <form:button>Save</form:button>
            
        </form:form>
    </body>
</html>