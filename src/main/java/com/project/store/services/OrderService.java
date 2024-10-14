package com.project.store.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.project.store.domain.Order;
import com.project.store.domain.OrderDetail;
import com.project.store.domain.User;
import com.project.store.repositories.OrderDetailRepository;
import com.project.store.repositories.OrderRepository;
import com.project.store.services.specifications.OrderSpecification;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderDetailRepository orderDetailRepository, OrderRepository orderRepository) {
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
    }

    public Page<Order> handleGetOrdersByUser(User user, Pageable pageable) {
        Specification<Order> combinedSpec = Specification.where(null);
        combinedSpec = combinedSpec.and(OrderSpecification.userFilter(user));
        combinedSpec = combinedSpec.and(OrderSpecification.statusFilter());
        return this.orderRepository.findAll(combinedSpec, pageable);
    }

    public OrderDetail handleSaveOrderDetail(OrderDetail orderDetail) {
        return this.orderDetailRepository.save(orderDetail);
    }

    public Order handleSaveOrder(Order order) {
        return this.orderRepository.save(order);
    }

    public void handleDeleteOrderById(long id) {
        Order order = handleFindOrderById(id);
        if (order != null) {
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                handleDeleteOrderDetail(orderDetail);
            }
            this.orderRepository.delete(order);
        }
    }

    public Order handleFindOrderById(long id) {
        Optional<Order> optionalOrder = this.orderRepository.findById(id);
        if (optionalOrder.isPresent()) {
            return optionalOrder.get();
        }
        return null;
    }

    public void handleDeleteOrderDetail(OrderDetail orderDetail) {
        this.orderDetailRepository.delete(orderDetail);
    }

    public Page<Order> handleGetAllOrder(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

}
