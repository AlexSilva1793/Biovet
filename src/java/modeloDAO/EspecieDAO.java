/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modeloVO.EspecieVO;
import util.ConexionBD;
import util.InterfaceCR;

public class EspecieDAO extends ConexionBD implements InterfaceCR {

    private Connection conection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    private String query = null;
    private boolean operacion = false;

    private String idEspecie = "";
    private String tipoEspecie = "";

    public EspecieDAO(EspecieVO especieVO) {
        super();
        try {
            conection = this.obtenerConexion();
            statement = conection.createStatement();
            
            idEspecie = especieVO.getIdEspecie();
            tipoEspecie = especieVO.getTipoEspecie();
            
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }

    }

    @Override
    public boolean agregarRegistro() {
        try {
            query = "INSERT INTO especie (tipoEspecie) VALUES ('"+tipoEspecie+"');";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("Error al ingresar la Especie" + e.toString());
        }
        return operacion;
    }

    @Override
    public ArrayList consultarRegistro() {
        ArrayList<EspecieVO> especieVO = new ArrayList<>();
        try {
            query = "SELECT * FROM especie;";
            statement.executeQuery(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("No existen datos de Especie" + e.toString());
        }
        return especieVO;
    }

}
