
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


                </div>
            </div>
        </section>

        <section class="container">


            <div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
                <div class="thumbnail">
                    <div class="caption">


                        <div class ="container">
                            <h2>Client profile</h2>
                            <div> Name: ${client.name} ${client.surname} </div>
                            <div> Mail: ${client.email} </div>
                            <div> Phone: ${client.phoneNumber} </div>
                            <div> Address: ${client.address} </div>
                            <div> City: ${client.city.name} </div>

                            <form:form action="edit" method="POST">
                                <input hidden="true" name="clientId" value="${client.id}"/>
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="Edit"  >    
                            </form:form>
                            <form:form action="delete" method="POST">
                                <input hidden="true" name="clientId" value="${client.id}"/>
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="Delete"  >    
                            </form:form>  
                            <div><a href="http://localhost:8084/Kurierzy/">Back to the main page</a></div>
                        </div>
                    </div>
                </div>
            </div>


        </section>
    </body>
</html>