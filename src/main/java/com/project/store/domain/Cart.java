package com.project.store.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "carts")
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToMany(mappedBy = "cart")
    private List<CartDetail> cartDetails;

    private int product_total = 0;

    private int price_total = 0;

    @OneToOne()
    @JoinColumn(name = "user_id")
    private User user;

    public Cart(User user) {
        this.user = user;
    }

    public Cart() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getProduct_total() {
        return product_total;
    }

    public List<CartDetail> getCartDetails() {
        return cartDetails;
    }

    public void setCartDetails(List<CartDetail> cartDetails) {
        this.cartDetails = cartDetails;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int increaseTotal() {
        this.product_total++;
        return this.product_total;
    }

    public int decreaseTotal() {
        this.product_total--;
        return this.product_total;
    }

    public int getPrice_total() {
        return price_total;
    }

    public void setPrice_total(int price_total) {
        this.price_total = price_total;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Cart{");
        sb.append("id=").append(id);
        sb.append(", product_total=").append(product_total);
        sb.append(", price_total=").append(price_total);
        sb.append(", user=").append(user);
        sb.append('}');
        return sb.toString();
    }

}
