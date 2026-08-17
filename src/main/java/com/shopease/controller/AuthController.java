package com.shopease.controller;

import com.shopease.model.User;
import com.shopease.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    private final UserService users;

    public AuthController(UserService users) {
        this.users = users;
    }

    // REGISTER PAGE
    @GetMapping("/register")
    public String page(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    // REGISTER USER
    @PostMapping("/register")
    public String register(
            @ModelAttribute User user,
            Model model) {

        try {
            users.register(user);
            return "redirect:/login?registered";

        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "register";
        }
    }
}