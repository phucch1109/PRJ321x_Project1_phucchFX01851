package com.main.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.entity.Role;
import com.main.repository.RoleDAO;

@Service
public class RoleServiceMethod implements RoleService {
	@Autowired
	RoleDAO roleDao;
	
	@Override
	public void saveRole(Role role) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRole(int id) {
		// TODO Auto-generated method stub
		
	}
	
	@Transactional
	@Override
	public List<Role> getRoles() {
		
		return roleDao.getRoles();
	}

	@Override
	public Role getRole(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
