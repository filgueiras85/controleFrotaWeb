package Controller;

import Dao.RevisaoDAO;
import Dao.UsuarioDAO;
import Dao.VeiculoDAO;
import Model.Revisao;
import Model.Usuario;
import Model.Veiculo;
import java.util.List;

/**
 *
 * @author sergio.dorneles
 */
public class RevisaoController {

    public Revisao listaUnicaRevisao(String texto) {
        Revisao revisao = new RevisaoDAO().recuperarUnicaRevisao(texto);
        return revisao;
    }

    public List listaRevisoesPorUsuario(String texto) {
        Usuario usuario = new UsuarioDAO().recuperarUnicoUsuario(texto);
        List revisoes = new RevisaoDAO().recuperarRevisoesPorUsuario(Integer.toString(usuario.getIdUsuario()));
        return revisoes;
    }

    public List listaRevisoesPorVeiculo(String placa) {
        Veiculo veiculo = new VeiculoDAO().recuperarUnicoVeiculo(placa);
        List revisoes = new RevisaoDAO().recuperarRevisoesPorVeiculo(Integer.toString(veiculo.getIdVeiculo()));
        return revisoes;
    }

    public List listaTodasRevisoes() {
        List revisoes = new RevisaoDAO().recuperarTodasRevisoes();
        return revisoes;
    }

//    public String salvarRevisao(Revisao revisao) {
//        try {
//            Session session = HibernateUtil.getSessionFactory().openSession();
//            Transaction tx = session.beginTransaction();
//            session.saveOrUpdate(revisao);
//            tx.commit();
//            return "Revisão salva com sucesso";
//        } catch (HibernateException he) {
//            return "Revisão já existe!";
//        }
//    }
    public String removeRevisao(String id) {
        Revisao revisao = this.listaUnicaRevisao(id);
        String resultado = new RevisaoDAO().deletarRevisao(revisao);
        return resultado;
    }

//    public String atualizarRevisao(String id) {
//        Revisao revisao = this.listaUnicaRevisao(id);
//        String resultado = new UsuarioDAO().atualizarUsuario(usuario);
//        return resultado;
//    }
    public List listaTodasRevisoesNaoFinalizadas() {
        List revisoes = new RevisaoDAO().recuperarTodasRevisoesNaoFinalizadas();
        return revisoes;
    }

    public List listaTodasRevisoesFinalizadas() {
        List revisoes = new RevisaoDAO().recuperarTodasRevisoesFinalizadas();
        return revisoes;
    }

    public List listaTodasRevisoesNaoFinalizadasPorUsuario(String texto) {
        Usuario usuario = new UsuarioDAO().recuperarUnicoUsuario(texto);
        List revisoes = new RevisaoDAO().recuperarTodasRevisoesNaoFinalizadasPorUsuario(Integer.toString(usuario.getIdUsuario()));
        return revisoes;
    }

    public List listaTodasRevisoesFinalizadasPorUsuario(String texto) {
        Usuario usuario = new UsuarioDAO().recuperarUnicoUsuario(texto);
        List revisoes = new RevisaoDAO().recuperarTodasRevisoesFinalizadasPorUsuario(Integer.toString(usuario.getIdUsuario()));
        return revisoes;
    }

    public List listaTodasRevisoesNaoFinalizadasPorVeiculo(String placa) {
        Veiculo veiculo = new VeiculoDAO().recuperarUnicoVeiculo(placa);
        List revisoes = new RevisaoDAO().recuperarTodasRevisoesNaoFinalizadasPorVeiculo(Integer.toString(veiculo.getIdVeiculo()));
        return revisoes;
    }

    public List listaTodasRevisoesFinalizadasPorVeiculo(String placa) {
        Veiculo veiculo = new VeiculoDAO().recuperarUnicoVeiculo(placa);
        List revisoes = new RevisaoDAO().recuperarTodasRevisoesFinalizadasPorVeiculo(Integer.toString(veiculo.getIdVeiculo()));
        return revisoes;
    }
}
