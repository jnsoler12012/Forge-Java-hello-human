<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Language <c:out value="${language.name}" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>

<body>
    <h1>Name:
        <c:out value="${language.name}" />
    </h1>
    <h2>Creator:
        <c:out value="${language.creator}" />
    </h2>
    <h3>Current Version:
        <c:out value="${language.currentVersion}" />
    </h3>
    <div>
        <form:form action="/languages/edit/${language.id}" method="get">
            <input type="submit" value="Edit" />
        </form:form>
        <form:form action="/languages/delete/${language.id}" method="delete">
            <input type="submit" value="Delete" />
        </form:form>
    </div>
</body>

</html>