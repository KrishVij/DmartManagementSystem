package org.example.Service;

import org.example.Bean.Product;
import org.example.Entity.ProductEntity;
import org.example.Repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductRepository productRepository;

    private List<Product> productList = new ArrayList<>();

    public ProductEntity convertProductBeanToProductEntity(Product product) {

        ProductEntity productEntity = new ProductEntity(product.getProductId(), product.getProductName(),
                                                        product.getCategory(), product.getStockQuantityLeft(),
                                                        product.getPricePerUnit());

        return productEntity;
    }

    public Product convertProductEntityToProductBean(ProductEntity productEntity) {

        return new Product(productEntity.getProductId(), productEntity.getProductName(),
                productEntity.getCategory(), productEntity.getStockQuantityLeft(),
                productEntity.getPricePerUnit());
    }

    @Override
    public Product save(Product product) {

        productRepository.save(convertProductBeanToProductEntity(product));
        return product;
    }

    @Override
    public Product findById(Long id) {

        Optional<ProductEntity> optionalProduct = productRepository.findById(id);

        if (optionalProduct.isPresent()) {
            return convertProductEntityToProductBean(optionalProduct.get());
        } else {
            throw new RuntimeException("Product not found: " + id);
        }
    }

    @Override
    public List<Product> findAll() {

        List<ProductEntity> productEntityList = productRepository.findAll();

        for (ProductEntity productEntity : productEntityList) {

            productList.add(convertProductEntityToProductBean(productEntity));
        }

        return productList;
    }

    @Override
    public void deleteById(Long id) {

        productRepository.deleteById(id);
    }
}
