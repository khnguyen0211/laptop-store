package com.project.store.services;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.project.store.domain.Product;
import com.project.store.repositories.ProductRepository;
import com.project.store.services.specifications.ProductSpecification;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Page<Product> handleFindAllProduct(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public Page<Product> handleFindAllProductSpec(Pageable pageable, String name) {
        return this.productRepository.findAll(ProductSpecification.nameLike(name), pageable);
    }

    public Page<Product> handleFindAllProductSpec(Pageable pageable, Double minPrice) {
        return this.productRepository.findAll(ProductSpecification.maxPrice(minPrice), pageable);
    }

    public Product handleFindProductById(long id) {
        Optional<Product> optionalProduct = this.productRepository.findById(id);
        if (!optionalProduct.isPresent()) {
            return null;
        }
        return optionalProduct.get();
    }

}
