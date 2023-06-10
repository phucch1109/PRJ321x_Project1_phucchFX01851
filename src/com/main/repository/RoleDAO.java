package com.main.repository;

import java.util.List;

import com.main.entity.Role;

public interface RoleDAO {
	public Role getRole(int id);
	public List<Role> getRoles();
	public void saveRole(Role account);
	public void deleteRole(int id);
}
