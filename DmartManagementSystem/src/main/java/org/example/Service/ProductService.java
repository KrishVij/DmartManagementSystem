package org.example.Service;

import org.example.Bean.Product;

import java.util.List;

public interface ProductService {

    public Product save(Product product);
    public Product findById(Long id);
    public List<Product> findAll();
    void deleteById(Long id);

}
