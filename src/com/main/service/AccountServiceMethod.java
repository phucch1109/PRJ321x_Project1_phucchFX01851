package com.main.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.entity.Account;
import com.main.entity.Role;
import com.main.repository.AccountDAO;
import com.main.repository.RoleDAO;

@Service
public class AccountServiceMethod implements AccountService{
	
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	RoleDAO roleDAO;
	@Transactional
	@Override
	public Account getAccount(int id) {
		// TODO Auto-generated method stub
		return accountDAO.getAccount(id);
	}
	@Transactional
	@Override
	public List<Account> getAccount() {
		// TODO Auto-generated method stub
		return accountDAO.getAccount();
	}
	@Transactional
	@Override
	public void saveAccount(Account account,int roleId) {
		// TODO Auto-generated method stub
		Role role = roleDAO.getRole(roleId);
		role.add(account);
		System.out.println(account.getId());
		accountDAO.saveAccount(account);
	}
	@Transactional
	@Override
	public void deleteAccount(int id) {
		// TODO Auto-generated method stub
		accountDAO.deleteAccount(id);
	}
	
	@Transactional
	@Override
	public List<Account> getAccounts(int page,int total,String queryPhoneOrEmail) {
		return accountDAO.getAccounts(page,total,queryPhoneOrEmail);
	}
	
	@Transactional
	@Override
	public int totalPage(String queryPhoneOfEmail,int numberShown) {
		// TODO Auto-generated method stub
		return accountDAO.totalPage(queryPhoneOfEmail,numberShown);
	}
	
	@Transactional
	@Override
	public void updateAccountStatus(int id,int roleId) {
		Account account =  accountDAO.getAccount(id);
		Role role = roleDAO.getRole(roleId);
		role.add(account);
		if(account.getAccountStatus() == 1) {
			account.setAccountStatus(0);
		} else account.setAccountStatus(1);
		accountDAO.saveAccount(account);
	}

}
