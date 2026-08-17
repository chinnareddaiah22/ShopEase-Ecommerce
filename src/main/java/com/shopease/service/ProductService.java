package com.shopease.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shopease.model.Product;
import com.shopease.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository repo;

    public ProductService(ProductRepository repo) {
        this.repo = repo;
    }

    public List<Product> search(String keyword) {
        return repo.findActive(keyword);
    }

    public List<Product> all() {
        return repo.findAll();
    }

    public Product find(Long id) {
        return repo.find(id);
    }

    @Transactional
    public void seedIfEmpty() {

        seedOrUpdate(
                "Aura Wireless Headphones",
                "Premium over-ear Bluetooth headphones with rich sound and long battery life.",
                2499,
                25,
                "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "MechPro RGB Keyboard",
                "Mechanical keyboard with tactile switches, RGB lighting and a compact layout.",
                2999,
                18,
                "https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Pulse Smart Watch",
                "Modern smartwatch with fitness tracking, notifications and a bright display.",
                3499,
                20,
                "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Urban Laptop Backpack",
                "Water-resistant everyday backpack with laptop sleeve and travel compartments.",
                1799,
                30,
                "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Nova Running Shoes",
                "Lightweight everyday running shoes designed for comfort and all-day movement.",
                2299,
                24,
                "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Studio Bluetooth Speaker",
                "Compact wireless speaker with powerful audio for home and travel.",
                1999,
                16,
                "https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Vision 4K Monitor",
                "27-inch 4K monitor for work, coding, design and entertainment.",
                18999,
                10,
                "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Flex USB-C Hub",
                "7-in-1 USB-C hub with HDMI, USB ports, SD card and fast charging.",
                1499,
                35,
                "https://images.unsplash.com/photo-1625842268584-8f3296236761?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Rose Casual Dress",
                "Comfortable everyday dress with a clean modern fit.",
                1599,
                20,
                "https://images.unsplash.com/photo-1595777457583-95e059d581b8?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Midnight Party Dress",
                "Elegant party dress for evening occasions and celebrations.",
                2499,
                15,
                "https://images.unsplash.com/photo-1566174053879-31528523f8ae?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Classic Summer Dress",
                "Lightweight summer dress made for comfortable casual wear.",
                1299,
                25,
                "https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Nova X5 Mobile",
                "5G smartphone with a bright display, dual camera and all-day battery.",
                15999,
                12,
                "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "PixelMax Pro Mobile",
                "Performance-focused smartphone with fast charging and a sharp camera.",
                22999,
                10,
                "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "SmartOne Lite Mobile",
                "Affordable smartphone for everyday calls, apps and entertainment.",
                8999,
                18,
                "https://images.unsplash.com/photo-1556656793-08538906a9f8?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "Sprint Pro Sports Shoes",
                "Lightweight running shoes with cushioned support for daily training.",
                2199,
                22,
                "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "CourtFlex Sports Shoes",
                "Comfortable sports shoes designed for court and indoor training.",
                2399,
                18,
                "https://images.unsplash.com/photo-1552346154-21d32810aba3?auto=format&fit=crop&w=1200&q=85"
        );

        seedOrUpdate(
                "TrailGrip Sports Shoes",
                "Durable sports shoes with extra grip for outdoor activities.",
                2699,
                16,
                "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=1200&q=85"
        );
    }

    private void seedOrUpdate(
            String name,
            String description,
            int price,
            int stock,
            String image) {

        Product existing = repo.findByName(name);

        if (existing == null) {

            Product p = new Product();

            p.setName(name);
            p.setDescription(description);
            p.setPrice(BigDecimal.valueOf(price));
            p.setStock(stock);
            p.setImageUrl(image);
            p.setActive(1);

            repo.save(p);

        } else {

            existing.setDescription(description);
            existing.setPrice(BigDecimal.valueOf(price));
            existing.setStock(stock);
            existing.setImageUrl(image);
            existing.setActive(1);

            repo.save(existing);
        }
    }

    @Transactional
    public void save(Product p) {

        if (p.getName() == null ||
            p.getName().trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Product name required.");
        }

        if (p.getPrice() == null ||
            p.getPrice().compareTo(BigDecimal.ZERO) < 0) {

            throw new IllegalArgumentException(
                    "Invalid price.");
        }

        if (p.getStock() == null ||
            p.getStock() < 0) {

            throw new IllegalArgumentException(
                    "Invalid stock.");
        }

        if (p.getImageUrl() == null ||
            p.getImageUrl().trim().isEmpty()) {

            p.setImageUrl(
                    "/images/product-default.svg"
            );
        }

        if (p.getActive() == null) {
            p.setActive(1);
        }

        repo.save(p);
    }

    @Transactional
    public void deactivate(Long id) {

        Product p = repo.find(id);

        if (p != null) {
            p.setActive(0);
            repo.save(p);
        }
    }
}