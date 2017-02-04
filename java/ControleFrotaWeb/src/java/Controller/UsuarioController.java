package Controller;

import Dao.UsuarioDAO;
import Model.Usuario;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List usuarios = usuarioDAO.recuperarUsuarios(texto);
        return usuarios;
    }

    public List listaTodosUsuarios() {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List usuarios = usuarioDAO.recuperarTodosUsuarios();
        return usuarios;
    }

    public List listaTodosUsuariosAtivos() {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List usuarios = usuarioDAO.recuperarTodosUsuariosAtivos();
        return usuarios;
    }

    public String salvaUsuario(String nome, String sobrenome, String funcao,
            String telefone, String email, String username,
            String senha, String dataNascimento, String observacao) {

        int funcaoInt = new FuncaoController().listaFuncaoId(funcao);
        Usuario usuario = null;
        try {
            usuario = new Usuario(
                    nome,
                    sobrenome,
                    funcaoInt,
                    telefone,
                    email,
                    username,
                    senha,
                    new java.sql.Timestamp(new SimpleDateFormat("dd/MM/yyyy").parse(dataNascimento).getTime()),
                    new java.sql.Timestamp(new Date().getTime()),
                    observacao);
        } catch (ParseException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String resultado = new UsuarioDAO().salvarUsuario(usuario);
        return resultado;
    }

    public String removeUsuario(String username) {
        Usuario usuario = this.listaUnicoUsuario(username);
        String resultado = new UsuarioDAO().deletarUsuario(usuario);
        return resultado;
    }

    public String demiteUsuario(String username) {
        Usuario usuario = this.listaUnicoUsuario(username);
        usuario.setDataDemissao(new java.sql.Timestamp(new Date().getTime()));
        String resultado = new UsuarioDAO().atualizarUsuario(usuario);
        return resultado;
    }

    public String atualizaUsuario(String nome, String sobrenome, String funcao,
            String telefone, String email, String username,
            String senha, String dataNascimento, String observacao) {
        int funcaoInt = new FuncaoController().listaFuncaoId(funcao);
        Usuario usuario = this.listaUnicoUsuario(username);
        try {
            usuario.setDataNascimento(new java.sql.Timestamp(new SimpleDateFormat("dd/MM/yyyy").parse(dataNascimento).getTime()));
            usuario.setEmail(email);
            usuario.setIdFuncao(funcaoInt);
            usuario.setNome(nome);
            usuario.setObservacao(observacao);
            usuario.setSenha(senha);
            usuario.setSobrenome(sobrenome);
            usuario.setTelefone(telefone);
        } catch (ParseException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String resultado = new UsuarioDAO().atualizarUsuario(usuario);
        return resultado;
    }

    public int login(String username, String senha) {
        Usuario usuario = this.listaUnicoUsuario(username);
        if (usuario != null) {
            if (usuario.getUsuario().equals(username) && usuario.getSenha().equals(senha) && usuario.getDataDemissao() == null) {
                return usuario.getIdFuncao();
            } else {
                return -1;
            }
        } else {
            return -1;
        }
    }
}
