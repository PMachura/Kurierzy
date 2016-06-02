<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<html>
    <head>


        <title>Produkty</title>
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
                                        <form:input path="email" placeholder="Email" required="true" /><form:errors path="email"/><br/>
                                    </div>
                                    <div class="form-group">
                                        <form:input path="password" placeholder="Password" type="text" required="true" /><form:errors path="password"/><br/>
                                    </div>
                                    <div class="form-group">
                                        <form:select multiple="true" path="roles" items="${rolesAvaliable}"  itemLabel="title" itemValue="id" /> <!-- sprawdzic czy ddziala z options blad byl ze bylo itemValues a nie itemValue -->                      
                                    </div>
                                    <div class="form-group">
                                        <form:input path="name" placeholder="Name" required="true" /><form:errors path="name"/><br/>
                                    </div>
                                    <div class="form-group">
                                        <form:input path="surname" placeholder="Surname" required="true" /><form:errors path="surname"/><br/>
                                    </div>
                                    <div class="form-group">
                                        <form:select  items="${cities}"  path="city.id" itemValue="id"  itemLabel="name"></form:select>
                                    </div>
                                     <div class="form-group">
                                        <form:select    path="vehicle.id"  >
                                            <form:options items="${vehicles}"  itemValue="id" itemLabel="brand" />                                         
                                        </form:select>
                                    </div>
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Save">
                                </fieldset>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>