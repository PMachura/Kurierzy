<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<html>

    <head>
        <title>Home Page</title>
    </head>

    <body>
        <nav class="navbar navbar-inverse">

            <div class="navbar-header">
                <a class="navbar-brand"><spring:message code="home"/></a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <sec:authorize access="isAnonymous()">
                        <li><a href="client/register">Register</a></li>
                        <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                        <li><a>Logged: <sec:authentication property="name"/></a></li>
                        <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                        </sec:authorize>
                </ul>
            </div>

        </nav>

        <div class="row ">
            <div class="col-sm-12">
                <div class="col-sm-2 navigation-col">
                    <sec:authorize access="hasRole('ROLE_CLIENT')">
                        <button type="button" class="btn btn-success btn-block">For clients</button>
                        <a class="btn btn-link" href="request/addByClient"> Make Order</a><br>
                        <a class="btn btn-link" href="client/myRequests">Show your request</a><br>
                        <a class="btn btn-link" href="client/myProfile">Show profile</a><br>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_CLIENT')">
                        <button type="button" class="btn btn-success btn-block">For admins</button>
                        <a class="btn btn-link" href="employee/add">Add employee</a>
                        <a class="btn btn-link" href="employee/showAll">Show employees</a> 
                        <a class="btn btn-link" href="request/addByEmployee"> Add request</a><br>
                        <a class="btn btn-link" href="request/showAll"> Show all request</a><br>
                        <a class="btn btn-link" href="shipment/add"> Add shipment</a><br>
                        <a class="btn btn-link" href="shipment/showAll"> Show all shipments</a><br>
                        <a class="btn btn-link" href="vehicle/add">Add vehicle</a><br>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_CLIENT')">
                        <button type="button" class="btn btn-success btn-block">For forwarders</button>
                        <a class="btn btn-link" href="request/addByEmployee"> Add request</a><br>
                        <a class="btn btn-link" href="request/showAll"> Show all request</a><br>
                        <a class="btn btn-link" href="shipment/add"> Add shipment</a><br>
                        <a class="btn btn-link" href="shipment/showAll"> Show all shipments</a><br>
                        <a class="btn btn-link" href="vehicle/add">Add vehicle</a><br>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_CLIENT')">
                        <button type="button" class="btn btn-success btn-block">For couriers</button>
                        <a class="btn btn-link" href="employee/myShipments"> MyShipments</a><br>
                    </sec:authorize>
                </div>
                <div class="col-sm-8">
                    <div class="container-main" >
                        <h2> <spring:message code="home.info"/> </h2>
                        <img class="img-responsive" src="<c:url value="/resources/images/logo.jpg" />"  />
                    </div>
                </div>
                <div class="col-sm-2">

                    <div class="panel-group">
                        <div class="panel panel-success">
                            <div class="panel-heading"><h3><b>Safety</b></h3></div>
                            <div class="panel-body">
                                <p><span class="glyphicon glyphicon-ok"></span> No missing packages!</p>
                                <p><span class="glyphicon glyphicon-ok"></span> No damaged items!</p>
                                <p><span class="glyphicon glyphicon-ok"></span> Confidentiality!</p>
                            </div>
                        </div>
                        <div class="panel panel-success">
                            <div class="panel-heading"><h3><b>Quality</b></h3></div>
                            <div class="panel-body">
                                <p><span class="glyphicon glyphicon-ok"></span> Professional team!</p>
                                <p><span class="glyphicon glyphicon-ok"></span> Latest equipment!</p>
                                <p><span class="glyphicon glyphicon-ok"></span> Professional performance!</p>
                            </div>
                        </div>
                        <div class="panel panel-success">
                            <div class="panel-heading"><h3><b>Speed</b></h3></div>
                            <div class="panel-body">
                                <p><span class="glyphicon glyphicon-ok"></span> Courier in the same day! </p>
                                <p><span class="glyphicon glyphicon-ok"></span> Next-day devlivery! </p>
                            </div>
                        </div>
                        <div class="panel panel-success">
                            <div class="panel-heading"><h3><b>Saving</b></h3></div>
                            <div class="panel-body">
                                <p><span class="glyphicon glyphicon-ok"></span> The cheapest serivce!</p>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>


        <footer class="container-fluid text-center">
            <h3>"DELIVERY COMPANY"   Above 500 000 clients and 2 000 000 completed orders! If you are satisfied, please recomend us.</h3>
        </footer>


    </body>

</html>
