<%@page contentType="text/html" %>
    <%@page pageEncoding="UTF-8" %>
        <%@ page isErrorPage="true" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit language
        <c:out value="${language.name}" />
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>

<body>
    <h2><a href="/languages">Dashboard</a></h2>

    <form:form action="/languages/delete/${language.id}" method="delete">
        <input type="submit" value="Delete" />
    </form:form>
    <form:form action="/languages/edit/${language.id}" method="post" modelAttribute="language">
        <input type="hidden" name="_method" value="put">
        <div class="form-group">
            <form:label path="name" for="name">Name</form:label>
            <form:errors path="name" class="badge text-bg-primary" />
            <form:input type="text" class="form-control" id="name" path="name" value="${language.name}" />
        </div>
        <div class="form-group">
            <form:label path="creator" for="creator">Creator</form:label>
            <form:errors path="creator" class="badge text-bg-primary" />
            <form:input type="text" class="form-control" id="creator" path="creator" value="${language.creator}" />
        </div>
        <div class="form-group">
            <form:label path="currentVersion" for="currentVersion">Current version</form:label>
            <form:errors path="currentVersion" class="badge text-bg-primary" />
            <form:input type="text" class="form-control" id="currentVersion" path="currentVersion"
                value="${language.currentVersion}" />
        </div>
        <button type="submit" class="btn btn-primary">
            Submit
        </button>
    </form:form>
</body>

</html>