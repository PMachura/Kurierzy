<%-- 
    Document   : test
    Created on : 2016-05-22, 15:28:59
    Author     : Przemek
--%>

<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>

        <form:form  action ="inputs" modelAttribute="name">
            <fieldset>
                <legend>Wprowadz dane</legend>




                <div class="form-group"  >
                    <input type ="radio" value="tasty" name="taste"   >Tasty
                    <input type ="radio" value="sweet" name="taste" />Sweet
                    <input type ="radio" value="bitter" name="taste" />Bitter
                </div>
                
                <br>
                <br>
                
                <div class="form-group" >
                    <input type ="checkbox" value="red" name="color"   >Red
                    <input type ="checkbox" value="green" name="color" />Green
                    <input type ="checkbox" value="blue" name="color" />Blue
                </div>





                <div class="form-group">
                    <input type="submit" value="Make an order" />
                </div>
            </fieldset>
            <br>
            <br>
        </form:form>
        <form:form action="receiveUser">
            <input type="hidden" name="user" value="${user}" />
            <div class="form-group">
                <input type="submit" class value="ReceiveUser"  class="form-group" />
            </div>
            
        </form:form>
    </body>
</html>
