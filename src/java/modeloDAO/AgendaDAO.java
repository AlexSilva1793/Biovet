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
    public ArrayList consultarGeneral() {
        ArrayList<AgendaVO> agendaArray = new ArrayList<>();
        try {
            query = "SELECT * FROM agenda";
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                AgendaVO agendaTmp = new AgendaVO();

                agendaTmp.setIdAgenda(resultSet.getString(1));
                agendaTmp.setFechaAgenda(resultSet.getString(2));
                agendaTmp.setFkServicio(resultSet.getString(3));
                agendaTmp.setFkMascota(resultSet.getString(4));
                agendaTmp.setFkEstadoAgenda(resultSet.getString(5));
                System.out.println(agendaTmp);
                agendaArray.add(agendaTmp);

            }
        } catch (Exception e) {
            System.out.println("Error al consultar Agenda " + e.toString());
        }
        return agendaArray;
    }

    @Override
    public ArrayList consultarRegistro() {

        ArrayList<AgendaVO> agendaArray = new ArrayList<>();
        try {
            query = "SELECT * FROM agenda WHERE fechaAgenda = '" + fechaAgenda + "');"; //1 Seria Activa, 2 Seria En Proceso, 3 Seria Cancelada
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                AgendaVO agendaTmp = new AgendaVO();

                agendaTmp.setIdAgenda(resultSet.getString(1));
                agendaTmp.setFechaAgenda(resultSet.getString(2));
                agendaTmp.setFkServicio(resultSet.getString(3));
                agendaTmp.setFkMascota(resultSet.getString(4));
                agendaTmp.setFkEstadoAgenda(resultSet.getString(5));
                System.out.println(agendaTmp);
                agendaArray.add(agendaTmp);

            }
        } catch (Exception e) {
            System.out.println("Error al consultar la Agenda " + e.toString());
        }
        return agendaArray;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            query = "UPDATE agenda SET fechaAgenda = '" + fechaAgenda + "'"
                    + "WHERE idAgenda = '" + idAgenda + "';";
            statement.executeUpdate(query);
            operacion = true;

        } catch (Exception e) {
            System.out.println("Error al actualizar la agenda " + e.toString());
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
            System.out.println("Error al cancelar la cita " + e.toString());
        }
        return operacion;
    }

}
