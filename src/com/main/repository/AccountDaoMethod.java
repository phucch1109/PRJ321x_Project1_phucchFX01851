package com.main.repository;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.main.entity.Account;

@Repository
public class AccountDaoMethod implements AccountDAO{
	@Autowired
	private SessionFactory sessionFactory;

	//getAccount
	@Override
	public Account getAccount(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Account> query = currentSession.createQuery("from Account where id=:accountId",Account.class);
		query.setParameter("accountId", id);
		Account account = query.uniqueResult();
		return account;
	}
	
	//getAllAccount
	@Override
	public List<Account> getAccount() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Account> query = currentSession.createQuery("from Account",Account.class);
		List<Account> accounts = query.getResultList();
		return accounts;
	}
	
	
	//get account with query and page
	@Override
	public List<Account> getAccounts(int page,int total,String queryEmailorPhone) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Account> query;
		if(queryEmailorPhone.isBlank()) {
			query = currentSession.createQuery("from Account",Account.class);
		}
		else {
			query = currentSession.createQuery("from Account as acc where acc.phoneNumber like :string or acc.email like :string " ,Account.class);
			query.setParameter("string", "%"+queryEmailorPhone+"%");
		}
		query.setFirstResult((page-1)*total);
		query.setMaxResults(total);
		List<Account> accounts = query.getResultList();
		return accounts;
		
	}
	
	//save account
	@Override
	public void saveAccount(Account account) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(account);
	}
	
	//delete account
	@Override
	public void deleteAccount(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Account> theQuery = currentSession.createQuery("delete from Account where id=:accountId",Account.class);
		theQuery.setParameter("accountId", id);
		theQuery.executeUpdate();
	}
	
	//get total page
	@Override
	public int totalPage(String queryEmailorPhone,int numberShown) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql;
		if(queryEmailorPhone.isBlank()) {
			 hql = "select count(id) from Account ";
		}
		else {
			hql = "select count(id) from Account as acc where acc.phoneNumber like '%"+queryEmailorPhone+"%' or acc.email like '%" + queryEmailorPhone +"%'";
		}
		Query query = currentSession.createQuery(hql);
		int number = ((Number)query.uniqueResult()).intValue();
		return (number-1)/numberShown+1;
	}
	
	
	
}
