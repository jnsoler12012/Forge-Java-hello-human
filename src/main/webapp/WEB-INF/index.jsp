<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Languages</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
    <h1>Languages</h1>
    <hr>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered table-hover table-sm">
                    <thead>
                        <tr>
                            <th>
                                Name
                            </th>
                            <th>
                                Creator
                            </th>
                            <th>
                                Version
                            </th>
                            <th>
                                Action
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${languages}" var="language">
                            <tr>
                                <td>
                                    <a href="/languages/${language.id}"><c:out value="${language.name}" /></a>
                                    
                                </td>
                                <td>
                                    <c:out value="${language.creator}" />
                                </td>
                                <td>
                                    <c:out value="${language.currentVersion}" />
                                </td>
                                <td>
                                    <form:form action="/languages/edit/${language.id}" method="get">
                                        <input type="submit" value="Edit" />
                                    </form:form>
                                    <form:form action="/languages/delete/${language.id}" method="delete">
                                        <input type="submit" value="Delete" />
                                    </form:form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <form:form action="/languages" method="post" modelAttribute="language"> 
                    <div class="form-group">
                        <form:label path="name" for="name">Name</form:label>
                        <form:errors path="name" class="badge text-bg-primary"/>
                        <form:input type="text" class="form-control" id="name" path="name" />
                    </div>
                    <div class="form-group">
                        <form:label path="creator" for="creator">Creator</form:label>
                        <form:errors path="creator" class="badge text-bg-primary"/>
                        <form:input type="text" class="form-control" id="creator" path="creator" />
                    </div>
                    <div class="form-group">
                        <form:label path="currentVersion" for="currentVersion">Current version</form:label>
                        <form:errors path="currentVersion" class="badge text-bg-primary"/>
                        <form:input type="text" class="form-control" id="currentVersion" path="currentVersion"/>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        Submit
                    </button>
                </form:form> 
            </div>
        </div>
    </div>
</body>

</html>