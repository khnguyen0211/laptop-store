package com.project.store.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.store.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    @Override
    public Page<Product> findAll(Pageable pageable);
    
}
