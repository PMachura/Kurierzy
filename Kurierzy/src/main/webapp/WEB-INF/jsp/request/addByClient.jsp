<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Order</title>
    </head>
    <body>
        <div class="custom-container">
            
            <section>
                <div class="jumbotron">
                    <div class="container">
                        <h1>Make your order</h1>
                    </div>
                </div>
            </section>
            
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            
                            <div class="panel-heading">
                                <h3 class="panel-title">Order</h3>
                            </div>
                            
                            <div class="panel-body">
                                <form:form modelAttribute="request" method="POST" action="save">
                                    <form:hidden path="id" />
                                    <form:hidden path="client.id" />
                                        
                                    <div class="form-group">
                                        <form:input path="destinationAddress" placeholder="Destination Address" required="true" cssClass="form-control" />
                                        <form:errors path="destinationAddress"/>
                                    </div>
                                        
                                    <div class="form-group">
                                        <form:select items="${cities}" path="city.id" itemValue="id" itemLabel="name" cssClass="form-control"></form:select>
                                    </div>
                                        
                                    <div class="form-group">
                                        <form:input path="addresseeName" placeholder="Addresse Name" required="true" cssClass="form-control" />
                                        <form:errors path="addresseeName"/>
                                    </div>
                                        
                                    <div class="form-group">
                                        <form:input path="addresseeSurname" placeholder="Addressee Surname" required="true" cssClass="form-control" />
                                        <form:errors path="addresseeSurname"/>
                                    </div>
                                        
                                    <div class="form-group">
                                        <form:input path="weight" placeholder="weight" type="text" required="true" cssClass="form-control" />
                                        <form:errors path="weight"/>
                                    </div>
                                    
                                    <input name="addType" value="client" hidden="hidden" />
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Save">
                                </form:form>
                            </div>
                        </div>
                        <a href="/Kurierzy/">
                            <button class="btn btn-lg btn-default btn-block"> 
                                <span class="glyphicon  glyphicon-arrow-left"> </span> 
                                Back to the previous page
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>