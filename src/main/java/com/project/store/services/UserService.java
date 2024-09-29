package com.project.store.services;

import java.util.List;
import java.util.Optional;

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

    public List<User> handleGetAllUser() {
        return this.userRepository.findAllByOrderByIdDesc();
    }

    public Optional<User> handleGetUserDetailById(long id) {
        return this.userRepository.findById(id);
    }

    public User handleUpdateUser(User user) {
        return this.userRepository.save(user);
    }

    public void handleDeleteUser(long id) {
        this.userRepository.deleteById(id);
    }

}
