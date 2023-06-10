package com.main.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.entity.Donation;
import com.main.entity.Role;
import com.main.repository.DonationDAO;
import com.main.repository.RoleDAO;

@Service
public class DonationServiceMethod implements DonationService {
	@Autowired
	DonationDAO donationDao;
	@Autowired
	RoleDAO roleDAO;
	@Transactional
	@Override
	//get donation
	public Donation getDonation(int id) {
		return donationDao.getDonation(id);
	}
	
	//get donation list with status if query match with name of status, otherwise match with phone number and email  
	@Transactional
	@Override
	public List<Donation> getDonations(int page, int numberOfEntries, String queryString) {
		
		if(queryString.equalsIgnoreCase("Đang quyên góp")) return donationDao.getDonationsByStatus(page, numberOfEntries, 1);
		if(queryString.equalsIgnoreCase("Mới tạo")) return donationDao.getDonationsByStatus(page, numberOfEntries, 0);
		if(queryString.equalsIgnoreCase("kết thúc quyên góp")) return donationDao.getDonationsByStatus(page, numberOfEntries, 2);
		if(queryString.equalsIgnoreCase("đóng quyên góp")) return donationDao.getDonationsByStatus(page, numberOfEntries, 3);
		return donationDao.getDonations(page, numberOfEntries, queryString);
	}
	
	//get total page
	@Transactional
	@Override
	public int getDonationTotalPage(int numberOfEntries, String queryString) {
		return donationDao.getDonationTotalPage(numberOfEntries, queryString);
	}
	
	//save donation
	@Transactional
	@Override
	public void saveDonation(Donation donation) {
		donationDao.saveDonation(donation);
	}
	
	//delete donation
	@Transactional
	@Override
	public void deleteDonation(int id) {
		
		donationDao.deleteDonation(id);
	}
	
	//change donation'status by increase status by 1
	@Transactional
	@Override
	public void changeStatus(int id) {
		Donation donation = donationDao.getDonation(id);
		donation.setStatus(donation.getStatus()+1);
		donationDao.saveDonation(donation);
	}

	
}
