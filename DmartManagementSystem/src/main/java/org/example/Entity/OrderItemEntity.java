package org.example.Entity;


import javax.persistence.*;

@Entity
public class OrderItemEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long orderItemId;

    @ManyToOne
    private OrderEntity orderEntity;

    @ManyToOne
    private ProductEntity productEntity;

    public OrderItemEntity() {
    }

    public OrderItemEntity(long orderItemId, OrderEntity orderEntity, ProductEntity productEntity) {
        this.orderItemId = orderItemId;
        this.orderEntity = orderEntity;
        this.productEntity = productEntity;
    }

    public long getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(long orderItemId) {
        this.orderItemId = orderItemId;
    }

    public OrderEntity getOrderEntity() {
        return orderEntity;
    }

    public void setOrderEntity(OrderEntity orderEntity) {
        this.orderEntity = orderEntity;
    }

    public ProductEntity getProductEntity() {
        return productEntity;
    }

    public void setProductEntity(ProductEntity productEntity) {
        this.productEntity = productEntity;
    }
}
