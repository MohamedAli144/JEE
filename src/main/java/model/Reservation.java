 package model;
 import java.sql.Date;

import jakarta.persistence.*;
 @Entity
 @Table(name = "Reservation")
 public class Reservation {
 @Id @GeneratedValue
 @Column(name = "id")
 private int id;
 @Column(name = "UserId")
 private long UserId;
 
 @Column(name = "DateRes")
 private java.sql.Date DateRes;
 
 @PrePersist
 protected void onCreate() {
     this.DateRes = new java.sql.Date(System.currentTimeMillis());
 }
 @PreUpdate
 protected void onUpdate() {
     this.DateRes = new java.sql.Date(System.currentTimeMillis());
 }
 
 @Column(name = "nbp_resv_c1")
 private long nbp_resv_c1;
 
 @Column(name = "nbp_resv_c2")
 private long nbp_resv_c2;
 
 @Column(name = "nbp_resv_c3")
 private long nbp_resv_c3;
 
 @Column(name = "Somme")
 private long Somme;
 
 
 
 @Column(name = "voyageId")
 private long voyageId;
public Reservation() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public long getUserId() {
	return UserId;
}
public void setUserId(long userId) {
	UserId = userId;
}
public java.sql.Date getDateRes() {
	return DateRes;
}
public void setDateRes(java.sql.Date dateRes) {
	DateRes = dateRes;
}
public long getNbp_resv_c1() {
	return nbp_resv_c1;
}
public void setNbp_resv_c1(long nbp_resv_c1) {
	this.nbp_resv_c1 = nbp_resv_c1;
}
public long getNbp_resv_c2() {
	return nbp_resv_c2;
}
public void setNbp_resv_c2(long nbp_resv_c2) {
	this.nbp_resv_c2 = nbp_resv_c2;
}
public long getNbp_resv_c3() {
	return nbp_resv_c3;
}
public void setNbp_resv_c3(long nbp_resv_c3) {
	this.nbp_resv_c3 = nbp_resv_c3;
}
public long getSomme() {
	return Somme;
}
public void setSomme(long somme) {
	Somme = somme;
}
public long getVoyageId() {
	return voyageId;
}
public void setVoyageId(long voyageId) {
	this.voyageId = voyageId;
}
public Reservation(long userId, long nbp_resv_c1, long nbp_resv_c2, long nbp_resv_c3, long somme, long voyageId) {
	super();
	UserId = userId;
	this.nbp_resv_c1 = nbp_resv_c1;
	this.nbp_resv_c2 = nbp_resv_c2;
	this.nbp_resv_c3 = nbp_resv_c3;
	Somme = somme;
	this.voyageId = voyageId;
}


 }