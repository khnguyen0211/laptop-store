package com.project.store.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.store.domain.Cart;
import com.project.store.domain.CartDetail;
import com.project.store.domain.User;
import com.project.store.services.CartDetailService;
import com.project.store.services.CartService;
import com.project.store.services.ProductService;
import com.project.store.services.UserService;
import com.project.store.services.UtilsService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class OrderController {

    private final ProductService productService;
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;
    private final UtilsService utilsService;

    public OrderController(CartDetailService cartDetailService, CartService cartService, ProductService productService, UserService userService, UtilsService utilsService) {
        this.cartDetailService = cartDetailService;
        this.cartService = cartService;
        this.productService = productService;
        this.userService = userService;
        this.utilsService = utilsService;
    }

    @PostMapping("/proceed-checkout")
    public String proceedCheckout(Model model, @ModelAttribute("cart") Cart cart, HttpServletRequest request) {
        if (cart == null || cart.getCartDetails().isEmpty()) {
            return "redirect:/cart";
        }
        List<CartDetail> cartDetails = cart.getCartDetails();
        List<CartDetail> realCartDetails = new ArrayList<>();
        User user = this.utilsService.getSessionUser();
        double price_total = 0;
        for (CartDetail cartDetail : cartDetails) {
            CartDetail realCartDetail = this.cartDetailService.handleGetCartDetailById(cartDetail.getId());
            //update cart detail record in database 
            realCartDetail.setQuantity(cartDetail.getQuantity());
            realCartDetail.setPrice_total(cartDetail.getQuantity() * realCartDetail.getProduct().getPrice());
            realCartDetails.add(realCartDetail);
            price_total += realCartDetail.getPrice_total();
        }

        Cart userCart = this.cartService.handleFindCartByUser(user);
        //update price total of cart in database
        userCart.setPrice_total(price_total);

        System.out.println("user cart: " + userCart);

        model.addAttribute("realCartDetails", realCartDetails);
        model.addAttribute("user", user);
        return "client/cart/billing";
    }

    @PostMapping("/place-order")
    public String placeOrder(@RequestParam("orderNote") String orderNote) {
        User user = utilsService.getSessionUser();
        user.getCart().getCartDetails();
        return "hello";
    }

}
