package com.project.store;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController()
public class HelloWorld {

    @GetMapping("")
    public String getMethodName(@RequestParam String param) {
        return "Hello world";
    }

}
