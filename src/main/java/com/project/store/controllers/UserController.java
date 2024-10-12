package com.project.store.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.store.domain.Role;
import com.project.store.domain.User;
import com.project.store.services.FileService;
import com.project.store.services.RoleService;
import com.project.store.services.UserService;
import com.project.store.services.UtilsService;

import jakarta.validation.Valid;

@Controller()
public class UserController {

    private final UserService userService;
    private final FileService fileService;
    private final RoleService roleService;
    private final UtilsService utilsService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService,
            FileService fileService,
            RoleService roleService,
            UtilsService utilsService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.fileService = fileService;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
        this.utilsService = utilsService;
    }

    @GetMapping("admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("createUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "admin/user/create")
    public String postUserPage(
            @ModelAttribute("createUser") @Valid User createUser,
            BindingResult createUserBindingResult,
            @RequestParam("imageFile") MultipartFile file
    ) {

        List<FieldError> errors = createUserBindingResult.getFieldErrors();
        for (FieldError errorField : errors) {
            System.out.println("error at: " + errorField.getField() + ", message: " + errorField.getDefaultMessage());
        }
        if (createUserBindingResult.hasErrors()) {
            return "/admin/user/create";
        }
        String targetFolder = "avatar";
        String fileName = this.fileService.handleUploadFile(file, targetFolder);
        Role role = this.roleService.handleGetRoleByName(createUser.getRole().getName());
        createUser.setRole(role);
        createUser.setAvatar(fileName);
        createUser.setPassword(this.passwordEncoder.encode(createUser.getPassword()));
        this.userService.handleSaveUser(createUser);
        return "redirect:/admin/user"; //return to url-(API) render table. NOT return name file
    }

    @GetMapping("admin/user")
    public String getAllUserPage(Model model) {
        List<User> users = this.userService.handleGetAllUser();
        model.addAttribute("users", users);
        return "admin/user/table-user";
    }

    @RequestMapping("admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable("id") long id) {
        Optional<User> optionalUser = this.userService.handleGetUserDetailById(id);
        if (!optionalUser.isPresent()) {
            return null;
        }
        model.addAttribute("user", optionalUser.get());
        return "admin/user/detail";
    }

    @GetMapping(value = "admin/user/update/{id}")
    public String updateUserDetailPage(Model model, @PathVariable("id") long id) {
        Optional<User> optionalUser = this.userService.handleGetUserDetailById(id);
        if (optionalUser.isPresent()) {
            model.addAttribute("updateUser", optionalUser.get());
        }
        return "admin/user/update";
    }

    @GetMapping(value = "admin/user/delete/{id}")
    public String deleteUser(Model model, @PathVariable("id") long id) {
        Optional<User> optionalUser = this.userService.handleGetUserDetailById(id);
        if (optionalUser.isPresent()) {
            this.userService.handleDeleteUser(id);
        }
        return "redirect:/admin/user";
    }

    @PostMapping(value = "admin/user/update")
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
        return "redirect:/admin/user";
    }

    @RequestMapping("me")
    public String getUserDetailPage(Model model) {
        User user = utilsService.getSessionUser();
        model.addAttribute("user", user);
        return "client/account/me";
    }

}
