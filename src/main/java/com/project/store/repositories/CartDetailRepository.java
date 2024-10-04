package com.project.store.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.store.domain.CartDetail;

@Repository()
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {

}
