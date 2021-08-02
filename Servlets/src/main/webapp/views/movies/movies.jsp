<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Listado de peliculas</title>
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<a href="${context}/views/movies/register.jsp" class="btn btn-outline-success"><i class="fas fa-plus"></i> Agregar
    pelicula</a>
<table class="table">
    <thead class="table-dark">
    <tr>
        <th>No.</th>
        <th>Nombre de pelicula</th>
        <th>Descripcion</th>
        <th>Fecha de estreno</th>
        <th>Dinero recaudado</th>
        <th>Estado</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${ listMovies }" var="movie" varStatus="status">
        <tr>
            <td>${ status.count }</td>
            <td>${ movie.name } </td>
            <td>${ movie.description }</td>
            <td>${ movie.release_date}</td>
            <td>${ movie.collection}</td>
            <td>
                <c:if test="${ movie.status == 1 }">
                    <span class="badge rounded-pill bg-success">Activo</span>
                </c:if>
                <c:if test="${ movie.status == 0 }">
                    <span class="badge rounded-pill bg-danger">Inactivo</span>
                </c:if>
            </td>
            <td>
                <c:if test="${ movie.status == 1 }">
                    <form action="${context}/ServletMovie" method="POST" style="display: inline;">
                        <input type="hidden" name="action" value="getUserById">
                        <input type="hidden" name="id" value="${ movie.id }">
                        <button type="submit" class="btn btn-outline-primary"><i class="fas fa-edit"></i> Modificar
                        </button>
                    </form>
                    <button type="button" class="btn btn-outline-danger"
                            onclick="recibir('${movie.id}','${movie.name}');" data-bs-toggle="modal"
                            data-bs-target="#delete" onclick="recibir('${ user.id }','${ user.idPerson.name}' );"><i
                            class="fas fa-trash"></i> Eliminar
                    </button>

                </c:if>
                <c:if test="${ movie.status == 0 }">
                    <button type="button" class="btn btn-outline-info"
                            onclick="details('${movie.id}','${movie.name}', '${movie.description}','${movie.date_premiere}','${movie.collection}');"
                            data-bs-toggle="modal" data-bs-target="#details"><i class="fas fa-info-circle"></i> Detalles
                    </button>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%-- MODAL --%>
<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Eliminar pelicula</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ¿Estas seguro de eliminarlo?
                <br>
                <b><span id="name"></span></b>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i>
                    Cerrar
                </button>
                <form action="${context}/ServletMovie" method="POST" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="" id="idMovie">
                    <button type="submit" class="btn btn-danger"><i class="fas fa-trash"></i> Eliminar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="details" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Detalles de la pelicula</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label>Id: </label>
                <br>
                <span id="id1" style="font-weight: bold"></span>
                <br>
                <label>Nombre: </label>
                <br>
                <span id="name1" style="font-weight: bold"></span>
                <br>
                <label>Descripción: </label>
                <br>
                <span id="description1" style="font-weight: bold"></span>
                <br>
                <label>Fecha de estreno: </label>
                <br>
                <span id="date_premiere1" style="font-weight: bold"></span>
                <br>
                <label>Dinero Recaudado: </label>
                <br>
                <span id="collection1" style="font-weight: bold"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i>
                    Cerrar
                </button>
            </div>
        </div>
    </div>
</div>
<script language="javascript">
    function recibir(id, name) {
        document.getElementById("name").innerHTML = name;
        document.getElementById("idMovie").value = id;
    }

    function details(id1, name1, description1, date_premiere1, collection1) {
        document.getElementById("id1").innerHTML = id1;
        document.getElementById("name1").innerHTML = name1;
        document.getElementById("description1").innerHTML = description1;
        document.getElementById("release_date1").innerHTML = release_date1;
        document.getElementById("collection1").innerHTML = collection1;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>