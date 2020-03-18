/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class ConexionBD {

    public String driver, bd, url, user, pass;
    public Connection conexion;

    public ConexionBD() {

        driver = "com.mysql.jdbc.Driver";
        bd = "Biovet";
        user = "root";
        pass = "";
        url = "jdbc:mysql://localhost:3306/" + bd;

        try {
            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(url, user, pass);
            System.out.println("Conexión OK!");

        } catch (Exception e) {
            System.out.println("Error al conectarse" + e);
        }

    }

    public Connection obtenerConexion() {
        return conexion;
    }

    public Connection cerrarConexion() throws SQLException {
        conexion.close();
        conexion = null;
        return conexion;
    }

//    public static void main(String[] args) {
//        new ConexionBD();
//    }
}
