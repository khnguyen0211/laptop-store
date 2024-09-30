package com.project.store.domain.dtos;

import com.project.store.domain.User;
import com.project.store.validators.RegisterChecked;

import jakarta.validation.constraints.NotEmpty;

@RegisterChecked()
public class RegisterDto extends User {

    @NotEmpty(message = "Confirm Password cannot be empty")
    private String confirmPassword;

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
