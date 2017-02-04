package Controller;

import Dao.FuncaoDAO;
import Model.Funcao;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author sergio.dorneles
 */
public class FuncaoController {

    public List listaTodasFuncoes() {
        return new FuncaoDAO().recuperarTodasFuncoes();
    }

    public HashMap listaFuncoesHashMap() {
        List funcoes = new FuncaoDAO().recuperarTodasFuncoes();
        HashMap mapaFuncoes = new HashMap();
        for (Object o : funcoes) {
            Funcao funcao = (Funcao) o;
            mapaFuncoes.put(funcao.getIdFuncao(), funcao.getTxtFuncao());
        }
        return mapaFuncoes;
    }

    public int listaFuncaoId(String texto) {
        return new FuncaoDAO().recuperarFuncaoId(texto);
    }
    
    public String listaFuncaoTxt(int id) {
        return new FuncaoDAO().recuperarFuncaoTxt(id);
    }
}
