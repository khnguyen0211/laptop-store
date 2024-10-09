package com.project.store.services.specifications;

import org.springframework.data.jpa.domain.Specification;

import com.project.store.domain.Product;
import com.project.store.domain.Product_;

public class ProductSpecification {

    public static Specification<Product> nameLike(String name) {
        return ((root, criteriaQuery, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%"));
    }

    public static Specification<Product> minPrice(double minPrice) {
        return ((root, criteriaQuery, criteriaBuilder)
                -> criteriaBuilder.greaterThanOrEqualTo(root.get(Product_.PRICE), minPrice));
    }

    public static Specification<Product> maxPrice(double maxPrice) {
        return ((root, criteriaQuery, criteriaBuilder)
                -> criteriaBuilder.lessThanOrEqualTo(root.get(Product_.PRICE), maxPrice));
    }

    public static Specification<Product> findByFactory(String factory) {
        return ((root, criteriaQuery, criteriaBuilder)
                -> criteriaBuilder.equal(root.get(Product_.FACTORY), factory));
    }

    public static Specification<Product> multiFactories(String name) {
        return ((root, criteriaQuery, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%"));
    }
}
