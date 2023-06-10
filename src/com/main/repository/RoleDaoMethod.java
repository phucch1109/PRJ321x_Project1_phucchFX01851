package com.main.repository;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.main.entity.Role;

@Repository
public class RoleDaoMethod implements RoleDAO{
	@Autowired
	SessionFactory sessionFactory;
	@Override
	public Role getRole(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Role role = currentSession.get(Role.class, id);
		return role;
		
	}

	@Override
	public List<Role> getRoles() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Role> query =  currentSession.createQuery("from Role", Role.class);
		List<Role> roles = query.getResultList();
		return roles;
	}

	@Override
	public void saveRole(Role account) {
		
		
	}

	@Override
	public void deleteRole(int id) {
		
		
	}

}
