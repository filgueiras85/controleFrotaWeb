package Listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author sergio.dorneles
 */
@WebListener
public class ListenerSessao implements HttpSessionListener, HttpSessionAttributeListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("Sessão criada!");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("Sessão removida!");
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        System.out.println("Atributo adicionado à sessão!");
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        System.out.println("Atributo removido à sessão!");
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
        System.out.println("Atributo substituido à sessão!");
    }
}
