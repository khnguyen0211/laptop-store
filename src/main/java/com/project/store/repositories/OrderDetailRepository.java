package com.project.store.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.store.domain.OrderDetail;

@Repository
public interface  OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    
}
