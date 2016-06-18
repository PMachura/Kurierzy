<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shipment</title>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Shipment</h1>
                </div>
            </div>
        </section>

        <section class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
                    <div class="thumbnail">
                        <div class="caption">


                            <div class ="container">
                                <h3>ID ${shipment.id}</h3>
                                <p> Shipment status: ${shipment.shipmentStatus.title} </p>
                                <p> Current City: ${shipment.currentCity.name} </p>
                                <p> Next City: ${shipment.nextCity.name} </p>
                                <p>Courier: ${shipment.employee.email}</p> 
                                <sec:authorize access="hasAnyRole('ROLE_FORWARDER, ROLE_COURIER')">
                                    <form:form action="edit" method="POST">
                                        <input hidden="true" name="shipmentId" value="${shipment.id}"/>
                                        <c:choose>
                            <c:when test="${myShipments}">
                    <input hidden="true" name="back" value="myShipments"/>
                            </c:when>
                            <c:otherwise>
                    <input hidden="true" name="back" value="showAll"/>
                            </c:otherwise>
                        </c:choose>   
                                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Edit"  >    
                                    </form:form>
                                </sec:authorize>
                                <sec:authorize access="hasRole('ROLE_FORWARDER')">        
                                    <form:form action="delete" method="POST">
                                        <input hidden="true" name="shipmentId" value="${shipment.id}"/>
                                        <input type="submit" class="btn btn-lg btn-success btn-block" value="DELETE"  >    
                                    </form:form> 
                                </sec:authorize>
                            </div>
                        </div>
                    </div>
                                    <c:choose>
                            <c:when test="${myShipments}">
                                <a href="/Kurierzy/employee/myShipments">
                                <button class="btn btn-lg btn-default btn-block"> 
                                    <span class="glyphicon  glyphicon-arrow-left"> </span> 
                                    Back to the previous page
                                </button>
                            </a>
                            </c:when>
                            <c:when test="${client}">
                                <form:form action="myRequest" method="POST">
                                        <input hidden="true" name="requestId" value="${requestId}"/>
                                        <button type="submit" class="btn btn-lg btn-default btn-block" value="${requestId}"><span class="glyphicon  glyphicon-arrow-left"> </span> 
                                    Back to the previous page</button>      
                                    </form:form>
                            </c:when>
                            <c:otherwise>
                                                          <a href="/Kurierzy/shipment/showAll">
                                <button class="btn btn-lg btn-default btn-block"> 
                                    <span class="glyphicon  glyphicon-arrow-left"> </span> 
                                    Back to the previous page
                                </button>
                            </a>  
                            </c:otherwise>
                        </c:choose>   
                </div>

            </div>
        </section>
    </body>
</html>
