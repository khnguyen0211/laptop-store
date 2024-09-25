package com.project.store.services;

import org.springframework.stereotype.Service;

import com.project.store.domain.User;
import com.project.store.repositories.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

}
