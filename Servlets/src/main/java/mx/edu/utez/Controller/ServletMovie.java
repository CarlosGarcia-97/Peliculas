package mx.edu.utez.Controller;

import mx.edu.utez.Servlets.movies.BeanMovie;
import mx.edu.utez.Servlets.movies.DaoMovie;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ServletMovie extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listMovies", new DaoMovie().findAll());
        request.getRequestDispatcher("/views/movies/movies.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        switch (action) {
            case "create":
                // do something
                String name = request.getParameter("name") != null ? request.getParameter("name") : "";
                String description = request.getParameter("description") != null ? request.getParameter("description") : "";
                String date_premiere = request.getParameter("date_premiere") != null ? request.getParameter("date_premiere") : "";
                double collection = Double.parseDouble(request.getParameter("collection") != null ? request.getParameter("collection") : "");
                BeanMovie beanMovie = new BeanMovie(0, name, description, date_premiere, collection, 0);

                if (new DaoMovie().create(beanMovie)) {
                    request.setAttribute("message", "Pelicula registrada correctamente");
                } else {
                    request.setAttribute("message", "Pelicula no registrada");
                }

                request.setAttribute("listMovies", new DaoMovie().findAll());
                request.getRequestDispatcher("/views/movies/movies.jsp").forward(request, response);
                break;

            case "getUserById":
                // do something
                int id = Integer.parseInt(request.getParameter("id") != null ? request.getParameter("id") : "");
                request.setAttribute("beanMovie", new DaoMovie().findById(id));
                request.getRequestDispatcher("/views/movies/update.jsp").forward(request, response);
                break;

            case "update":
                // do something
                int id1 = Integer.parseInt(request.getParameter("id") != null ? request.getParameter("id") : "");
                String name1 = request.getParameter("name") != null ? request.getParameter("name") : "";
                String description1 = request.getParameter("description") != null ? request.getParameter("description") : "";
                String date_premiere1 = request.getParameter("date_premiere") != null ? request.getParameter("date_premiere") : "";
                double collection1 = Double.parseDouble(request.getParameter("collection") != null ? request.getParameter("collection") : "");
                BeanMovie beanMovie1 = new BeanMovie(id1, name1, description1, date_premiere1, collection1, 0);

                if (new DaoMovie().update(beanMovie1)) {
                    request.setAttribute("message", "Pelicula actualizada correctamente");
                } else {
                    request.setAttribute("message", "Pelicula no actualizada");
                }

                request.setAttribute("listMovies", new DaoMovie().findAll());
                request.getRequestDispatcher("/views/movies/movies.jsp").forward(request, response);
                break;

            case "delete":
                int id2 = Integer.parseInt(request.getParameter("id") != null ? request.getParameter("id") : "");

                if (new DaoMovie().delete(id2)) {
                    System.out.println("Eliminado");
                } else {
                    System.out.println("No se ha elimado");
                }
                request.setAttribute("listMovies", new DaoMovie().findAll());
                request.getRequestDispatcher("/views/movies/movies.jsp").forward(request, response);
                break;
                /*
            case "modal":
                request.setAttribute("listUsers", new DaoUser().findAll());
                request.setAttribute("idUser", request.getParameter("id")!= null ? request.getParameter("id") : "");

                break;

                 */
            default:
                // no supported
                break;
        }
    }
}
