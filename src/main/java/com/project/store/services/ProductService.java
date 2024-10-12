package com.project.store.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.project.store.domain.Product;
import com.project.store.domain.dtos.ProductCriteriaDto;
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


    public Page<Product> fetchProductsWithSpec(Pageable page, ProductCriteriaDto productCriteriaDTO) {
        if (productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getPrice() == null) {
            return this.productRepository.findAll(page);
        }

        Specification<Product> combinedSpec = Specification.where(null);

        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecification.matchListTarget(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecification.matchListFactory(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        return this.productRepository.findAll(combinedSpec, page);
    }

    // case 6
    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null); 
        for (String p : price) {
            double min = 0;
            double max = 0;

            switch (p) {
                case "less-than-10m" -> {
                    min = 1;
                    max = 10000000;
                }
                case "10m-15m" -> {
                    min = 10000000;
                    max = 15000000;
                }
                case "15m-20m" -> {
                    min = 15000000;
                    max = 20000000;
                }
                case "more-than-20m" -> {
                    min = 20000000;
                    max = 200000000;
                }
            }

            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpecification.matchPrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }

        return combinedSpec;
    }

}
