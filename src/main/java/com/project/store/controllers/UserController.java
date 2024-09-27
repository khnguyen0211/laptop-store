package com.project.store.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.store.domain.User;
import com.project.store.services.UserService;

@Controller()
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("")
    public String requestMethodName(Model model) {
        model.addAttribute("fullName", "Nguyen");
        return "hello";
    }

    @RequestMapping("admin/users/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("createUser", new User());
        return "admin/users/create";
    }

    @RequestMapping("admin/users")
    public String getAllUserPage(Model model) {
        List<User> users = this.userService.handleGetAllUser();
        model.addAttribute("users", users);
        return "admin/users/table-user";
    }

    @RequestMapping("admin/users/{id}")
    public String getUserDetailPage(Model model, @PathVariable("id") long id) {
        Optional<User> optionalUser = this.userService.handleGetUserDetailById(id);
        if (!optionalUser.isPresent()) {
            return null;
        }
        model.addAttribute("user", optionalUser.get());
        System.out.println(optionalUser.get());
        return "hello";
    }

    @GetMapping(value = "admin/users/update/{id}")
    public String updateUserDetailPage(Model model, @PathVariable("id") long id) {
        Optional<User> optionalUser = this.userService.handleGetUserDetailById(id);
        if (optionalUser.isPresent()) {
            model.addAttribute("updateUser", optionalUser.get());
        }
        return "admin/users/update";
    }

    @RequestMapping(value = "admin/users/created", method = RequestMethod.POST)
    public String postUserPage(Model model, @ModelAttribute("createUser") User createUser) {
        this.userService.handleSaveUser(createUser);
        return "redirect:/admin/users"; //return to url-(API) render table. NOT return name file
    }

    @PostMapping(value = "admin/users/updated")
    public String updateUserPage(Model model, @ModelAttribute("updateUser") User updateUser) {
        Optional<User> optionalUser = this.userService.handleGetUserDetailById(updateUser.getId());
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            user.setFullName(updateUser.getFullName());
            user.setEmail(updateUser.getEmail());
            user.setAddress(updateUser.getAddress());
            user.setPhone(updateUser.getPhone());
            this.userService.handleUpdateUser(user);
        }
        return "redirect:/admin/users";
    }

}
