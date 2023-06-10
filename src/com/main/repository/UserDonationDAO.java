package com.main.repository;

import java.util.List;

import com.main.entity.UserDonation;

public interface UserDonationDAO {
	public UserDonation getUserDonation(int id);
	public List<UserDonation> getDonationList(int page, int numberOfEntries,int donationId,String queryString);
	public void saveUserDonation(UserDonation userDonation);
	public void updateUserDonation(UserDonation userDonation);
	public void deleteUserDonation(int id);
	public int getUserDonationTotalPage(int numberOfEntries,String queryString,int donationId);
	public List<UserDonation> getUserDonationListByStatus(int donationId,int status);
	
}
