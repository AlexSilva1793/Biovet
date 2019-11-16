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
import modeloVO.HistoriaClinicaVO;
import util.ConexionBD;
import util.InterfaceCR;

public class HistoriaClinicaDAO extends ConexionBD implements InterfaceCR {

    private Connection conection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    private String query = null;
    private boolean operacion = false;

    private String idHistoriaClinica = "";
    private String fechaApertura = "";
    private String fkMascota = "";

    public HistoriaClinicaDAO(HistoriaClinicaVO historiaClinicaVO) {

        try {

            conection = this.obtenerConexion();
            statement = conection.createStatement();

            idHistoriaClinica = historiaClinicaVO.getIdHistoriaClinica();
            fechaApertura = historiaClinicaVO.getFechaApertura();
            fkMascota = historiaClinicaVO.getFkMascota();

        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }

    }

    @Override
    public boolean agregarRegistro() {
        try {
            query = "INSERT INTO historiaclinica (fechaApertura, fkMascota) VALUES ('" + fechaApertura + "', '" + fkMascota + "');";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("Error al registrar la nueva historia clinica");
        }
        return operacion;
    }

    @Override
    public ArrayList consultarRegistro() {
        ArrayList<HistoriaClinicaVO> historiaClinicaVOs = new ArrayList<>();
        try {
            query = "SELECT historiaclinica.idHistoriaClinica, historiaclinica.fechaApertura, historiaclinica.fkMascota, mascota.nombreMascota, usuario.nombreUsuario, usuario.apellidoUsuario"
                  + "FROM historiaclinica "
                  + "INNER JOIN mascota ON historiaclinica.fkMascota = mascota.idMascota "
                  + "INNER JOIN usuario ON mascota.fkUsuario = usuario.idUsuario "
                  + "WHERE idHistoriaClinica = '"+idHistoriaClinica+"';";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("No existe historia clinica relacionada" + e.toString());
        }
        return historiaClinicaVOs;
    }

}
