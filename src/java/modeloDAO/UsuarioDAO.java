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
import modeloVO.UsuarioVO;
import util.ConexionBD;
import util.InterfaceCrud;

/**
 *
 * @author master
 */
public class UsuarioDAO extends ConexionBD implements InterfaceCrud {

    private Connection conection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    private String query = null;
    private boolean operacion = false;

    private String idUsuario = "", cedula = "", nombreUsuario = "", apellidoUsuario = "", contraseñaUsuario = "", direccion = "", celular = "", telefonoFijo = "", correoUsuario = "", estadoUsuario = "", fkTipoDocu = "", fkRol = "", fkGenero = "";

    public UsuarioDAO(UsuarioVO usuVO) {
        super();
        try {
            conection = this.obtenerConexion();
            statement = conection.createStatement();
            
            idUsuario = usuVO.getIdUsuario();
            cedula = usuVO.getCedula();
            nombreUsuario = usuVO.getNombreUsuario();
            apellidoUsuario=usuVO.getApellidoUsuario();
            contraseñaUsuario=usuVO.getContraseñaUsuario();
            direccion = usuVO.getDireccion();
            celular=usuVO.getCelular();
            telefonoFijo=usuVO.getTelefonoFijo();
            correoUsuario=usuVO.getCorreoUsuario();
            estadoUsuario=usuVO.getEstadoUsuario();
            fkTipoDocu=usuVO.getFkTipoDocu();
            fkRol=usuVO.getFkRol();
            fkGenero=usuVO.getFkGenero();
            
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            query="INSERT INTO `Usuario` (`idUsuario`, `cedula`, `nombreUsuario`, `apellidoUsuario`, `correoUsuario`, `contraseñaUsuario`, `fkTipoDocu`, `Rol_idRol`) VALUES (NULL, '" + cedula + "','" + nombreUsuario + "','" + apellidoUsuario + "','"+correoUsuario+"," + contraseñaUsuario + "','" + fkTipoDocu + "', '3')";
            statement.executeUpdate(query);
            operacion=true;
        } catch (Exception e) {
            System.out.println("Error al registrar Usuario" + e.toString());
        }
        return operacion;
    }

    @Override
    public ArrayList<UsuarioVO> consultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     @Override
    public ArrayList consultarGeneral() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   

}
