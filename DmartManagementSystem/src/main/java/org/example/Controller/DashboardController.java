package org.example.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Collections;

@Controller
public class DashboardController {

    @GetMapping("/Dashboard")
    public String homeDashboard(Model model) {

        model.addAttribute("todaySales", 0);
        model.addAttribute("pendingOrdersCount", 0);
        model.addAttribute("lowStockCount", 0);
        model.addAttribute("totalProductsCount", 0);
        model.addAttribute("pendingOrders", Collections.emptyList());
        return "/owner/includes/dashboard";
    }

}
