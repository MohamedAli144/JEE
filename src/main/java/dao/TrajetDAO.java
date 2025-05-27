 package dao;
 import java.util.List;
 import org.hibernate.Session;
 import org.hibernate.SessionFactory;
 import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.Personne;
import model.Trajet;
import util.HibernateUtil;
 public class TrajetDAO {
 SessionFactory sessionFactory;
 public TrajetDAO() {
 sessionFactory = HibernateUtil.getSessionFactory();
 }
 public Trajet findById(long id) {
 Session session=sessionFactory.openSession();
 Trajet p=session.get(Trajet.class, id);
 session.close();
 return p;
 }
 public boolean create(Trajet p) {
 Session session=sessionFactory.openSession();
 Transaction tx=null;
 boolean success = false;
 try {
 tx = session.beginTransaction();
 session.persist(p);
 tx.commit();
 success=true;
 }
 catch (Exception e) {
 if (tx!=null)
 tx.rollback(); throw e;
 }
 finally { session.close(); }
 return success;
 }
 public boolean update(Long id, java.sql.Date date, String ville_Depart, String destination) {
	 Session session=sessionFactory.openSession();
	 Trajet p=session.get(Trajet.class, id);
	 boolean success = false;
	 if(p!=null) {
	 p.setDate(date);
	 p.setVille_Depart(ville_Depart);
	 p.setDestination(destination);
	 Transaction tx=null;
	 try {
	 tx = session.beginTransaction();
	 session.persist(p);
	 tx.commit();
	 success=true;
	 } catch (Exception e) {
	 if (tx!=null)
	 tx.rollback(); throw e;
	 }
	 finally { session.close(); }
	 }
	 return success;
	 }
 public boolean delete(long id) {
	 Session session=sessionFactory.openSession();
	 Trajet p=session.get(Trajet.class, id);
	 boolean success = false;
	 if(p!=null) {
	 Transaction tx=null;
	 try {
	 tx = session.beginTransaction();
	 session.remove(p);
	 tx.commit();
	 success=true;
	 }
	 catch (Exception e) {
	 if (tx!=null)
	 tx.rollback(); throw e;
	 }
	 finally { session.close(); }
	 }
	 return success;
	 }
 public List<Trajet> findAll(){
 Session session=sessionFactory.openSession();
 List<Trajet> result =
 session.createQuery("from Trajet", Trajet.class).getResultList();
 session.close();
 return result;
 }
 public List<Trajet> findByCriteria(String depart, String destination, java.sql.Date date) {
	    Session session = sessionFactory.openSession();
	    StringBuilder hql = new StringBuilder("from Trajet t where 1=1");

	    if (depart != null && !depart.isEmpty()) {
	        hql.append(" and lower(t.Ville_Depart) like lower(:depart)");
	    }

	    if (destination != null && !destination.isEmpty()) {
	        hql.append(" and lower(t.Destination) like lower(:destination)");
	    }

	    if (date != null) {
	        hql.append(" and t.Date = :date"); // ✅ Suppression de 'str(...)'
	    }

	    Query<Trajet> query = session.createQuery(hql.toString(), Trajet.class);

	    if (depart != null && !depart.isEmpty()) {
	        query.setParameter("depart", "%" + depart + "%");
	    }

	    if (destination != null && !destination.isEmpty()) {
	        query.setParameter("destination", "%" + destination + "%");
	    }

	    if (date != null) {
	        query.setParameter("date", date); // ✅ On passe java.sql.Date directement
	    }

	    List<Trajet> result = query.getResultList();
	    session.close();
	    return result;
	}



 }
 
