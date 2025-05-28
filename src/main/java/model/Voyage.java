package model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Voyage")
public class Voyage {
@Id @GeneratedValue
@Column(name = "id")
private int id;


@Column(name = "nbp_class1")
private long nbp_class1;
@Column(name = "nbp_class2")
private long nbp_class2;
@Column(name = "nbp_class3")
private long nbp_class3;

@Column(name = "prix_class1")
private long prix_class1;
@Column(name = "prix_class2")
private long prix_class2;
@Column(name = "prix_class3")
private long prix_class3;

@OneToOne
@JoinColumn(name = "trajet_id", referencedColumnName = "id")
private Trajet trajet;




public Voyage() {
	super();
}




public int getId() {
	return id;
}




public void setId(int id) {
	this.id = id;
}




public long getNbp_class1() {
	return nbp_class1;
}




public void setNbp_class1(long nbp_class1) {
	this.nbp_class1 = nbp_class1;
}




public long getNbp_class2() {
	return nbp_class2;
}




public void setNbp_class2(long nbp_class2) {
	this.nbp_class2 = nbp_class2;
}




public long getNbp_class3() {
	return nbp_class3;
}




public void setNbp_class3(long nbp_class3) {
	this.nbp_class3 = nbp_class3;
}




public long getPrix_class1() {
	return prix_class1;
}




public void setPrix_class1(long prix_class1) {
	this.prix_class1 = prix_class1;
}




public long getPrix_class2() {
	return prix_class2;
}




public void setPrix_class2(long prix_class2) {
	this.prix_class2 = prix_class2;
}




public long getPrix_class3() {
	return prix_class3;
}




public void setPrix_class3(long prix_class3) {
	this.prix_class3 = prix_class3;
}




public Trajet getTrajet() {
	return trajet;
}




public void setTrajet(Trajet trajet) {
	this.trajet = trajet;
}




public Voyage(long nbp_class1, long nbp_class2, long nbp_class3, long prix_class1, long prix_class2, long prix_class3,
		Trajet trajet) {
	super();
	this.nbp_class1 = nbp_class1;
	this.nbp_class2 = nbp_class2;
	this.nbp_class3 = nbp_class3;
	this.prix_class1 = prix_class1;
	this.prix_class2 = prix_class2;
	this.prix_class3 = prix_class3;
	this.trajet = trajet;
}





}
