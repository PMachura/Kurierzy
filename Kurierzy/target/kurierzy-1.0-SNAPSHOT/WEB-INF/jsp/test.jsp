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




                <div class="form-group" >
                    <input type ="radio" value="tasty" name="taste"   >Tasty
                    <input type ="radio" value="sweet" name="taste" />Sweet
                    <input type ="radio" value="bitter" name="taste" />Bitter
                </div>



                <form:input type="text" placeholder="name" path="name"/><br />




                <div class="form-group">
                    <input type="submit" value="Make an order" />
                </div>
            </fieldset>
        </form:form>
    </body>
</html>
