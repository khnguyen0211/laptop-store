package com.project.store.controllers.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.store.constants.Constant;
import com.project.store.domain.Role;
import com.project.store.domain.User;
import com.project.store.domain.dtos.RegisterDto;
import com.project.store.services.RoleService;
import com.project.store.services.UserService;

import jakarta.validation.Valid;

@Controller
public class AuthController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final RoleService roleService;

    public AuthController(PasswordEncoder passwordEncoder, UserService userService, RoleService roleService) {
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
        this.roleService = roleService;
    }

    @GetMapping(value = "/login")
    public String getLoginPage(Model model) {
        return "client/auth/loginPage";
    }

    @GetMapping(value = "register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerDto", new RegisterDto());
        return "client/auth/register";
    }

    @PostMapping(value = "register")
    public String registerAction(@ModelAttribute("registerDto") @Valid RegisterDto registerDto,
            BindingResult createUserBindingResult, Model model) {
        if (createUserBindingResult.hasErrors()) {
            return "client/auth/register";
        }
        Role role = this.roleService.handleGetRoleByName(Constant.USER_ROLE);
        registerDto.setPassword(this.passwordEncoder.encode(registerDto.getPassword()));
        registerDto.setRole(role);
        this.userService.handleSaveUser(new User(registerDto));

        model.addAttribute("success", true);

        return "client/auth/register";
    }

    @GetMapping("/forbidden")
    public String getForbiddenPage(Model model) {
        return "error_pages/forbidden";
    }

    @GetMapping("/page-not-found")
    public String getNotFoundPage(Model model) {
        return "error_pages/not_found";
    }

}
