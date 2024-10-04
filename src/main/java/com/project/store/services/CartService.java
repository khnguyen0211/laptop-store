package com.project.store.services;

import org.springframework.stereotype.Service;

import com.project.store.domain.Cart;
import com.project.store.repositories.CartRepository;

@Service()
public class CartService {

    private final CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public Cart handleSaveCart(Cart cart) {
        return this.cartRepository.save(cart);
    }

}
