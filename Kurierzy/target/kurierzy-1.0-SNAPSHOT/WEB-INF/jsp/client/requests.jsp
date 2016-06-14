<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
    </head>
    <body>
        <div class="custom-container">
            
            <section>
                <div class="jumbotron">
                    <div class="container">
                        <h1>My Orders</h1>
                    </div>
                </div>
            </section>

            <div class="container">
                <table class="table">
                    <thead class="thead-inverse">
                        <tr>
                            <th>Id</th>
                            <th>Adresse Surname</th>
                            <th>Adresse Name</th>
                            <th>Destination</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${client.requests}" var="request">
                            <tr>
                                <td>${request.id}</td>
                                <td>${request.addresseeSurname}</td>
                                <td>${request.addresseeName}</td>
                                <td>${request.city.name}</td>
                                <td>${request.requestStatus.title}</td>
                                <td>
                                    <form:form action="myRequest" method="POST">
                                        <input hidden="true" name="requestId" value="${request.id}"/>
                                        <button type="submit" class="btn btn-success" value="${request.id}">Show</button>      
                                    </form:form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="/Kurierzy/">
                    <button class="btn btn-lg btn-default btn-block"> 
                        <span class="glyphicon  glyphicon-arrow-left"> </span> 
                        Back to the previous page
                    </button>
                </a>
            </div>
        </div>
    </body>
</html>