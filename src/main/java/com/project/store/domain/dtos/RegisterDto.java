package com.project.store.domain.dtos;

import com.project.store.domain.User;
import com.project.store.validators.RegisterChecked;

@RegisterChecked()
public class RegisterDto extends User {

    private String confirmPassword;

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
