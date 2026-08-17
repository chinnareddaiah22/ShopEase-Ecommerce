package com.shopease.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopease.model.Product;
import com.shopease.service.ProductService;

@Controller
public class HomeController {

    private final ProductService products;

    public HomeController(ProductService products) {
        this.products = products;
    }

    @GetMapping("/")
    public String home(
            @RequestParam(required = false) String q,
            Model model) {

        model.addAttribute("products", products.search(q));
        model.addAttribute("q", q == null ? "" : q);

        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    // THIS IS THE VIEW DETAILS CONNECTION
    @GetMapping("/product/{id}")
    public String product(
            @PathVariable("id") Long id,
            Model model) {

        Product product = products.find(id);

        if (product == null) {
            return "redirect:/?error=Product+not+found";
        }

        model.addAttribute("product", product);

        return "product-details";
    }
}