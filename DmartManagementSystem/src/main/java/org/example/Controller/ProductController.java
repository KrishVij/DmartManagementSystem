package org.example.Controller;


import org.example.Bean.Product;
import org.example.Entity.ProductEntity;
import org.example.Repository.ProductRepository;
import org.example.Service.ProductService;
import org.example.Service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductServiceImpl productServiceImpl;

    @GetMapping("/Products")
    public String productList(Model model) {

        model.addAttribute("products", productRepository.findAll());
        return "owner/includes/products";
    }

    @PostMapping("/Products/save")
    public String saveProduct(@ModelAttribute Product product) {

        productRepository.save(productServiceImpl.convertProductBeanToProductEntity(product));
         return "redirect:/Products";
    }

    @GetMapping("/Products/edit")
    public String editProductDetails(@RequestParam("id")Long id, Model model) {

        ProductEntity productEntity = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found with id: " + id));

        Product product = productServiceImpl.convertProductEntityToProductBean(productEntity);

        model.addAttribute("product", product);
        return "owner/includes/edit";
    }

    @GetMapping("/Products/delete")
    public String deleteProduct(@RequestParam("id")Long id) {

        productRepository.deleteById(id);
        return "redirect:/Products";
    }
}
