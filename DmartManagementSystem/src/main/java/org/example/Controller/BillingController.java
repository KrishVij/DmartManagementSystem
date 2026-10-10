package org.example.Controller;

import org.example.Repository.ProductRepository;
import org.example.Service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BillingController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductServiceImpl productServiceImpl;

    @GetMapping("/Pos")
    public String billingPage(Model model) {

        model.addAttribute("Product", productServiceImpl.findAll());

        return "/owner/includes/billing";
    }


}
