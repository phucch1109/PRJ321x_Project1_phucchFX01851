package com.main.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.entity.Donation;
import com.main.entity.UserDonation;

@Repository
public class UserDonationDaoMethod implements UserDonationDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	//get userDonation
	public UserDonation getUserDonation(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<UserDonation> query = currentSession.createQuery("from UserDonation where id=:id",UserDonation.class);
		query.setParameter("id", id);
		UserDonation donation = query.getSingleResult();
		return donation;
	}
	
	
	//get
	public List<UserDonation> getDonationList(int page, int numberOfEntries,int donationId,String queryString) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<UserDonation> query;
		if(queryString.isBlank()) {
			query = currentSession.createQuery("from UserDonation where donation.id = :id" ,UserDonation.class);
			query.setParameter("id", donationId);
		}else {
			query = currentSession.createQuery("from UserDonation where donation.id = :id and name like :string or donation.id = :id and text like :string" ,UserDonation.class);
			query.setParameter("id", donationId);
			query.setParameter("string", "%"+queryString+"%");
		}
		query.setFirstResult((page-1)*numberOfEntries);
		query.setMaxResults(numberOfEntries);
		List<UserDonation> donations = query.getResultList();
		return donations;
	}
	
	public void saveUserDonation(UserDonation userDonation) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(userDonation);
	}
	
	public void updateUserDonation(UserDonation userDonation) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(userDonation);
	}
	
	public void deleteUserDonation(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("delete from UserDonation where id=:id");
		query.setParameter("id", id);
		query.executeUpdate();
	}
	
	
	//get number of page
	public int getUserDonationTotalPage(int numberOfEntries,String queryString,int donationId) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql;
		Query query;
		if(queryString.isBlank()) {
			 hql = "select count(id) from UserDonation where donation.id = :id ";
			query = currentSession.createQuery(hql);
			query.setParameter("id", donationId);
		}
		else {
			hql = "select count(id) from UserDonation where donation.id = :id and name like :string or donation.id = :id and text like :string";
			query = currentSession.createQuery(hql);
			query.setParameter("string", "%"+queryString+"%");
			query.setParameter("id", donationId);
		}
		int number = ((Number)query.uniqueResult()).intValue();
		return (number-1)/numberOfEntries+1;
	}
	
	//get user donation by status and donation ID
	public List<UserDonation> getUserDonationListByStatus(int donationId,int status) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql;
		Query<UserDonation> query;
		 hql = "from UserDonation where donation.id = :id and status = :status ";
			query = currentSession.createQuery(hql,UserDonation.class);
			query.setParameter("id", donationId);
			query.setParameter("status", status);
			List<UserDonation> donations = query.getResultList();
			return donations;
	}
	

}
