package com.project.store.services.specifications;

import org.springframework.data.jpa.domain.Specification;

import com.project.store.constants.Constant;
import com.project.store.domain.Order;
import com.project.store.domain.Order_;
import com.project.store.domain.User;

public class OrderSpecification {

    public static Specification<Order> statusFilter() {
        return (root, query, criteriaBuilder) -> criteriaBuilder.notEqual(root.get(Order_.STATUS), Constant.DELETED);
    }

    public static Specification<Order> userFilter(User user) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(Order_.USER), user);
    }

}
