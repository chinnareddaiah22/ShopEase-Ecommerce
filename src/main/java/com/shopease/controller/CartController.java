package com.shopease.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopease.service.CartService;
import com.shopease.service.UserService;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final CartService cart;
    private final UserService users;

    public CartController(CartService cart, UserService users) {
        this.cart = cart;
        this.users = users;
    }

    // =========================
    // GET USER ID
    // =========================

    private Long userId(Principal principal) {

        if (principal == null) {
            return null;
        }

        return users.findByEmail(principal.getName()).getId();
    }


    // =========================
    // VIEW CART
    // =========================

    @GetMapping
    public String view(Principal principal, Model model) {

        if (principal == null) {
            return "redirect:/login";
        }

        Long id = userId(principal);

        model.addAttribute(
            "items",
            cart.items(id)
        );

        model.addAttribute(
            "total",
            cart.total(id)
        );

        return "cart";
    }


    // =========================
    // ADD TO CART
    // =========================

    @PostMapping("/add")
    public String add(
            @RequestParam Long productId,
            @RequestParam(defaultValue = "1") int quantity,
            Principal principal) {

        if (principal == null) {
            return "redirect:/login";
        }

        try {

            cart.add(
                userId(principal),
                productId,
                quantity
            );

            return "redirect:/cart";

        } catch (IllegalArgumentException e) {

            return "redirect:/?error=" + e.getMessage();
        }
    }


    // =========================
    // UPDATE CART
    // =========================

    @PostMapping("/update")
    public String update(
            @RequestParam Long productId,
            @RequestParam int quantity,
            Principal principal) {

        if (principal == null) {
            return "redirect:/login";
        }

        try {

            cart.update(
                userId(principal),
                productId,
                quantity
            );

        } catch (IllegalArgumentException ignored) {
        }

        return "redirect:/cart";
    }


    // =========================
    // REMOVE FROM CART
    // =========================

    @PostMapping("/remove")
    public String remove(
            @RequestParam Long productId,
            Principal principal) {

        if (principal == null) {
            return "redirect:/login";
        }

        cart.remove(
            userId(principal),
            productId
        );

        return "redirect:/cart";
    }

}