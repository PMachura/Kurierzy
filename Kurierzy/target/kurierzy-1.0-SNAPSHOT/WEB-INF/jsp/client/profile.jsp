<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <div class="custom-container">
            
            <section>
                <div class="jumbotron">
                    <div class="container">
                        <h1>Your profile</h1>
                    </div>
                </div>
            </section>

            <section class="container">
                    <div class="col-sm-4 col-sm-offset-4" style="padding-bottom: 15px">
                        <div class="thumbnail">
                            <div class="caption">
                                <div>
                                    <h4> Name: ${client.name} ${client.surname} </h4>
                                    <h4> Mail: ${client.email} </h4>
                                    <h4> Phone: ${client.phoneNumber} </h4>
                                    <h4> Address: ${client.address} </h4>
                                    <h4> City: ${client.city.name} </h4>

                                    <a href="editMyProfile"><button type="button" class="btn btn-success btn-block">Edit profile</button></a>
                                </div>    
                            </div>    
                        </div>
                        <br>
                        <a href="/Kurierzy/">
                            <button class="btn btn-lg btn-default btn-block"> 
                                <span class="glyphicon  glyphicon-arrow-left"> </span> 
                                Back to the previous page
                            </button>
                        </a>
                    </div>
            </section>
        </div>
    </body>
</html>