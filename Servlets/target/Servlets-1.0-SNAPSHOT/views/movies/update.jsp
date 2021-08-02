<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
  <title>Modificar Pelicula</title>
  <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<h1>Modificar Pelicula</h1>
<form action="${context}/ServletMovie" method="POST">
  <input type="hidden" value="update" name="action">
  <input type="hidden" value="${ beanMovie.id}" name="id">
  <label>Nombre:</label>
  <input class="form-control" type="text" name="name" value ="${beanMovie.name}" />
  <br>
  <label>Descripcion:</label>
  <input class="form-control" type="text" name="description" value ="${beanMovie.description}"/>
  <br>
  <label>Fecha de estreno:</label>
  <input class="form-control" type="date" name="date_premiere" value ="${beanMovie.date_premiere}"/>
  <br>
  <label>Dinero recaudado:</label>
  <input class="form-control" type="number" name="collection" value ="${beanMovie.collection}" step="any"/>
  <br>


  <button type="button" class="btn btn-secondary"><i class="fas fa-times"></i> Cancelar</button>
  <button type="submit" class="btn btn-primary"><i class="fas fa-edit"></i> Modificar</button>
</form>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>