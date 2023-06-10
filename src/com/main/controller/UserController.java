package com.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.entity.Donation;
import com.main.entity.UserDonation;
import com.main.service.DonationService;
import com.main.service.UserDonationService;

@Controller
public class UserController {
	@Autowired
	DonationService donationService;
	@Autowired
	UserDonationService userDonationService;
	
	//show donation's list
	@GetMapping("/home")
	public String homePage(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		List<Donation> donationList = donationService.getDonations(page, 5, "");
		int totalPage = donationService.getDonationTotalPage(5, "");
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("donations", donationList);
		UserDonation userDonation = new UserDonation();
		model.addAttribute("userDonation",userDonation);
		return "home";
	}
	
	//show donation detail and approved user donation
	@GetMapping("/userDonationDetail")
	public String donationDetail(Model model, @RequestParam(value = "id") int idDonation) {
		Donation donation = donationService.getDonation(idDonation);
		List<UserDonation> userDonationList = userDonationService.getApprovedUserDonationByDonationId(idDonation);
		model.addAttribute("donation", donation);
		model.addAttribute("users",userDonationList);
		return "donation-detail-forUser";
	}
	
	//add user donation 
	@PostMapping("/addUserDonation")
	public String addUserDonation(@RequestParam(value = "id") int idDonation,@ModelAttribute("userDonation") UserDonation userDonation,
			Model model) {
		model.addAttribute("alertMessage", "the donation has been submitted , please wait");
		
		userDonationService.saveUserDonation(idDonation,userDonation);
		return "redirect:/home";
	}
	
}
