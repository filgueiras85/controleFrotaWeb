package Controller;

import Dao.TipoVeiculoDAO;
import java.util.List;

/**
 *
 * @author sergio.dorneles
 */
public class TipoVeiculoController {
    
    public List listaTodosTiposVeiculo() {
        return new TipoVeiculoDAO().recuperarTodosTiposVuiculo();
    }

    public int listaTipoVeiculoId(String tipoVeiculo) {
        return new TipoVeiculoDAO().recuperarTipoVuiculoId(tipoVeiculo);
    }
    
    public String listaTipoVeiculoTxt(int tipoVeiculo) {
        return new TipoVeiculoDAO().recuperarTipoVuiculoTxt(tipoVeiculo);
    }
    
}
