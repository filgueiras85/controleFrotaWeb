package Dao;

import Model.Usuario;
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
public class UsuarioDAO {

    public Usuario recuperarUnicoUsuario(String texto) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Usuario p where lower(p.usuario) = lower('" + texto + "')");
            Usuario usuario = (Usuario) q.uniqueResult();
            tx.commit();
            return usuario;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarUsuarios(String texto) {
        try {
            List usuarios = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Usuario p where lower(p.usuario) like lower('%" + texto + "%')");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Usuario usuario = (Usuario) iter.next();
                usuarios.add(usuario);
            }
            tx.commit();
            return usuarios;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodosUsuarios() {
        try {
            List usuarios = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Usuario");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Usuario usuario = (Usuario) iter.next();
                usuarios.add(usuario);
            }
            tx.commit();
            return usuarios;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public String salvarUsuario(Usuario usuario) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(usuario);
            tx.commit();
            return "Usuário salvo com sucesso";
        } catch (HibernateException he) {
            return "Nome de usuário já existe!";
        }
    }

    public String deletarUsuario(Usuario usuario) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.delete(usuario);
            tx.commit();
            return "Usuário removido com sucesso";
        } catch (HibernateException he) {
            return he.getMessage();
        }
    }

    public String atualizarUsuario(Usuario usuario) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.update(usuario);
            tx.commit();
            return "Usuário atualizado com sucesso";
        } catch (HibernateException he) {
            return he.getMessage();
        }
    }

    public List recuperarTodosUsuariosAtivos() {
        try {
            List usuarios = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Usuario u where u.dataDemissao is null");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Usuario usuario = (Usuario) iter.next();
                usuarios.add(usuario);
            }
            tx.commit();
            return usuarios;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public List recuperarTodosUsuariosInativos() {
        try {
            List usuarios = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Usuario u where u.dataDemissao is not null");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Usuario usuario = (Usuario) iter.next();
                usuarios.add(usuario);
            }
            tx.commit();
            return usuarios;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

}
