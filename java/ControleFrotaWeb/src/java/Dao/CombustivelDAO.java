/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Combustivel;
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
public class CombustivelDAO {

    public List recuperarTodosCombustiveis() {
        try {
            List combustiveis = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Combustivel");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Combustivel combustivel = (Combustivel) iter.next();
                combustiveis.add(combustivel);
            }
            tx.commit();
            return combustiveis;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public int recuperarCombustivelId(String texto) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Combustivel c where lower(c.txtCombustivel) = lower('" + texto + "')");
            Combustivel combustivel = (Combustivel) q.uniqueResult();
            tx.commit();
            return combustivel.getIdCombustivel();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public String recuperarCombustivelTxt(int id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Combustivel f where f.idCombustivel = " + id);
            Combustivel combustivel = (Combustivel) q.uniqueResult();
            tx.commit();
            return combustivel.getTxtCombustivel();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            return "Erro";
        }
    }

}
