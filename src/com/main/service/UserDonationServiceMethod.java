package com.main.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.entity.Donation;
import com.main.entity.UserDonation;
import com.main.repository.DonationDAO;
import com.main.repository.UserDonationDAO;

@Service
public class UserDonationServiceMethod implements UserDonationService {
	@Autowired
	UserDonationDAO userDonationDAO;
	@Autowired
	DonationDAO donationDAO;

	@Transactional
	@Override
	public UserDonation getUserDonation(int id) {
		return userDonationDAO.getUserDonation(id);
	}
	
	//get donation list
	@Transactional
	@Override
	public List<UserDonation> getDonationList(int page, int numberOfEntries, int donationId, String queryString) {
		return userDonationDAO.getDonationList(page, numberOfEntries, donationId, queryString);
	}

	//add currert time and save user donation
	@Transactional
	@Override
	public void saveUserDonation(int donationId, UserDonation userDonation) {
		Donation donation = donationDAO.getDonation(donationId);
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		userDonation.setCreated(formatter.format(date));
		userDonation.setDonation(donation);
		userDonationDAO.saveUserDonation(userDonation);
	}
	
	//delete user donation
	@Transactional
	@Override
	public void deleteUserDonation(int id) {
		deleteUserDonation(id);
	}
	
	//get number of page 
	@Transactional
	@Override
	public int getUserDonationTotalPage(int numberOfEntries, String queryString, int donationId) {
		return userDonationDAO.getUserDonationTotalPage(numberOfEntries, queryString, donationId);
	}
	
	//update userDonation status (approved or not) and increase donation money if approved
	@Transactional
	@Override
	public void updateStatus(int id, int status) {
		UserDonation userDonation = userDonationDAO.getUserDonation(id);
		userDonation.setStatus(status);
		if (status == 1) {
			Donation donation = userDonation.getDonation();
			donation.setMoney(donation.getMoney() + userDonation.getMoney());
			userDonation.setDonation(donation);
		}
		userDonationDAO.updateUserDonation(userDonation);
	}
	
	//get approved user donations
	@Transactional
	@Override
	public List<UserDonation> getApprovedUserDonationByDonationId(int donationId) {
		return userDonationDAO.getUserDonationListByStatus(donationId, 1);
	}
}
