package com.main.service;

import java.util.List;

import com.main.entity.Role;

public interface RoleService {
public void saveRole(Role role);
public void deleteRole(int id);
public List<Role> getRoles();
public Role getRole(int id);
}
