package com.main.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="user_donation")
public class UserDonation {
@Id
@Column(name="id")
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
@Column(name = "created")
private String created;
@Column(name = "money")
private int money;
@Column(name = "name")
private String name;
@Column(name = "status")
private int status;
@Column(name = "text")
private String text;

@ManyToOne(cascade = CascadeType.ALL)
@JoinColumn(name = "donation_id")
private Donation donation;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getCreated() {
	return created;
}
public void setCreated(String created) {
	this.created = created;
}
public int getMoney() {
	return money;
}
public void setMoney(int money) {
	this.money = money;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}
public Donation getDonation() {
	return donation;
}
public void setDonation(Donation donation) {
	this.donation = donation;
}
@Override
public String toString() {
	return "UserDonation [id=" + id + ", created=" + created + ", money=" + money + ", name=" + name + ", status="
			+ status + ", text=" + text  + ", donation=" + donation + "]";
}



}
