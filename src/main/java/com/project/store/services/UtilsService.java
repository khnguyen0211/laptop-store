package com.project.store.services;

import org.springframework.stereotype.Service;

import com.project.store.domain.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class UtilsService {

    private final UserService userService;
    private final HttpServletRequest request;

    public UtilsService(UserService userService, HttpServletRequest request) {
        this.userService = userService;
        this.request = request;
    }

    public User getSessionUser() {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return null;
        }
        String userEmail = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(userEmail);
        return user;
    }

    public void setCartSession(int value) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.setAttribute("cart", value);
    }
}
