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
            query = "insert into Mascota (NombreMascota, FechaNacimiento, fkUsuario, fkRaza, fkGenero, ColorMascota,estadoMascota)"
                    + "values('" + nombreMascota + "','" + fechaNacimiento + "','" + fkUsuario + "','" + fkRaza + "','" + fkGenero + "','" + colorMascota + "',1);";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return operacion;
    }

    @Override
    public ArrayList<MascotaVO> consultarRegistro() {
        ArrayList<MascotaVO> mascotArray = new ArrayList<>();
        try {
            query = "select * from mascota where fkUsuario='" + fkUsuario + "';";
            resultSet=statement.executeQuery(query);
            while (resultSet.next()){
                
                MascotaVO mascotaTemp=new MascotaVO();
                
                mascotaTemp.setIdMascota(resultSet.getString(1));
                mascotaTemp.setNombreMascota(resultSet.getString(2));
                mascotaTemp.setFechaNacimiento(resultSet.getString(3));
                mascotaTemp.setFkUsuario(resultSet.getString(4));
                mascotaTemp.setFkRaza(resultSet.getString(5));
                mascotaTemp.setFkGenero(resultSet.getString(6));
                mascotaTemp.setColorMascota(resultSet.getString(7));
                mascotaTemp.setEstadoMascota(resultSet.getString(8));
                System.out.println(mascotaTemp);
                mascotArray.add(mascotaTemp);
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return mascotArray;
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
        ArrayList<MascotaVO> mascotArray = new ArrayList<>();
        try {
            query = "select * from mascota;";
            resultSet=statement.executeQuery(query);
            while (resultSet.next()){
                
                MascotaVO mascotaTemp=new MascotaVO();
                
                mascotaTemp.setIdMascota(resultSet.getString(1));
                mascotaTemp.setNombreMascota(resultSet.getString(2));
                mascotaTemp.setFechaNacimiento(resultSet.getString(3));
                mascotaTemp.setFkUsuario(resultSet.getString(4));
                mascotaTemp.setFkRaza(resultSet.getString(5));
                mascotaTemp.setFkGenero(resultSet.getString(6));
                mascotaTemp.setColorMascota(resultSet.getString(7));
                mascotaTemp.setEstadoMascota(resultSet.getString(8));
                System.out.println(mascotaTemp);
                mascotArray.add(mascotaTemp);
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return mascotArray;
    }

}
