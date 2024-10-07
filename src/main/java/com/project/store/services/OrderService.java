package com.project.store.services;

import org.springframework.stereotype.Service;

import com.project.store.domain.Order;
import com.project.store.domain.OrderDetail;
import com.project.store.repositories.OrderDetailRepository;
import com.project.store.repositories.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderDetailRepository orderDetailRepository, OrderRepository orderRepository) {
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
    }


    public OrderDetail handleSaveOrderDetail(OrderDetail orderDetail) {
        return this.orderDetailRepository.save(orderDetail);
    }

    public Order handleSaveOrder(Order order) {
        return this.orderRepository.save(order);
    }
}
