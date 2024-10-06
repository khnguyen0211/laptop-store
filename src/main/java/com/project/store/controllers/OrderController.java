package com.project.store.controllers;

import org.springframework.stereotype.Controller;

import com.project.store.services.CartDetailService;
import com.project.store.services.CartService;
import com.project.store.services.ProductService;
import com.project.store.services.UserService;

@Controller
public class OrderController {

    private final ProductService productService;
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;

    public OrderController(CartDetailService cartDetailService, CartService cartService, ProductService productService, UserService userService) {
        this.cartDetailService = cartDetailService;
        this.cartService = cartService;
        this.productService = productService;
        this.userService = userService;
    }
}
