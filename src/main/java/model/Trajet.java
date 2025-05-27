package model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;


@Entity
@Table(name = "Trajet")
public class Trajet {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
    private Long ID;
	
	@Column(name = "date")
    private java.sql.Date Date;
	
	@Column(name = "ville_Depart")
    private String Ville_Depart;
	
	@Column(name = "destination")
    private String Destination;
	
    
    public Trajet() {
    	super();
    }



	public Trajet(java.sql.Date date, String ville_Depart, String destination) {
		super();
		Date = date;
		Ville_Depart = ville_Depart;
		Destination = destination;
	}



	public java.sql.Date getDate() {
		return Date;
	}



	public void setDate(java.sql.Date date) {
		Date = date;
	}



	public String getVille_Depart() {
		return Ville_Depart;
	}



	public void setVille_Depart(String ville_Depart) {
		Ville_Depart = ville_Depart;
	}



	public String getDestination() {
		return Destination;
	}



	public void setDestination(String destination) {
		Destination = destination;
	}



	public Long getID() {
		return ID;
	}



	public void setID(Long iD) {
		ID = iD;
	}
    
}
