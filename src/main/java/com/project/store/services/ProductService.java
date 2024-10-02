package com.project.store.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.project.store.domain.Product;
import com.project.store.repositories.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> handleFindAllProduct() {
        return this.productRepository.findAll();
    }

    public Product handleGetProductById(long id) {
        Optional<Product> optionalProduct = this.productRepository.findById(id);
        if (!optionalProduct.isPresent()) {
            return null;
        }
        return optionalProduct.get();
    }
}
