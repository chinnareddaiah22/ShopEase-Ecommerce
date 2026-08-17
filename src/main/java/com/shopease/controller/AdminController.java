package com.shopease.controller;

import com.shopease.model.Product;
import com.shopease.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final ProductService products;
    private final OrderService orders;

    public AdminController(ProductService products,OrderService orders){this.products=products;this.orders=orders;}

    @GetMapping public String dashboard(Model m){m.addAttribute("products",products.all());m.addAttribute("orders",orders.allOrders());return "admin/dashboard";}

    @GetMapping("/products")
    public String productList(Model m){m.addAttribute("products",products.all());return "admin/products";}

    @GetMapping("/products/new")
    public String newProduct(Model m){m.addAttribute("product",new Product());return "admin/product-form";}

    @GetMapping("/products/edit/{id}")
    public String edit(@PathVariable Long id,Model m){m.addAttribute("product",products.find(id));return "admin/product-form";}

    @PostMapping("/products/save")
    public String save(@ModelAttribute Product p,Model m){
        try{products.save(p);return "redirect:/admin/products";}
        catch(IllegalArgumentException e){m.addAttribute("error",e.getMessage());m.addAttribute("product",p);return "admin/product-form";}
    }

    @PostMapping("/products/deactivate/{id}")
    public String deactivate(@PathVariable Long id){products.deactivate(id);return "redirect:/admin/products";}

    @GetMapping("/orders")
    public String orderList(Model m){m.addAttribute("orders",orders.allOrders());return "admin/orders";}

    @PostMapping("/orders/status")
    public String status(@RequestParam Long orderId,@RequestParam String status){
        orders.updateStatus(orderId,status);return "redirect:/admin/orders";
    }
}
