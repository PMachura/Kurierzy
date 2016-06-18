<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employees</title>
    </head>
    <body>
        <div class="custom-container">
            
            <section>
                <div class="jumbotron">
                    <div class="container">
                        <h1><spring:message code="employee.showAll"/></h1>
                    </div>
                </div>
            </section>

            <div class="container">
                <table class="table">
                    <thead class="thead-inverse">
                        <tr>
                            <th>Id</th>
                            <th>First Name</th>
                            <th>Surname</th>
                            <th>Email</th>
                            <th>City</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${employees}" var="employee">
                            <tr>
                                <td>${employee.id}</td>
                                <td>${employee.name}</td>
                                <td>${employee.surname}</td>
                                <td>${employee.email}</td>
                                <td>${employee.city.name}</td>
                                <td>
                                    <a href="show?id=${employee.id}&back=employees">
                                        <button type="button" class="btn btn-success btn-block">Show</button>
                                    </a>
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
