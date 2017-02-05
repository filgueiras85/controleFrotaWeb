package Dao;

import Model.Veiculo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author sergio.dorneles
 */
public class VeiculoDAO {

    public Veiculo recuperarUnicoVeiculo(String placa) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Veiculo p where lower(p.placa) = lower('" + placa + "')");
            Veiculo veiculo = (Veiculo) q.uniqueResult();
            tx.commit();
            return veiculo;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodosVeiculos() {
        try {
            List veiculos = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Veiculo");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Veiculo veiculo = (Veiculo) iter.next();
                veiculos.add(veiculo);
            }
            tx.commit();
            return veiculos;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodosVeiculosAtivos() {
        try {
            List veiculos = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Veiculo u where u.dataExclusao is null");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Veiculo veiculo = (Veiculo) iter.next();
                veiculos.add(veiculo);
            }
            tx.commit();
            return veiculos;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodosVeiculosInativos() {
        try {
            List veiculos = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Veiculo u where u.dataExclusao is not null");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Veiculo veiculo = (Veiculo) iter.next();
                veiculos.add(veiculo);
            }
            tx.commit();
            return veiculos;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodosVeiculosLiberados() {
        try {
            List veiculos = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Veiculo u where lower(u.bloqueado) = 'n'");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Veiculo veiculo = (Veiculo) iter.next();
                veiculos.add(veiculo);
            }
            tx.commit();
            return veiculos;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodosVeiculosBloqueados() {
        try {
            List veiculos = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Veiculo u where lower(u.bloqueado) = 's'");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Veiculo veiculo = (Veiculo) iter.next();
                veiculos.add(veiculo);
            }
            tx.commit();
            return veiculos;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public String salvarVeiculo(Veiculo veiculo) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(veiculo);
            tx.commit();
            return "Veículo salvo com sucesso";
        } catch (HibernateException he) {
            return "Placa já cadastrada para outro veículo!";
        }
    }

    public String deletarVeiculo(Veiculo veiculo) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.delete(veiculo);
            tx.commit();
            return "Veículo removido com sucesso";
        } catch (HibernateException he) {
            return he.getMessage();
        }
    }

    public String atualizarVeiculo(Veiculo veiculo) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.update(veiculo);
            tx.commit();
            return "Veículo atualizado com sucesso";
        } catch (HibernateException he) {
            return he.getMessage();
        }
    }

}
