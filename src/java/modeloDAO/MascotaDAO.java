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
import modeloVO.MascotaVO;
import util.ConexionBD;
import util.InterfaceCrud;

/**
 *
 * @author Usuario
 */
public class MascotaDAO extends ConexionBD implements InterfaceCrud {

    private Connection conection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    private String query = null;
    private boolean operacion = false;

    private String idMascota = "";
    private String nombreMascota = "";
    private String fechaNacimiento = "";
    private String fkUsuario = "";
    private String fkRaza = "";
    private String fkGenero = "";
    private String colorMascota = "";

    public MascotaDAO(MascotaVO mascotaVO) {
        super();

        try {
            conection = this.obtenerConexion();
            statement = conection.createStatement();

            idMascota = mascotaVO.getIdMascota();
            nombreMascota = mascotaVO.getNombreMascota();
            fechaNacimiento = mascotaVO.getFechaNacimiento();
            fkUsuario = mascotaVO.getFkUsuario();
            fkRaza = mascotaVO.getFkRaza();
            fkGenero = mascotaVO.getFkGenero();
            colorMascota = mascotaVO.getColorMascota();

        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }

    }

    @Override
    public boolean agregarRegistro() {
        try {
            query = "insert into mascota (NombreMascota, FechaNacimiento, fkUsuario, fkRaza, fkGenero, ColorMascota)"
                    + "values('" + nombreMascota + "','" + fechaNacimiento + "','" + fkUsuario + "','" + fkRaza + "','" + fkGenero + "','" + colorMascota + "');";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return operacion;
    }

    @Override
    public ArrayList consultarRegistro(String identificador) {
        ArrayList<MascotaVO> mascotaVO = new ArrayList<>();
        try {
            query = "select * from mascota where fkUsuario='" + fkUsuario + "';";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return mascotaVO;
    }

    @Override
    public boolean actualizarRegistro() {

        try {
            query = "update mascota set nombreMascota='" + nombreMascota + "',fechaNacimiento='" + fechaNacimiento + "',"
                    + "fkUsuario=´" + fkRaza + "',fkGenero='" + fkGenero + "',ColorMascota='" + colorMascota + "';";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }

        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            query = "delete from mascota where idMascota='" + idMascota + "';";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return operacion;
    }

    @Override
    public ArrayList consultarGeneral() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
