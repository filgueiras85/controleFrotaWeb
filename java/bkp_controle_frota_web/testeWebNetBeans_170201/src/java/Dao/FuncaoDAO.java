/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Funcao;
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
public class FuncaoDAO {

    public List recuperarTodasFuncoes() {
        try {
            List funcoes = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Funcao");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                Funcao funcao = (Funcao) iter.next();
                funcoes.add(funcao);
            }
            tx.commit();
            return funcoes;
        } catch (Exception e) {
            e.getMessage();
            return null;
        }
    }

    public int recuperarFuncaoId(String texto) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Funcao f where lower(f.txtFuncao) = lower('" + texto + "')");
            Funcao funcao = (Funcao) q.uniqueResult();
            tx.commit();
            return funcao.getIdFuncao();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
}
