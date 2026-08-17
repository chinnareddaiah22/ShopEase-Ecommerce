package com.shopease.service;

import com.shopease.model.User;
import com.shopease.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
    private final UserRepository users;
    private final PasswordEncoder encoder;

    public UserService(UserRepository users, PasswordEncoder encoder) {
        this.users=users; this.encoder=encoder;
    }

    @Transactional
    public void register(User user) {
        if (user.getName()==null || user.getName().trim().length()<2)
            throw new IllegalArgumentException("Name must contain at least 2 characters.");
        if (user.getEmail()==null || !user.getEmail().contains("@"))
            throw new IllegalArgumentException("Enter a valid email.");
        if (user.getPassword()==null || user.getPassword().length()<8)
            throw new IllegalArgumentException("Password must contain at least 8 characters.");
        if (users.findByEmail(user.getEmail()) != null)
            throw new IllegalArgumentException("Email is already registered.");

        user.setEmail(user.getEmail().trim().toLowerCase());
        user.setPassword(encoder.encode(user.getPassword()));
        user.setRole("CUSTOMER");
        users.save(user);
    }

    public User findByEmail(String email) { return users.findByEmail(email); }
}
