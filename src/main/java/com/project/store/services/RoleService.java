package com.project.store.services;

import org.springframework.stereotype.Service;

import com.project.store.domain.Role;
import com.project.store.repositories.RoleRepository;

@Service
public class RoleService {

    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Role handleGetRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }
}
