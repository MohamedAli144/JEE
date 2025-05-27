 package dao;
 import java.util.List;
 import org.hibernate.Session;
 import org.hibernate.SessionFactory;
 import org.hibernate.Transaction;
import model.Personne2;
import util.HibernateUtil;
 public class Personne2DAO {
 SessionFactory sessionFactory;
 public Personne2DAO() {
 sessionFactory = HibernateUtil.getSessionFactory();
 }
 public Personne2 findById(long id) {
 Session session=sessionFactory.openSession();
 Personne2 p=session.get(Personne2.class, id);
 session.close();
 return p;
 }
 public boolean create(Personne2 p) {
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
 public boolean update(Long id, String cin, String nom, String prenom) {
	 Session session=sessionFactory.openSession();
	 Personne2 p=session.get(Personne2.class, id);
	 boolean success = false;
	 if(p!=null) {
	 p.setCin(cin);
	 p.setNom(nom);
	 p.setPrenom(prenom);
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
	 Personne2 p=session.get(Personne2.class, id);
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
 public List<Personne2> findAll(){
 Session session=sessionFactory.openSession();
 List<Personne2> result =
 session.createQuery("from Personne", Personne2.class).getResultList();
 session.close();
 return result;
 }}
 
