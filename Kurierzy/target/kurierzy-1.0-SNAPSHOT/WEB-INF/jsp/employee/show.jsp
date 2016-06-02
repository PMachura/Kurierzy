

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
                                <p>City: ${employee.city.name}                         
                                <p></p>
                                <sec:authorize access="hasAuthority('MANAGER')">
                                    <p>
                                        <a
                                            href=" <spring:url value="/employee/edit?id=${request.id}" /> "
                                            class="btn btn-primary"> Edit
                                        </a>
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
