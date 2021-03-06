<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Client</title>
    </head>
    <body>
        <div class="custom-container">
            
            <section>
                <div class="jumbotron">
                    <div class="container">
                        <h1>Clients<br></h1>
                        <p></p>
                    </div>
                </div>
            </section>

            <div class="container">
                <table class="table">
                    <thead class="thead-inverse">
                        <tr>
                            <th>Name</th>
                            <th>Surname</th>
                            <th>Email</th>
                            <th>City</th>
                            <th>Assign</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${clients}" var="client">
                            <tr>
                                <td>${client.name}</td>
                                <td>${client.surname}</td>
                                <td>${client.email}</td>
                                <td>${client.city.name}</td>
                                <td>
                                    <form:form action="/Kurierzy/request/addByEmployee">
                                        <input hidden="true" value="${shipmentId}" name="shipmentId">
                                        <input hidden="true" value="${requestId}" name="requestId">
                                        <input hidden="true" value="${client.id}" name="clientId">
                                        <input class="btn btn-primary btn-block" type="submit" value="Assign to order">
                                    </form:form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <form:form action="/Kurierzy/request/addByEmployee">
                    <input hidden="true" value="${shipmentId}" name="shipmentId">
                    <input hidden="true" value="${requestId}" name="requestId">
                    <input hidden="true" value="${clientId}" name="clientId">
                    <div class="input-prepend"> 
                        <button class="btn btn-lg btn-default btn-block" type="submit"> 
                            <span class="glyphicon  glyphicon-arrow-left"> </span> 
                            Back to the previous page  
                        </button> 
                    </div>
                </form:form>
            </div>
        </div>
    </body>
</html>
