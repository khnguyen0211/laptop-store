package com.project.store.services;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.project.store.domain.Cart;
import com.project.store.domain.CartDetail;
import com.project.store.domain.User;
import com.project.store.repositories.CartDetailRepository;
import com.project.store.repositories.CartRepository;

@Service()
public class CartService {

    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;

    public CartService(CartRepository cartRepository, CartDetailRepository cartDetailRepository) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
    }

    public Cart handleSaveCart(Cart cart) {
        return this.cartRepository.save(cart);
    }

    public void handleDeleteCart(Cart cart) {
        this.cartRepository.delete(cart);
    }

    public Cart handleFindCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public CartDetail handleSaveCartDetail(CartDetail cartDetail) {
        return this.cartDetailRepository.save(cartDetail);
    }

    public CartDetail handleGetCartDetailById(long id) {
        Optional<CartDetail> optionalCartDetail = this.cartDetailRepository.findById(id);
        if (optionalCartDetail.isPresent()) {
            return optionalCartDetail.get();
        }
        return null;
    }

    public void handleDeleteCartDetail(CartDetail cartDetail) {
        this.cartDetailRepository.delete(cartDetail);
    }
}
