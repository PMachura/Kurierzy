<%-- 
    Document   : add
    Created on : 2016-05-28, 11:23:22
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
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1><spring:message code="vehicle.add"/><br></h1>
                    <p>Pleas enter a datails and submit</p>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Vehicle</h3>
                        </div>
                        <div class="panel-body">
                            <form:form modelAttribute="vehicle" method="POST" action="save">
                                    <form:hidden path="id"/>
                                <fieldset>
                                    <div class="form-group">
                                        <form:input path="brand" placeholder="Brand" required="true" /><form:errors path="brand"/><br/>
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
</html>
