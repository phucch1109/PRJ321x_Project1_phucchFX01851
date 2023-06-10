package com.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.entity.Account;
import com.main.entity.Role;
import com.main.service.AccountService;
import com.main.service.RoleService;

//for handling admin's account management page
@Controller
public class AccountController {
	@Autowired
	AccountService accountService;
	@Autowired
	RoleService roleService;
	
	//Danh sách tài khoản
	//param 'page' act as index , param query for searching query, param numberOfEntries for number of entry
	@GetMapping("/admin")
	public String getAccount(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
		@RequestParam(value = "query", required = false, defaultValue = "") String query,
		@RequestParam(value="numberShown",required = false,defaultValue ="5") int numberOfEntries) {
		//get list of account
		List<Account> accounts = accountService.getAccounts(page, numberOfEntries, query);
		model.addAttribute("accounts", accounts);
		//get list of role for role option in add/update modal
		List<Role> roles = roleService.getRoles();	
		model.addAttribute("roleList", roles);
		//get number of page  
		model.addAttribute("totalPage", accountService.totalPage(query,numberOfEntries));
		//add modelAttribute for add/update modal
		Account account = new Account();
		model.addAttribute("account", account);
		//add value to make search options remains after transition
		model.addAttribute("query", query);
		model.addAttribute("numberShown",numberOfEntries);
		model.addAttribute("page",page);
		return "account-list";
	}
	
	
	//lưu tài khoản
	//method for saving and updating account
	@PostMapping("/saveAccount")
	public String saveAccount(@ModelAttribute("account") Account account, @RequestParam("roleId") int roleId,Model model) {
		accountService.saveAccount(account, roleId);
		//send alert message
		model.addAttribute("alertMessage", "the account has been saved");
		return "redirect:/admin";
	}
	
	
	//xóa tài khoản
	@GetMapping("/deleteAccount")
	public String deleteAccount(Model model,@RequestParam(value="accountId") int id) {
		accountService.deleteAccount(id);
		//send alert message
		model.addAttribute("alertMessage", "the account has been deleted");
		return "redirect:/admin";
	}
	
	//thay đổi trạng thái 
	@GetMapping("/updateStatus")
	public String updateAccountStatus(@RequestParam(value="accountId") int id,@RequestParam(value="roleId") int roleId,Model model)
	{
		accountService.updateAccountStatus(id,roleId);
		//send alert message
		model.addAttribute("alertMessage", "account status has changed ");
		return "redirect:/admin";
	}
}
