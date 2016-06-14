<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
    </head>
    <body>
        <div class="custom-container">
            
            <section>
                <div class="jumbotron">
                    <div class="container">
                        <h1>Edit your profile</h1>
                    </div>
                </div>
            </section>
            
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="panel panel-default">

                            <div class="panel-heading">
                                <h3 class="panel-title">Edit</h3>
                            </div>
                            
                            <div class="panel-body">
                                <form:form modelAttribute="client" method="POST" action="update" cssStyle="form-horizontal" >
                                    <form:hidden path="id"/>

                                    <div class="form-group row">
                                        <label class="col-sm-2 control-label" for="name">
                                            Name:
                                        </label>
                                        <div class="col-sm-10">
                                            <form:input path="name" cssClass="form-control" required="true" />
                                        </div>
                                        <form:errors cssClass="inputError" path="name"/>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 control-label" for="surname">
                                            Surname:
                                        </label>
                                        <div class="col-sm-10">
                                            <form:input path="surname" cssClass="form-control" required="true"/>
                                        </div>
                                        <form:errors cssClass="inputError" path="surname"/>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 control-label" for="address">
                                            Address:
                                        </label>
                                        <div class="col-sm-10">
                                            <form:input path="address" cssClass="form-control" required="true" />
                                        </div>
                                        <form:errors cssClass="inputError" path="address"/>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 control-label" for="email">
                                            Email:
                                        </label>
                                        <div class="col-sm-10">
                                            <form:input path="email" type="email" cssClass="form-control" required="true" />
                                        </div>
                                        <form:errors cssClass="inputError" path="email"/>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 control-label" for="phoneNu,ber">
                                            Phone:
                                        </label>
                                        <div class="col-sm-10">
                                            <form:input path="phoneNumber" cssClass="form-control" />
                                        </div>
                                        <form:errors cssClass="inputError" path="phoneNumber"/>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 control-label" for="password">
                                            Password:  
                                        </label>
                                        <div class="col-sm-10">
                                            <form:input path="password" cssClass="form-control" />
                                        </div>
                                        <form:errors cssClass="inputError" path="password"/>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 control-label" for="city.id">
                                            City:
                                        </label>
                                        <div class="col-sm-10">
                                            <form:select items="${cities}" path="city.id" itemValue="id" itemLabel="name" cssClass="form-control"></form:select>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <button type="submit" class="btn btn-lg btn-success btn-block">Save</button>
                                        </div>     
                                    </div>
                                </form:form>
                            </div>
                        </div>
                        <a href="/Kurierzy/client/myProfile">
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