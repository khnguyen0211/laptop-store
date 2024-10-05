package com.project.store.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        if (user.getCart() != null) {
            Cart cart = user.getCart();
            List<CartDetail> cartDetails = cart.getCartDetails();
            boolean isExisted = false;
            for (CartDetail cartDetail : cartDetails) {
                if (cartDetail.getProduct().equals(product)) {
                    cartDetail.increaseQuantity();
                    isExisted = true;
                    break;
                }
            }
            if (!isExisted) {
                CartDetail cartDetail = new CartDetail(product, cart);
                int updatedTotal = cart.increaseTotal();
                session.setAttribute("cart", updatedTotal);
                this.cartDetailService.handleSaveCartDetail(cartDetail);
            }
        } else {
            Cart newCart = new Cart(user);
            int updatedTotal = newCart.increaseTotal();
            session.setAttribute("cart", updatedTotal);
            this.cartService.handleSaveCart(newCart);
            CartDetail cartDetail = new CartDetail(product, newCart);
            this.cartDetailService.handleSaveCartDetail(cartDetail);
        }
        return "redirect:/?loading=true";
    }

    @GetMapping(value = "/cart")
    public String renderCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return "redirect:/";
        }
        String userEmail = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(userEmail);
        if (user == null) {
            return "redirect:/";
        }
        List<CartDetail> cartDetails = new ArrayList<>();
        if (user.getCart() != null) {
            cartDetails = user.getCart().getCartDetails();
        }
        int priceTotal = 0;
        for (CartDetail cartDetail : cartDetails) {
            priceTotal += cartDetail.getPrice_total();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("priceTotal", priceTotal);
        return "client/cart/cart";
    }

    @PostMapping(value = "/cart-detail/{id}")
    public String deleteCartDetail(Model model,
            HttpServletRequest request,
            @PathVariable("id") long cartDetailId) {
        CartDetail cartDetail = this.cartDetailService.handleGetCartDetailById(cartDetailId);
        if (cartDetail == null) {
            return "redirect:/cart";
        }
        this.cartDetailService.handleDeleteCartDetail(cartDetail);
        Cart cart = cartDetail.getCart();
        cart.decreaseTotal();

        HttpSession session = request.getSession(false);
        if (session == null) {
            return "redirect:/";
        }
        int product_total = (int) session.getAttribute("cart");
        product_total--;
        session.setAttribute("cart", product_total);
        return "redirect:/cart";
    }

    @GetMapping(value = "/billing")
    public String renderBillingPage(Model model) {
        return "client/cart/billing";
    }

}
