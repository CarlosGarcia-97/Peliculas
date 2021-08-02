package mx.edu.utez.Servlets;

import java.sql.*;

public class ConnectionMySQL {
    public static Connection getConnection() throws SQLException {
        String host = "127.0.0.1";
        String port = "3306";
        String database = "Netflix";
        String useSSL = "false";
        String timezone = "UTC";
        String user = "root";
        String password = "";
        String url = String.format("jdbc:mysql://%s:%s/%s?userSSL=%s&serverTimezone=%s", host, port, database, useSSL, timezone);
        DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
        return DriverManager.getConnection(url, user, password);
    }

    public static void closeConnections(Connection con, CallableStatement cstm, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (cstm != null) {
                cstm.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
        }

    }

    public static void closeConnections(Connection con, CallableStatement cstm) {
        try {
            if (cstm != null) {
                cstm.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
        }

    }

    public static void main(String[] args) {
        try {
            Connection con = ConnectionMySQL.getConnection();
            System.out.println("Ok");
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

}




