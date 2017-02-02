/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Modelo.Usuario;
import java.util.Iterator;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;

/**
 *
 * @author sergio.dorneles
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UsuarioControllerTest {

    public UsuarioControllerTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of listaUnicoUsuario method, of class UsuarioController.
     */
    @Test
    public void atestListaUnicoUsuario() {
        System.out.println("Testando listaUnicoUsuario");
        String texto = "admin";
        Usuario result = new UsuarioController().listaUnicoUsuario(texto);
        if (result != null) {
            assertTrue(true);
            System.out.println(result.getNome() + " - " + result.getSobrenome() + " - " + result.getUsuario());
        } else {
            assertTrue(false);
        }
        System.out.println("Fim do teste listaUnicoUsuario");
    }

    /**
     * Test of listaUsuarios method, of class UsuarioController.
     */
    @Test
    public void btestListaUsuarios() {
        System.out.println("Testando listaUsuario");
        String texto = "%";
        List result = new UsuarioController().listaUsuarios(texto);
        if (result != null && result.size() > 0) {
            assertTrue(true);
            Iterator it = result.iterator();
            while (it.hasNext()) {
                Usuario usuario = (Usuario) it.next();
                System.out.println(usuario.getNome() + " - " + usuario.getSobrenome() + " - " + usuario.getUsuario());
            }
        } else {
            assertTrue(false);
        }
        System.out.println("Fim do teste listaUsuario");
    }

    /**
     * Test of listaTodosUsuarios method, of class UsuarioController.
     */
    @Test
    public void ctestListaTodosUsuarios() {
        System.out.println("Testando listaTodosUsuario");
        List result = new UsuarioController().listaTodosUsuarios();
        if (result != null && result.size() > 0) {
            assertTrue(true);
            Iterator it = result.iterator();
            while (it.hasNext()) {
                Usuario usuario = (Usuario) it.next();
                System.out.println(usuario.getNome() + " - " + usuario.getSobrenome() + " - " + usuario.getUsuario());
            }
        } else {
            assertTrue(false);
        }
        System.out.println("Fim do teste listaTodosUsuario");
    }

    /**
     * Test of salvarUsuario method, of class UsuarioController.
     */
    @Test
    public void dtestSalvaUsuario() {
        System.out.println("Testando salvarUsuario");
        String nome = "Teste";
        String sobrenome = "Teste";
        String funcao = "Motorista";
        String telefone = "11112222";
        String email = "teste@teste.com";
        String username = "testeX";
        String senha = "testeX";
        String dataNascimento = "21/12/1983";
        String setor = "teste";
        String observacao = "testetesteteste";
        String expResult = "Usuário salvo com sucesso";
        String result = new UsuarioController().salvaUsuario(nome, sobrenome, funcao, telefone, email, username, senha, dataNascimento, setor, observacao);
        assertEquals(expResult, result);
        System.out.println("Fim do teste salvarUsuario");
    }

    /**
     * Test of removeUsuario method, of class UsuarioController.
     */
    @Test
    public void etestRemoveUsuario() {
        System.out.println("Testando removeUsuario");
        String expResult = "Usuário removido com sucesso";
        String result = new UsuarioController().removeUsuario("TesteX");
        assertEquals(expResult, result);
        System.out.println("Fim do teste removeUsuario");
    }

    @Test
    public void ftestDimiteUsuario() {
        System.out.println("Testando demiteUsuario");
        String expResult = "Usuário atualizado com sucesso";
        String result = new UsuarioController().demiteUsuario("admin4");
        assertEquals(expResult, result);
        System.out.println("Fim do teste removeUsuario");
    }

    @Test
    public void gtestLogin() {
        System.out.println("Testando login");
        int expResult = 0;
        int result = new UsuarioController().login("admin", "admin");
        assertEquals(expResult, result);
        System.out.println(result);
        System.out.println("Fim do teste login");
    }

    @Test
    public void htestListaTodosUsuariosAtivos() {
        System.out.println("Testando listaTodosUsuarioAtivos");
        List result = new UsuarioController().listaTodosUsuariosAtivos();
        if (result != null && result.size() > 0) {
            assertTrue(true);
            Iterator it = result.iterator();
            while (it.hasNext()) {
                Usuario usuario = (Usuario) it.next();
                System.out.println(usuario.getNome() + " - " + usuario.getSobrenome() + " - " + usuario.getUsuario());
            }
        } else {
            assertTrue(false);
        }
        System.out.println("Fim do teste listaTodosUsuarioAtivos");
    }

}
