<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Welcome to Zemoso</title>
</head>

    <h2>Zemoso Technologies PVT LTD.</h2>
    <hr/>
    <p>
    Welcome to the Zemoso Home Page.
    </p>
    <br/>

    <hr>
    <p>
        USER: <security:authentication property="principal.username"/>
        <br><br>
        ROLE(s): <security:authentication property="principal.authorities"/>
    </p>

    <hr>
    <!--Link to point to /leaders .. this is for managers  -->

    <security:authorize access="hasRole('MANAGER')">
    <p>
        <a href="${pageContext.request.contextPath}/leaders"> LeaderShip Meeting</a>
        (Only for Managers)
    </p>

    </security:authorize>

     <!--Link to point to /systems .. this is for Admins  -->
     <security:authorize access="hasRole('ADMIN')">
        <p>
            <a href="${pageContext.request.contextPath}/systems"> Admins meet</a>
            (Only for Admins)
        </p>

        </security:authorize>

    <hr>

    <form:form action="${pageContext.request.contextPath}/logout" method="POST">

    <button type="submit" >LOGOUT</button>

    </form:form>
</html>