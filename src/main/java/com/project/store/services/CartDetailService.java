package com.project.store.services;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.project.store.domain.CartDetail;
import com.project.store.repositories.CartDetailRepository;

@Service()
public class CartDetailService {

    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
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
