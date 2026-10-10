package org.example.Controller;

import org.example.Repository.ProductRepository;
import org.example.Service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CustomerController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductServiceImpl productServiceImpl;

    @GetMapping("/cd")
    public String customerDashboard() {

        return "owner/includes/CustomerDashboard";
    }

    @GetMapping("/cd/Products")
    public String showProductList(Model model) {

        model.addAttribute("products", productRepository.findAll());
        return "owner/includes/CustomerProducts";
    }

    @PostMapping("/cd/Pos")
    public String showPos(Model model) {

        return "owner/includes/CustomerPos";
    }
}
