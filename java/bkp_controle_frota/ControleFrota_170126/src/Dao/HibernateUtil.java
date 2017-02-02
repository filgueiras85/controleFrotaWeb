/*
 * TRIBUNAL REGIONAL DO TRABALHO DA 1ª REGIÃO - RIO DE JANEIRO
 * SECRETARIA DE SOLUÇÕES EM TECNOLOGIA DA INFORMAÇÃO - SST
 * COORDENADORIA DE ANÁLISES E SOLUÇÕES - COAS
 * DIVISÃO DE ANÁLISE E PROJETO - DIANP
 */
package Dao;

import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author Sergio Dorneles (sergio.dorneles@trt1.jus.br)
 */
public class HibernateUtil {

    private static final SessionFactory sessionFactory;
    
    static {
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
