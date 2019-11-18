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
import modeloVO.ProcedimientoQuirurgicoVO;
import util.ConexionBD;
import util.InterfaceCR;

/**
 *
 * @author Usuario
 */
public class ProcedimientoQuirurgicoDAO extends ConexionBD implements InterfaceCR{
    
    private Connection conection=null;
    private Statement statement=null;
    private ResultSet resultSEt=null;
    
    private String query =null;
    private boolean operacion=false;
    
    private String idProcedimientoQuirurgico="";
    private String tipoProcedimientoQuirurgico="";

    public ProcedimientoQuirurgicoDAO(ProcedimientoQuirurgicoVO procedimientoQuirurgicoVO) {
        
        super();
        
        try {
            conection=this.obtenerConexion();
            statement=conection.createStatement();
            
            idProcedimientoQuirurgico=procedimientoQuirurgicoVO.getIdProcedimientoQuirurgico();
            tipoProcedimientoQuirurgico=procedimientoQuirurgicoVO.getTipoPorcedimientoQuirurgico();
            
        } catch (Exception e) {
            
            System.out.println("Error"+e.toString());
        }
        
    }

    @Override
    public boolean agregarRegistro() {
        try {
            query="insert into procedimientoquirurgico (tipoProcedimientoQuirurgico)"
                    +"values '"+tipoProcedimientoQuirurgico+"';";
            statement.executeUpdate(query);
            operacion=true;
        } catch (Exception e) {
            System.out.println("Error"+e.toString());
        }
        return operacion;
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
