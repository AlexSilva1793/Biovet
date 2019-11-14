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
import modeloVO.AgendaVO;
import util.ConexionBD;
import util.InterfaceCrud;

public class AgendaDAO extends ConexionBD implements InterfaceCrud {

    private Connection conection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    private String query = null;
    private boolean operacion = false;

    private String idAgenda = "";
    private String fechaAgenda = "";
    private String fkServicio = "";
    private String fkMascota = "";
    private String fkEstadoAgenda = "";

    public AgendaDAO(AgendaVO agendaVO) {

        super();

        try {
            conection = this.obtenerConexion();
            statement = conection.createStatement();

            idAgenda = agendaVO.getIdAgenda();
            fechaAgenda = agendaVO.getFechaAgenda();
            fkServicio = agendaVO.getFkServicio();
            fkMascota = agendaVO.getFkMascota();
            fkEstadoAgenda = agendaVO.getFkEstadoAgenda();

        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }

    }

    @Override
    public boolean agregarRegistro() {

        try {
            query = "INSERT INTO agenda (fechaAgenda, fkServicio, fkMascota, fkEstadoAgenda) "
                    + "VALUES ('" + fechaAgenda + "','" + fkServicio + "','" + fkMascota + "','" + fkEstadoAgenda + "');";
            statement.executeUpdate(query);
            operacion = true;

        } catch (Exception e) {
            System.out.println("Error al registrar Agenda" + e.toString());
        }
        return operacion;
    }

    @Override
    public ArrayList consultarRegistro() {
        ArrayList<AgendaVO> agendaVO = new ArrayList<>();
        try {
            //El query a continuación se puede reducir todo a una sola linea con una vista
            query = "SELECT agenda.idAgenda, agenda.fechaAgenda, mascota.nombreMascota, servicio.descripcionServicio, usuario.nombreUsuario "
                    + "FROM agenda "
                    + "INNER JOIN mascota ON agenda.fkMascota "
                    + "INNER JOIN servicio ON agenda.fkServicio = servicio.idServicio = mascota.idMascota "
                    + "INNER JOIN usuario ON mascota.fkUsuario = usuario.idUsuario "
                    + "WHERE agenda.fechaAgenda = '" + fechaAgenda + "' AND agenda.fkEstadoAgenda IN ( '" + 1 + "','" + 2 + "');"; //1 Seria Activa, 2 Seria En Proceso, 3 Seria Cancelada
            statement.executeUpdate(query);
            operacion = true;

        } catch (Exception e) {
            System.out.println("No existen agendas para esta fecha" + e.toString());
        }
        return agendaVO;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            query = "UPDATE agenda SET fechaAgenda = '" + fechaAgenda + "'"
                    + "WHERE idAgenda = '" + idAgenda + "';";
            statement.executeUpdate(query);
            operacion = true;

        } catch (Exception e) {
            System.out.println("Error al actualizar la agenda" + e.toString());
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {

        try {
            query = "UPDATE agenda SET fkEstadoAgenda = '" + 3 + "' WHERE idAgenda = '" + idAgenda + "';";
            statement.executeUpdate(query);
            operacion = true;
        } catch (Exception e) {
            System.out.println("Error al cancelar la cita" + e.toString());
        }
        return operacion;
    }

    @Override
    public ArrayList consultarGeneral() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
