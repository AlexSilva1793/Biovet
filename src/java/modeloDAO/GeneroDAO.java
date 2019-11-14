/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import modeloVO.GeneroVO;
import util.ConexionBD;
import util.InterfaceCR;

public class GeneroDAO extends ConexionBD implements InterfaceCR {

    private Connection conection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    private String query = null;
    private boolean operacion = false;

    private String idGenero = "";
    private String tipoSexo = "";

    public GeneroDAO(GeneroVO generoVO) {

        try {
            conection = this.obtenerConexion();
            statement = conection.createStatement();

            idGenero = generoVO.getIdGenero();
            tipoSexo = generoVO.getTipoSexo();
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }

    }

    @Override
    public boolean agregarRegistro() {
        try {
            query = "INSERT INTO genero (tipoSexo) VALUES ('" + tipoSexo + "');";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("Error");
        }
        return operacion;
    }

    @Override
    public boolean consultarRegistro() {
        try {
            query = "SELECT * FROM genero;";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("No existen datos de Genero");
        }
        return operacion;
    }

}
