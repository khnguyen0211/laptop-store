package com.project.store.services;

import java.util.List;

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
}
