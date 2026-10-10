package org.example.Bean;

public class Product {

    private long productId;

    private String productName;

    private String category;

    private long stockQuantityLeft;

    private double pricePerUnit;

    public Product() {

    }

    public Product(long productId, String productName, String category, long stockQuantityLeft, double pricePerUnit) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
        this.stockQuantityLeft = stockQuantityLeft;
        this.pricePerUnit = pricePerUnit;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public long getStockQuantityLeft() {
        return stockQuantityLeft;
    }

    public void setStockQuantityLeft(long stockQuantityLeft) {
        this.stockQuantityLeft = stockQuantityLeft;
    }

    public double getPricePerUnit() {
        return pricePerUnit;
    }

    public void setPricePerUnit(double pricePerUnit) {
        this.pricePerUnit = pricePerUnit;
    }
}
