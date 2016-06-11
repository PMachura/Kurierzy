

<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1><spring:message code="employee.show" /></h1>

                </div>
            </div>
        </section>

        <section class="container">
            <div class="row">

                <div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
                    <div class="thumbnail">
                        <div class="caption">


                            <div class ="container">
                                <h3>ID ${employee.id}</h3>
                                <p>Email: ${employee.email} </p>
                                <p>Name: ${employee.name} </p>
                                <p>Surname: ${employee.surname} </p>
                                <p>City: ${employee.city.name}</p>

                                Roles:    <c:forEach items="${employee.roles}" var="role">
                                    ${role.title}
                                </c:forEach>    

                                <p></p>

                                <!-- Mozliwosc edycji, usuwania tylko dla okreslonego pracownika -->
                                <sec:authorize access="hasAuthority('MANAGER')">
                                 
                                        <form:form action = "shipments" method="GET"> 
                                            <div class ="form-group">
                                                <input hidden="true" name="employeeId" value="${employee.id}"/>
                                                <input class="btn btn-lg btn-success btn-block" type="submit" value="SHIPMENTS" >
                                            </div>
                                        </form:form>
                                  
                                    
                                        <form:form action = "edit" method="POST"> 
                                            <div class ="form-group">
                                                <input hidden="true" name="employeeId" value="${employee.id}"/>
                                                <input class="btn btn-lg btn-success btn-block" type="submit" value="EDIT" >
                                            </div>
                                        </form:form>
                                
                        
                                        <form:form action = "delete" method="POST"> 
                                            <div class ="form-group">
                                                <input hidden="true" name="employeeId" value="${employee.id}"/>
                                                <input class="btn btn-lg btn-success btn-block" type="submit" value="DELETE" >
                                            </div>
                                        </form:form>
                                    </p>
                                </sec:authorize>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </body>
</html>
