package com.main.repository;

import java.util.List;

import com.main.entity.Donation;

public interface DonationDAO {

	
	public Donation getDonation(int id);
	public List<Donation> getDonations(int page,int numberOfEntries,String queryString);
	public int getDonationTotalPage(int numberOfEntries,String queryString) ;
	public void saveDonation(Donation donation);
	public void deleteDonation(int id);
	public List<Donation> getDonationsByStatus(int page, int numberOfEntries,int status) ;
}
