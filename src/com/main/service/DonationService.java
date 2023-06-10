package com.main.service;

import java.util.List;

import com.main.entity.Donation;

public interface DonationService {
	public Donation getDonation(int id);
	public List<Donation> getDonations(int page,int numberOfEntries,String queryString);
	public int getDonationTotalPage(int numberOfEntries,String queryString) ;
	public void saveDonation(Donation donation);
	public void deleteDonation(int id);
	public void changeStatus(int id);
}
