package com.project.store.controllers.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.store.domain.Cart;
import com.project.store.domain.CartDetail;
import com.project.store.domain.Product;
import com.project.store.domain.User;
import com.project.store.services.CartDetailService;
import com.project.store.services.CartService;
import com.project.store.services.ProductService;
import com.project.store.services.UserService;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

    private final ProductService productService;
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;

    public CartController(CartDetailService cartDetailService, CartService cartService, ProductService productService, UserService userService) {
        this.cartDetailService = cartDetailService;
        this.cartService = cartService;
        this.productService = productService;
        this.userService = userService;
    }

    @PostMapping(value = "/carts/{id}")
    public String addToCart(Model model, @PathVariable("id") long productId, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return "redirect:/";
        }
        String userEmail = (String) session.getAttribute("email");
        Product product = this.productService.handleFindProductById(productId);
        User user = this.userService.getUserByEmail(userEmail);
        Cart cart = new Cart(user, 1);
        CartDetail cartDetail = new CartDetail(product, cart);
        this.cartService.handleSaveCart(cart);
        return "redirect:/";
    }

    @GetMapping(value = "/cart")
    public String renderCartPage(Model model) {
        return "client/cart/cart";
    }

    @GetMapping(value = "/billing")
    public String renderBillingPage(Model model) {
        return "client/cart/billing";
    }

}
