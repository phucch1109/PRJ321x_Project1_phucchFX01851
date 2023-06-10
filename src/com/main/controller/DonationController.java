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

//for handling admin's donation management page
@Controller
public class DonationController {
	@Autowired
	DonationService donationService;
	@Autowired
	UserDonationService userDonationService;
	
	//Danh sách quyên góp
		//param 'page' act as index , param query for searching query, param numberOfEntries for number of entry
	@GetMapping("/adminDonation")
	public String showDonationList(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
		@RequestParam(value = "query", required = false, defaultValue = "") String query,
		@RequestParam(value="numberShown",required = false,defaultValue ="5") int numberShown) {
		List<Donation> donations = donationService.getDonations(page, numberShown, query);
		model.addAttribute("donations", donations);
		model.addAttribute("totalPage", donationService.getDonationTotalPage(numberShown,query));
		Donation donation = new Donation();
		model.addAttribute("donation", donation);
		model.addAttribute("query", query);
		model.addAttribute("numberShown",numberShown);
		model.addAttribute("page",page);
		return "donation-list";
	}
	
	//lưu tài khoản
	//method for saving and updating donation
	@PostMapping("/saveDonation")
	public String saveAccount(@ModelAttribute("donation") Donation donation,Model model) {
		donationService.saveDonation(donation);
		model.addAttribute("alertMessage", "the donation has been updated");
		return "redirect:/adminDonation";
	}
	//đổi trạng thái
	@PostMapping("/changeDonationStatus")
	public String changeDonationStatus(@RequestParam(value="id") int id,Model model) {
		donationService.changeStatus(id);
		model.addAttribute("alertMessage", "the donation'status has been update");
		return "redirect:/adminDonation";
	}
	//xóa quyên góp
	@GetMapping("/deleteDonation")
	public String deleteAccount(Model model,@RequestParam(value="id") int id) {
		donationService.deleteDonation(id);
		model.addAttribute("alertMessage", "the account has been deleted");
		return "redirect:/admin";
	}
	
	//get donation detail and it's donator
	@GetMapping("/donationDetail")
	public String donationDetail(@RequestParam(value="id") int id, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "query", required = false, defaultValue = "") String query,
			@RequestParam(value="numberShown",required = false,defaultValue ="5") int numberShown,Model model) {
		Donation donation = donationService.getDonation(id);
		model.addAttribute("donation",donation);
		
		List<UserDonation> userDonations = userDonationService.getDonationList(page, numberShown, id,query);
		model.addAttribute("users", userDonations);
		model.addAttribute("totalPage", userDonationService.getUserDonationTotalPage(numberShown,query,id));
		model.addAttribute("query", query);
		model.addAttribute("numberShown",numberShown);
		model.addAttribute("page",page);
		return "donation-detail";
	}
	
	//approve or disapprove user's donation
	@GetMapping("/updateUserDonationStatus")
	public String userDonationUpdateStatus(@RequestParam(value="status") int status,@RequestParam(value="id") int id,@RequestParam(value="donationId") int donationId) {
		userDonationService.updateStatus(id, status);
		return "redirect:/donationDetail?id="+donationId;		
	}
}
