package Dao;

import Modelo.Veiculo;
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
    
}
