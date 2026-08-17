package com.shopease.controller;

import com.shopease.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.security.Principal;

@Controller
public class CheckoutController {
    private final CartService cart;
    private final UserService users;

    public CheckoutController(CartService cart,UserService users){this.cart=cart;this.users=users;}

    @GetMapping("/checkout-page")
    public String page(Principal p,Model m){
        Long id=users.findByEmail(p.getName()).getId();
        m.addAttribute("items",cart.items(id));
        m.addAttribute("total",cart.total(id));
        return "checkout";
    }
}
