package com.project.store.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller()
public class DashboardController {

    @RequestMapping("admin")
    public String requestMethodName() {
        return "admin/dashboard/show";
    }

}
