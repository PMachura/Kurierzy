<%-- 
    Document   : edit
    Created on : 2016-05-22, 08:03:55
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
        <h1>Eddit request</h1>
        <div>
            <form:form modelAttribute="request" method="POST" action="update">
                <form:hidden path="id"/>
                <form:hidden path="client.id" value="${client.id}" />
                
                <fieldset>
                    <div class="form-group">
                        <form:input path="destinationAddress" placeholder="Destination Address" required="true" /><form:errors path="destinationAddress"/><br/>
                    </div>
                    <div class="form-group">
                        <form:select items="${cities}" path="city.id" itemValue="id" itemLabel="name"></form:select>
                    </div>
                    <div class="form-group">
                        <form:input path="addresseeName" placeholder="Addresse Name" required="true" /><form:errors path="addresseeName"/><br/>
                    </div>
                    <div class="form-group">
                        <form:input path="addresseeSurname" placeholder="Addressee Surname" required="true" /><form:errors path="addresseeSurname"/><br/>
                    </div>
                    <div class="form-group">
                        <form:input path="weight" placeholder="weight" type="text" required="true" /><form:errors path="weight"/><br/>
                    </div>
                    <div class="form-group">
                        <form:input path="price" placeholder="Price" type="text" required="true" /><form:errors path="price"/><br/>
                    </div>
                    <div class="form-group">
                        <form:input path="shipment.id" placeholder="Shipment " value="${shipment.id}" type="text" required="true"  /><form:errors path="price"/><br/>
                    </div>
                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Edit">
                </fieldset>
            </form:form>
            
            <form:form action = "/shipment/show">
                <form:input hidde="true" id="assignToOrder"
            </form:form>
        </div>
    </body>
</html>
