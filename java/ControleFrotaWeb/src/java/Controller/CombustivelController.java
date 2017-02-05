/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CombustivelDAO;
import java.util.List;

/**
 *
 * @author sergio.dorneles
 */
public class CombustivelController {
    
    public List listaTodosCombustiveis() {
        return new CombustivelDAO().recuperarTodosCombustiveis();
    }

    public int listaCombustivelId(String combustivel) {
        return new CombustivelDAO().recuperarCombustivelId(combustivel);
    }
    
    public String listaCombustivelTxt(int combustivelId) {
        return new CombustivelDAO().recuperarCombustivelTxt(combustivelId);
    }
}
