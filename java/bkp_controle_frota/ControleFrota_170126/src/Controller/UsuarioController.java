/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UsuarioDAO;
import Modelo.Usuario;
import java.util.List;

/**
 *
 * @author sergio.dorneles
 */
public class UsuarioController {

    public Usuario listaUnicoUsuario(String texto) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.recuperarUnicoUsuario(texto);
        return usuario;
    }

    public List listaUsuarios(String texto) {
//todo

    }

    public List listaTodosUsuarios() {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List usuarios = usuarioDAO.recuperarTodosUsuarios();
        return usuarios;
    }

    public String salvarUsuario(Usuario usuario) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        String resultado = usuarioDAO.salvarUsuario(usuario);
        return resultado;
    }

    public String removeUsuario(Usuario usuario) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        String resultado = usuarioDAO.deletarUsuario(usuario);
        return resultado;
    }
}
