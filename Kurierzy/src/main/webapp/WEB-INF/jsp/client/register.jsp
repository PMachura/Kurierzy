

<%-- 
    Document   : make
    Created on : 2016-05-21, 14:03:16
    Author     : Przemek
--%>

<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<html>
    <head>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <div class="container">
                    <p>Pleas enter a datail and submit</p>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-md-offset-4">
                    <div class="panel panel-default">
                      

                        <div class="panel-heading">
                            <h3 class="panel-title">Register</h3>
                        </div>
                        <div class="panel-body">
                           <form:form modelAttribute="client" method="POST" action="save" cssStyle="form-horizontal" >

                        <form:hidden path="id"/>

                        <div class="form-group row">
                            <label class="col-sm-2 control-label" for="name">
                                Imie:
                            </label>
                            <div class="col-sm-10">
                                <form:input path="name" cssClass="form-control" required="true" />
                            </div>
                            <form:errors cssClass="inputError" path="name"/>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 control-label" for="surname">
                                Nazwisko:
                            </label>
                            <div class="col-sm-10">
                                <form:input path="surname" cssClass="form-control" required="true"/>
                            </div>
                            <form:errors cssClass="inputError" path="surname"/>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 control-label" for="address">
                                Adres:
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
                                Telefon:
                            </label>
                            <div class="col-sm-10">
                                <form:input path="phoneNumber" cssClass="form-control" />
                            </div>
                            <form:errors cssClass="inputError" path="phoneNumber"/>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 control-label" for="password">
                                <!--TODO Obsluga polskich znakow-->
                                Haslo:  
                            </label>
                            <div class="col-sm-10">
                                <form:input path="password" cssClass="form-control" />
                            </div>
                            <form:errors cssClass="inputError" path="password"/>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 control-label" for="city.id">
                                Miasto:
                            </label>
                            <div class="col-sm-10">
                                <form:select items="${cities}" path="city.id" itemValue="id" itemLabel="name" cssClass="form-control"></form:select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-12">
                                <button type="submit" class="btn btn-lg btn-success btn-block">Zapisz</button>
                            </div>     
                        </div>
                    </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>






