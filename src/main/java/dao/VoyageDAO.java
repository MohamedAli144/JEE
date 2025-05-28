package dao;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Trajet;
import model.Voyage;
import util.HibernateUtil;
 public class VoyageDAO {
 SessionFactory sessionFactory;
 public VoyageDAO() {
 sessionFactory = HibernateUtil.getSessionFactory();
 }
 public Voyage findById(long id) {
 Session session=sessionFactory.openSession();
 Voyage p=session.get(Voyage.class, id);
 session.close();
 return p;
 }
 public boolean create(Voyage p) {
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
 public boolean update(Long id, long nbp_class1, long nbp_class2, long nbp_class3,
         long prix_class1, long prix_class2, long prix_class3, Trajet trajet) {
Session session = sessionFactory.openSession();
Voyage p = session.get(Voyage.class, id);
boolean success = false;

if (p != null) {
p.setNbp_class1(nbp_class1);
p.setNbp_class2(nbp_class2);
p.setNbp_class3(nbp_class3);

p.setPrix_class1(prix_class1);
p.setPrix_class2(prix_class2);
p.setPrix_class3(prix_class3);

p.setTrajet(trajet);

Transaction tx = null;
try {
tx = session.beginTransaction();
session.merge(p); // Utilisation de merge au lieu de persist ici pour une mise à jour
tx.commit();
success = true;
} catch (Exception e) {
if (tx != null) tx.rollback();
throw e;
} finally {
session.close();
}
}
return success;
}
 public boolean delete(long id) {
	 Session session=sessionFactory.openSession();
	 Voyage p=session.get(Voyage.class, id);
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
 public List<Voyage> findAll(){
 Session session=sessionFactory.openSession();
 List<Voyage> result =
 session.createQuery("from Voyage", Voyage.class).getResultList();
 session.close();
 return result;
 }
 public Voyage findByTrajetId(long trajetId) {
	    Session session = sessionFactory.openSession();
	    Voyage voyage = null;
	    try {
	        voyage = session.createQuery("FROM Voyage v WHERE v.trajet.id = :trajetId", Voyage.class)
	                        .setParameter("trajetId", trajetId)
	                        .uniqueResult();
	    } finally {
	        session.close();
	    }
	    return voyage;
	}
}
 
