package com.shopease.service;

import com.shopease.model.CartItem;
import com.shopease.model.Product;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CartService {

    @PersistenceContext
    private EntityManager em;

    public List<CartItem> items(Long userId) {

        List<CartItem> list = em.createQuery(
                "from CartItem c where c.userId = :u order by c.id",
                CartItem.class)
                .setParameter("u", userId)
                .getResultList();

        for (CartItem c : list) {
            c.setProduct(em.find(Product.class, c.getProductId()));
        }

        return list;
    }

    @Transactional
    public void add(Long userId, Long productId, int quantity) {

        if (quantity < 1 || quantity > 99) {
            throw new IllegalArgumentException(
                    "Quantity must be 1 to 99.");
        }

        Product p = em.find(Product.class, productId);

        if (p == null || p.getActive() != 1) {
            throw new IllegalArgumentException(
                    "Product is unavailable.");
        }

        /*
         * Find existing cart item.
         * Using getResultList() instead of getResultStream()
         * for better compatibility with the current
         * Hibernate + Oracle setup.
         */
        List<CartItem> results = em.createQuery(
                "from CartItem c " +
                "where c.userId = :u and c.productId = :p",
                CartItem.class)
                .setParameter("u", userId)
                .setParameter("p", productId)
                .setMaxResults(1)
                .getResultList();

        CartItem item = results.isEmpty()
                ? null
                : results.get(0);

        int newQty = quantity;

        if (item != null) {
            newQty += item.getQuantity();
        }

        if (newQty > p.getStock()) {
            throw new IllegalArgumentException(
                    "Not enough stock.");
        }

        if (item == null) {

            item = new CartItem();

            item.setUserId(userId);
            item.setProductId(productId);
            item.setQuantity(quantity);

            em.persist(item);

        } else {

            item.setQuantity(newQty);
        }
    }

    @Transactional
    public void update(
            Long userId,
            Long productId,
            int quantity) {

        if (quantity < 1 || quantity > 99) {
            throw new IllegalArgumentException(
                    "Invalid quantity.");
        }

        Product p = em.find(Product.class, productId);

        if (p == null || quantity > p.getStock()) {
            throw new IllegalArgumentException(
                    "Not enough stock.");
        }

        /*
         * Find existing cart item.
         */
        List<CartItem> results = em.createQuery(
                "from CartItem c " +
                "where c.userId = :u and c.productId = :p",
                CartItem.class)
                .setParameter("u", userId)
                .setParameter("p", productId)
                .setMaxResults(1)
                .getResultList();

        CartItem item = results.isEmpty()
                ? null
                : results.get(0);

        if (item == null) {
            throw new IllegalArgumentException(
                    "Cart item not found.");
        }

        item.setQuantity(quantity);
    }

    @Transactional
    public void remove(
            Long userId,
            Long productId) {

        em.createQuery(
                "delete from CartItem c " +
                "where c.userId = :u and c.productId = :p")
                .setParameter("u", userId)
                .setParameter("p", productId)
                .executeUpdate();
    }

    @Transactional
    public void clear(Long userId) {

        em.createQuery(
                "delete from CartItem c " +
                "where c.userId = :u")
                .setParameter("u", userId)
                .executeUpdate();
    }

    public BigDecimal total(Long userId) {

        BigDecimal total = BigDecimal.ZERO;

        for (CartItem c : items(userId)) {

            if (c.getProduct() != null
                    && c.getProduct().getPrice() != null) {

                total = total.add(
                        c.getProduct()
                                .getPrice()
                                .multiply(
                                        BigDecimal.valueOf(
                                                c.getQuantity()
                                        )
                                )
                );
            }
        }

        return total;
    }
}