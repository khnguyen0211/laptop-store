package com.project.store.controllers.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.store.domain.User;
import com.project.store.domain.dtos.RegisterDto;

import jakarta.validation.Valid;

@Controller
public class AuthController {

    @GetMapping(value = "login")
    public String getLoginPage(Model model) {
        model.addAttribute("loginUser", new User());
        return "/client/auth/login";

    }

    @PostMapping(value = "login")
    public String loginAction(@ModelAttribute("loginUser") @Valid User loginUser,
            BindingResult createUserBindingResult) {
        List<FieldError> errors = createUserBindingResult.getFieldErrors();
        for (FieldError errorField : errors) {
            System.out.println("error at: " + errorField.getField() + ", message: " + errorField.getDefaultMessage());
        }
        if (createUserBindingResult.hasErrors()) {
            return "/client/auth/login";
        }
        return "/client/homepage/homepage";
    }

    @GetMapping(value = "register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerDto", new RegisterDto());
        return "/client/auth/register";
    }

    @PostMapping(value = "register")
    public String registerAction(@ModelAttribute("registerDto") @Valid RegisterDto registerDto,
            BindingResult createUserBindingResult) {
        List<FieldError> errors = createUserBindingResult.getFieldErrors();
        for (FieldError errorField : errors) {
            System.out.println("error at: " + errorField.getField() + ", message: " + errorField.getDefaultMessage());
        }
        if (createUserBindingResult.hasErrors()) {
            return "/client/auth/register";
        }

        return "redirect:/login";
    }

}
