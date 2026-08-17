package com.shopease.controller;

import com.shopease.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.security.Principal;

@Controller
public class OrderController {
    private final OrderService orders;
    private final UserService users;
    public OrderController(OrderService orders, UserService users){this.orders=orders;this.users=users;}

    private Long userId(Principal p){ return p==null ? null : users.findByEmail(p.getName()).getId(); }

    @PostMapping("/checkout")
    public String place(@RequestParam(defaultValue="UPI") String paymentMethod, Principal p, Model m) {
        if(p==null) return "redirect:/login";
        if(!java.util.List.of("UPI","CARD","COD").contains(paymentMethod)) {
            m.addAttribute("error","Please choose a valid payment method.");
            return "checkout";
        }
        try {
            Long orderId=orders.checkout(userId(p));
            m.addAttribute("orderId",orderId);
            m.addAttribute("paymentMethod",paymentMethod);
            return "order-success";
        } catch(IllegalArgumentException e) {
            m.addAttribute("error",e.getMessage());
            return "checkout";
        }
    }

    @GetMapping("/orders")
    public String history(Principal p, Model m) {
        if(p==null) return "redirect:/login";
        m.addAttribute("orders",orders.userOrders(userId(p)));
        return "orders";
    }
}
