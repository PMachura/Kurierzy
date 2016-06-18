<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shipments</title>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Shipments</h1>
                    <p>All shipments</p>
                </div>
            </div>
        </section>

        <section class="container">
            <c:forEach items="${shipments}" var="shipment">
                <div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
                    <div class="thumbnail">
                        <div class="caption">
                            <h3>Id: ${shipment.id}</h3>
                            <p>Employee: <a href="/Kurierzy/employee/show?id=${shipment.employee.id}&back=shipments"> ${shipment.employee.email} </a> </p>
                            <p>Status: ${shipment.shipmentStatus.title}
                            <p> Current City: ${shipment.currentCity.name} </p>
                            <p> Next City: ${shipment.nextCity.name} </p>
                            <a href=" <spring:url value="/shipment/show?id=${shipment.id}&back=showAll" /> ">
                                    <button type="button" class="btn btn-success btn-block">Show</button>
                                </a>
                        </div>
                    </div>
                </div>          
            </c:forEach>
            <a href="/Kurierzy/">
                <button class="btn btn-lg btn-default btn-block"> 
                    <span class="glyphicon  glyphicon-arrow-left"> </span> 
                    Back to the previous page
                </button>
            </a>
        </section>
    </body>
</html>
