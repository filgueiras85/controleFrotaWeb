/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.TipoVeiculo;
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
public class TipoVeiculoDAO {

    public List recuperarTodosTiposVuiculo() {
        try {
            List tiposVeiculo = new ArrayList<>();
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from TipoVeiculo");
            Iterator iter = q.iterate();
            while (iter.hasNext()) {
                TipoVeiculo tipoVeiculo = (TipoVeiculo) iter.next();
                tiposVeiculo.add(tipoVeiculo);
            }
            tx.commit();
            return tiposVeiculo;
        } catch (HibernateException e) {
            e.getMessage();
            return null;
        }
    }

    public int recuperarTipoVuiculoId(String texto) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from TipoVeiculo t where lower(t.txtTipo) = lower('" + texto + "')");
            TipoVeiculo tipoVeiculo = (TipoVeiculo) q.uniqueResult();
            tx.commit();
            return tipoVeiculo.getIdTipoVeiculo();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public String recuperarTipoVuiculoTxt(int texto) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from TipoVeiculo t where t.idTipoVeiculo = " + texto);
            TipoVeiculo tipoVeiculo = (TipoVeiculo) q.uniqueResult();
            tx.commit();
            return tipoVeiculo.getTxtTipo();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            return "Erro";
        }
    }

}
