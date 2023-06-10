package com.main.service;

import java.util.List;

import com.main.entity.UserDonation;

public interface UserDonationService {
	public UserDonation getUserDonation(int id);
	public List<UserDonation> getDonationList(int page, int numberOfEntries,int donationId,String queryString);
	public void saveUserDonation(int donationId,UserDonation userDonation);
	public void deleteUserDonation(int id);
	public int getUserDonationTotalPage(int numberOfEntries,String queryString,int donationId);
	public void updateStatus(int id,int status);
	public List<UserDonation> getApprovedUserDonationByDonationId(int donationId);
}
