package com.project.store.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.store.domain.Cart;

@Repository()
public interface CartRepository extends JpaRepository<Cart, Long> {

}
