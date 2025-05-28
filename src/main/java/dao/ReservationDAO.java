 package dao;

import java.util.List;
 import org.hibernate.Session;
 import org.hibernate.SessionFactory;
 import org.hibernate.Transaction;
import model.Reservation;
import util.HibernateUtil;
 public class ReservationDAO {
 SessionFactory sessionFactory;
 public ReservationDAO() {
 sessionFactory = HibernateUtil.getSessionFactory();
 }
 public Reservation findById(long id) {
 Session session=sessionFactory.openSession();
 Reservation p=session.get(Reservation.class, id);
 session.close();
 return p;
 }
 public boolean create(Reservation p) {
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
 public boolean update(Long id, long userId, long nbp_resv_c1, long nbp_resv_c2, long nbp_resv_c3, long somme, long voyageId) {
	 Session session=sessionFactory.openSession();
	 Reservation p=session.get(Reservation.class, id);
	 boolean success = false;
	 if(p!=null) {
	 p.setUserId(userId);
	 p.setNbp_resv_c1(nbp_resv_c1);
	 p.setNbp_resv_c2(nbp_resv_c2);
	 p.setNbp_resv_c3(nbp_resv_c3);
	 p.setSomme(somme);
	 p.setVoyageId(voyageId);
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
	 Reservation p=session.get(Reservation.class, id);
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
 public List<Reservation> findAll(){
 Session session=sessionFactory.openSession();
 List<Reservation> result =
 session.createQuery("from Reservation", Reservation.class).getResultList();
 session.close();
 return result;
 }
 public List<Reservation> findByUserId(long UserId) {
	    Session session = sessionFactory.openSession();
	    List<Reservation> result = session.createQuery(
	        "FROM Reservation WHERE UserId = :UserId", Reservation.class)
	        .setParameter("UserId", (long) UserId)
	        .getResultList();
	    session.close();
	    return result;
	}
 }
 
