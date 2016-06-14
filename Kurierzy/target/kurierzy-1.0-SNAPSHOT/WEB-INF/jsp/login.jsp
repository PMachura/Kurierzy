<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>
        <div class="custom-container">
            
            <section>
                <div class="jumbotron">
                    <div class="container">
                        <h1>Delivery company</h1>
                    </div>
                </div>
            </section>
            
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Login</h3>
                            </div>
                            <div class="panel-body">
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger">
                                        <spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/><br />
                                    </div>
                                </c:if>
                                <form action="<c:url value="/j_spring_security_check"></c:url>" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <fieldset>
                                        <div class="form-group">
                                            <input class="form-control" placeholder="Email" name='email' type="text">
                                        </div>
                                        <div class="form-group">
                                            <input class="form-control" placeholder="Password" name='password'  type="password" value="">
                                        </div>
                                        <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
                                    </fieldset>
                                </form>
                                <a href="client/register">Register</a><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>