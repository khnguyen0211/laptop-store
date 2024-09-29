package com.project.store.controllers.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemController {

    @GetMapping("")
    public String getMethodName() {
        return "client/homepage/homepage";
    }

    @GetMapping("product/detail")
    public String getMethodName2() {
        return "client/product/detail";
    }

}
