package com.main.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.main.entity.Donation;

@Repository
public class DonationDaoMethod implements DonationDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Donation getDonation(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Donation> query = currentSession.createQuery("from Donation where id=:id",Donation.class);
		query.setParameter("id", id);
		Donation donation = query.getSingleResult();
		return donation;
	}
	
	public List<Donation> getDonations(int page, int numberOfEntries,String queryString) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Donation> query;
		if(queryString.isBlank()) {
			query = currentSession.createQuery("from Donation",Donation.class);
		}
		else {
			query = currentSession.createQuery("from Donation as don where don.phoneNumber like :string or don.organizationName like :string or don.code like :string" ,Donation.class);
			query.setParameter("string", "%"+queryString+"%");
		}
		query.setFirstResult((page-1)*numberOfEntries);
		query.setMaxResults(numberOfEntries);
		List<Donation> donations = query.getResultList();
		return donations;
	}
	
	public void saveDonation(Donation donation) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(donation);
	}
	
	public void deleteDonation(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("delete from Donation where id=:id");
		query.setParameter("id", id);
		query.executeUpdate();
	}
	
	public int getDonationTotalPage(int numberOfEntries,String queryString) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql;
		Query query;
		if(queryString.isBlank()) {
			 hql = "select count(id) from Donation ";
			query = currentSession.createQuery(hql);
		}
		else {
			hql = "select count(id) from Donation as don where don.phoneNumber like :string or don.code like :string or don.organizationName like :string";
			query = currentSession.createQuery(hql);
			query.setParameter("string", "%"+queryString+"%");
		}
		int number = ((Number)query.uniqueResult()).intValue();
		return (number-1)/numberOfEntries+1;
	}
	
	public List<Donation> getDonationsByStatus(int page, int numberOfEntries,int status) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Donation> query;
		query = currentSession.createQuery("from Donation as don where don.status = :string" ,Donation.class);
		query.setParameter("string", status);
		query.setFirstResult((page-1)*numberOfEntries);
		query.setMaxResults(numberOfEntries);
		List<Donation> donations = query.getResultList();
		return donations;
	}
}
