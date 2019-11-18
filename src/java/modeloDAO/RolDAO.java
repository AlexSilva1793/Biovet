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
import modeloVO.RolVO;
import util.ConexionBD;
import util.InterfaceCR;

/**
 *
 * @author Usuario
 */

public class RolDAO extends ConexionBD implements InterfaceCR{
    
    private Connection conection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    private String query = null;
    private boolean operacion = false;
    
    private String idRol="";
    private String tipoRol="";

    public RolDAO(RolVO rolVO) {
        
        super();
        
        try {
            conection = this.obtenerConexion();
            statement = conection.createStatement();
            
            idRol=rolVO.getIdRol();
            tipoRol=rolVO.getTipoRol();
            
        } catch (Exception e) {
            System.out.println("Error"+e.toString());
        }
    }

    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList consultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList consultarGeneral() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
