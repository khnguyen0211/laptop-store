package com.project.store.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.store.domain.User;
import com.project.store.services.UserService;

@Controller()
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("")
    public String requestMethodName(Model model) {
        model.addAttribute("fullName", "Khoi Nguyen");
        return "hello";
    }

    @RequestMapping("admin/users/create")
    public String getUserPage(Model model) {
        model.addAttribute("createUser", new User());
        return "admin/users/create";
    }

    @RequestMapping(value = "admin/users/created", method = RequestMethod.POST)
    public String postUserPage(Model model, @ModelAttribute("createUser") User createUser) {
        System.out.println(createUser);
        this.userService.handleSaveUser(createUser);
        return "hello";
    }

}
