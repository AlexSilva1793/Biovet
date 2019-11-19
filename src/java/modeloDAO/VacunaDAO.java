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
import modeloVO.VacunaVO;
import util.ConexionBD;
import util.InterfaceCR;

/**
 *
 * @author master
 */
public class VacunaDAO extends ConexionBD implements InterfaceCR {

    private Connection conection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    private String query = null;
    private boolean operacion = false;

    private String idVacuna = "", tipoVacuna = "";

    public VacunaDAO(VacunaVO vacunaVO) {
        super();
        try {
            conection = this.obtenerConexion();
            statement = conection.createStatement();
            
            idVacuna=vacunaVO.getIdVacuna();
            tipoVacuna=vacunaVO.getTipoVacuna();
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            query="INSERT INTO `Vacuna` (`idVacuna`, `tipoVacuna`) VALUES (NULL, '"+tipoVacuna+"')";
            statement.executeQuery(query);
            operacion=true;
        } catch (Exception e) {
            System.out.println("Error al agregar una vacuna " + e.toString());
        }
        return operacion;
    }

    @Override
    public ArrayList consultarRegistro() {
        ArrayList<VacunaVO> vacunaArray =new ArrayList<>();
        try {
            if (idVacuna=="0") {
                query="SELECT * FROM `Vacuna`";
            }else{
                query="SELECT * FROM `Vacuna` WHERE idVacuna =  "+idVacuna;
            }
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {                
                VacunaVO vacunaTmp = new VacunaVO();
                
                vacunaTmp.setIdVacuna(resultSet.getString(1));
                vacunaTmp.setTipoVacuna(resultSet.getString(2));
                
                vacunaArray.add(vacunaTmp);
            }
        } catch (Exception e) {
            System.out.println("Error al consultar una vacuna " + e.toString());
        }
        return vacunaArray;
    }

    @Override
    public ArrayList consultarGeneral() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
