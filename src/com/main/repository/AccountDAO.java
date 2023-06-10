package com.main.repository;

import java.util.List;

import com.main.entity.Account;

public interface AccountDAO {
	public Account getAccount(int id);
	public List<Account> getAccount();
	public void saveAccount(Account account);
	public void deleteAccount(int id);
	public List<Account> getAccounts(int page,int total,String queryPhoneOrEmail);
	public int totalPage(String queryPhoneOrEmail,int numberShown);
}
