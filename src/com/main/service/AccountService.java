package com.main.service;

import java.util.List;

import com.main.entity.Account;

public interface AccountService {
	public Account getAccount(int id);
	public List<Account> getAccount() ;
	public void saveAccount(Account account,int roleId);
	public void deleteAccount(int id);
	public List<Account> getAccounts(int page,int total,String queryPhoneOrEmail);
	public int totalPage(String queryPhoneOrEmail,int numberShown);
	public void updateAccountStatus(int id,int roleId);
}
