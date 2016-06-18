<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Shipments</title>
    </head>
    <body>
        <div class="custom-container">
            
            <section>
                <div class="jumbotron">
                    <div class="container">
                        <h1>${employee.email} shipments</h1>
                        <p></p>
                    </div>
                </div>
            </section>

            <section class="container">
                <c:forEach items="${employee.shipments}" var="shipment">
                    <div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
                        <div class="thumbnail">
                            <div class="caption"> 
                                <h3>Id: ${shipment.id}</h3>
                                <p>Status: ${shipment.shipmentStatus.title}
                                <p> Current City: ${shipment.currentCity.name} </p>
                                <p> Next City: ${shipment.nextCity.name} </p>
                                <a href=" <spring:url value="/shipment/show?id=${shipment.id}&back=myShipments" /> ">
                                    <button type="button" class="btn btn-success btn-block">Show</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
<!--                    <a href="show?id=${employee.id}">
                        <button class="btn btn-lg btn-default btn-block"> 
                            <span class="glyphicon  glyphicon-arrow-left"> </span> 
                            Back to the previous page
                        </button>
                    </a>-->
                </sec:authorize>
                
                <sec:authorize access="hasRole('ROLE_COURIER')">
<!--                <a href="/Kurierzy/">
                    <button class="btn btn-lg btn-default btn-block"> 
                        <span class="glyphicon  glyphicon-arrow-left"> </span> 
                        Back to the previous page
                    </button>
                </a>-->
                </sec:authorize>
                
                <c:choose>
                            <c:when test="${employees}">
                                <a href="show?id=${employee.id}&back=employees">
                                <button class="btn btn-lg btn-default btn-block"> 
                                    <span class="glyphicon  glyphicon-arrow-left"> </span> 
                                    Back to the previous page
                                </button>
                            </a>
                            </c:when>
                            <c:otherwise>
                                                          <a href="/Kurierzy/">
                    <button class="btn btn-lg btn-default btn-block"> 
                        <span class="glyphicon  glyphicon-arrow-left"> </span> 
                        Back to the previous page
                    </button>
                </a>
                            </c:otherwise>
                        </c:choose>  
            </section>
        </div>
    </body>
</html>
