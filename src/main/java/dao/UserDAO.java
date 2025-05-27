package dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import model.User;
import util.HibernateUtil;

public class UserDAO {
    SessionFactory sessionFactory;

    public UserDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    public User findById(long id) {
        Session session = sessionFactory.openSession();
        User p = session.get(User.class, id);
        session.close();
        return p;
    }

    public boolean create(User p) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.persist(p);
            tx.commit();
            success = true;
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
            throw e;
        } finally {
            session.close();
        }
        return success;
    }

    public boolean update(Long id, String email, String password, String nom, String prenom) {
        Session session = sessionFactory.openSession();
        User p = session.get(User.class, id);
        boolean success = false;
        if (p != null) {
            p.setEmail(email);
            p.setPassword(password);
            p.setNom(nom);
            p.setPrenom(prenom);
            
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.persist(p);
                tx.commit();
                success = true;
            } catch (Exception e) {
                if (tx != null)
                    tx.rollback();
                throw e;
            } finally {
                session.close();
            }
        }
        return success;
    }

    public boolean delete(long id) {
        Session session = sessionFactory.openSession();
        User p = session.get(User.class, id); // Correction ici
        boolean success = false;
        if (p != null) {
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.remove(p);
                tx.commit();
                success = true;
            } catch (Exception e) {
                if (tx != null)
                    tx.rollback();
                throw e;
            } finally {
                session.close();
            }
        }
        return success;
    }

    public List<User> findAll() {
        Session session = sessionFactory.openSession();
        List<User> result = session.createQuery("from User", User.class).getResultList(); // Correction ici
        session.close();
        return result;
    }
    
    public User findByEmailAndPassword(String email, String password) {
        Session session = sessionFactory.openSession();
        String hql = "FROM User WHERE email = :email AND password = :password";
        User user = session.createQuery(hql, User.class)
                           .setParameter("email", email)
                           .setParameter("password", password)
                           .uniqueResult();
        session.close();
        return user;
    }
    
    
}
