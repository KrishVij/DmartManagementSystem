package org.example.Bean;

import java.util.Date;

public class Order {

    private long orderId;

    private Date date;

    private long totalAmount;

    public Order() {
    }

    public Order(long orderId, Date date, long totalAmount) {
        this.orderId = orderId;
        this.date = date;
        this.totalAmount = totalAmount;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public long getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(long totalAmount) {
        this.totalAmount = totalAmount;
    }
}
