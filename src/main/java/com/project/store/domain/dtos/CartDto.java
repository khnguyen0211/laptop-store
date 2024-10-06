package com.project.store.domain.dtos;

public class CartDto {

    private long productId;
    private long productQuantity;

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public long getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(long productQuantity) {
        this.productQuantity = productQuantity;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CartDto{");
        sb.append("productId=").append(productId);
        sb.append(", productQuantity=").append(productQuantity);
        sb.append('}');
        return sb.toString();
    }

}
