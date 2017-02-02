package Controller;

import Modelo.Funcao;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author sergio.dorneles
 */
public class FuncaoControllerTest {

    public FuncaoControllerTest() {
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
     * Test of listaTodasFuncoes method, of class FuncaoController.
     */
    @Test
    public void testListaTodasFuncoes() {
        System.out.println("Testando listaTodasFuncoes");
        int expResult = 4;
        List result = new FuncaoController().listaTodasFuncoes();
        Iterator it = result.iterator();
        while (it.hasNext()) {
            Funcao funcao = (Funcao) it.next();
            System.out.println(funcao.getIdFuncao() + " - " + funcao.getTxtFuncao());
        }

        assertTrue(result.size() == expResult);
    }

    /**
     * Test of listaFuncoesHashMap method, of class FuncaoController.
     */
    @Test
    public void testListaFuncoesHashMap() {
        System.out.println("Testando listaFuncoesHashMap");
        HashMap expResult = new HashMap();

        expResult.put(0, "Gerente");
        expResult.put(1, "Mecânico");
        expResult.put(2, "Porteiro");
        expResult.put(3, "Motorista");
        FuncaoController instance = new FuncaoController();
        HashMap result = instance.listaFuncoesHashMap();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("listaFuncoesHashMap() falhou");
    }

    /**
     * Test of listaFuncaoId method, of class FuncaoController.
     */
    @Test
    public void testListaFuncaoId() {
        System.out.println("Testando listaFuncaoId");
        String texto = "Motorista";
        FuncaoController instance = new FuncaoController();
        int expResult = 3;
        int result = instance.listaFuncaoId(texto);
        assertEquals(expResult, result);
    }

}
