<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html>
    <head>
        <title>Add Employee</title>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1><spring:message code="employee.add"/><br></h1>
                    <p>Pleas enter a datails and submit</p>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Employee</h3>
                        </div>
                        <div class="panel-body">
                            <form:form modelAttribute="employee" method="POST" action="save">
                                    <form:hidden path="id"/>
                                <fieldset>
                                    <div class="form-group">
                                        <form:input path="email" placeholder="Email" required="true" cssClass="form-control" />
                                        <form:errors path="email"/>
                                    </div>
                                    <div class="form-group">
                                        <form:input path="password" placeholder="Password" type="text" required="true" cssClass="form-control" />
                                        <form:errors path="password"/>
                                    </div>
                                    <div class="form-group">
                                        <form:select multiple="true" path="roles" items="${rolesAvaliable}"  itemLabel="title" itemValue="id" cssClass="form-control" /> <!-- sprawdzic czy ddziala z options blad byl ze bylo itemValues a nie itemValue -->                      
                                    </div>
                                    <div class="form-group">
                                        <form:input path="name" placeholder="Name" required="true" cssClass="form-control" />
                                        <form:errors path="name"/>
                                    </div>
                                    <div class="form-group">
                                        <form:input path="surname" placeholder="Surname" required="true" cssClass="form-control" />
                                        <form:errors path="surname"/>
                                    </div>
                                    <div class="form-group">
                                        <form:select  items="${cities}"  path="city.id" itemValue="id"  itemLabel="name" cssClass="form-control"></form:select>
                                    </div>
                                     <div class="form-group">
                                        <form:select path="vehicle.id" cssClass="form-control" >
                                            <form:options items="${vehicles}"  itemValue="id" itemLabel="brand" />                                         
                                        </form:select>
                                    </div>
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Save">
                                </fieldset>
                            </form:form>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${edit}">
                            <a href="/Kurierzy/employee/show?id=${employee.id}">
                                <button class="btn btn-lg btn-default btn-block"> 
                                    <span class="glyphicon  glyphicon-arrow-left"></span> 
                                    Back to the previous page
                                </button>
                    </a>
                        </c:when>
                        <c:otherwise>
                            <a href="/Kurierzy/">
                                <button class="btn btn-lg btn-default btn-block"> 
                                    <span class="glyphicon  glyphicon-arrow-left"></span> 
                                    Back to the previous page
                                </button>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </body>
</html>