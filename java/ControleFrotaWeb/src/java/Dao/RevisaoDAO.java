package Dao;

import Model.Revisao;
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
public class RevisaoDAO {

    public Revisao recuperarUnicaRevisao(String texto) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Revisao p where p.idRevisao =" +  texto);
            Revisao revisao = (Revisao) q.uniqueResult();
            tx.commit();
            return revisao;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarRevisoesPorUsuario(String texto) {
        try {
            List revisoes = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Revisao p where p.idUsuario = " + texto);
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Revisao revisao = (Revisao) iter.next();
                revisoes.add(revisao);
            }
            tx.commit();
            return revisoes;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarRevisoesPorVeiculo(String texto) {
        try {
            List revisoes = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Revisao p where p.idVeiculo = " + texto);
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Revisao revisao = (Revisao) iter.next();
                revisoes.add(revisao);
            }
            tx.commit();
            return revisoes;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodasRevisoes() {
        try {
            List revisoes = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Revisao");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Revisao revisao = (Revisao) iter.next();
                revisoes.add(revisao);
            }
            tx.commit();
            return revisoes;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public String salvarRevisao(Revisao revisao) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(revisao);
            tx.commit();
            return "Revisão salva com sucesso";
        } catch (HibernateException he) {
            return "Revisão já existe!";
        }
    }

    public String deletarRevisao(Revisao revisao) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.delete(revisao);
            tx.commit();
            return "Revisão removida com sucesso";
        } catch (HibernateException he) {
            return he.getMessage();
        }
    }

    public String atualizarRevisao(Revisao revisao) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.update(revisao);
            tx.commit();
            return "Revisão atualizado com sucesso";
        } catch (HibernateException he) {
            return he.getMessage();
        }
    }

    public List recuperarTodasRevisoesNaoFinalizadas() {
        try {
            List revisoes = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Revisao u where u.concluida is null");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Revisao revisao = (Revisao) iter.next();
                revisoes.add(revisao);
            }
            tx.commit();
            return revisoes;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodasRevisoesFinalizadas() {
        try {
            List revisoes = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Revisao u where u.concluida is not null");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Revisao revisao = (Revisao) iter.next();
                revisoes.add(revisao);
            }
            tx.commit();
            return revisoes;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodasRevisoesNaoFinalizadasPorUsuario(String texto) {
        try {
            List revisoes = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Revisao u where u.concluida is null and u.idUsuario = " + texto);
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Revisao revisao = (Revisao) iter.next();
                revisoes.add(revisao);
            }
            tx.commit();
            return revisoes;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodasRevisoesFinalizadasPorUsuario(String texto) {
        try {
            List revisoes = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Revisao u where u.concluida is not null and u.idUsuario = " + texto);
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Revisao revisao = (Revisao) iter.next();
                revisoes.add(revisao);
            }
            tx.commit();
            return revisoes;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodasRevisoesNaoFinalizadasPorVeiculo(String texto) {
        try {
            List revisoes = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Revisao u where u.concluida is null and u.idVeiculo = " + texto);
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Revisao revisao = (Revisao) iter.next();
                revisoes.add(revisao);
            }
            tx.commit();
            return revisoes;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodasRevisoesFinalizadasPorVeiculo(String texto) {
        try {
            List revisoes = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Revisao u where u.concluida is not null and u.idVeiculo = " + texto);
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Revisao revisao = (Revisao) iter.next();
                revisoes.add(revisao);
            }
            tx.commit();
            return revisoes;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

}
