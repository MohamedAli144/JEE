package model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "User")
public class User {
@Id @GeneratedValue
@Column(name = "id")
private int id;
@Column(name = "email")
private String email;
@Column(name = "password")
private String password;
@Column(name = "nom")
private String nom;

@Column(name = "prenom")
private String prenom;


public User() {
	super();
}
public User(String email, String password, String nom, String prenom) {
	super();
	this.email = email;
	this.password = password;
	this.nom = nom;
	this.prenom = prenom;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public String getPrenom() {
	return prenom;
}
public void setPrenom(String prenom) {
	this.prenom = prenom;
}


}
