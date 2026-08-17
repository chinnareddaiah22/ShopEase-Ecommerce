package com.shopease.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.shopease.model.Product;

@Repository
public class ProductRepository {

    @PersistenceContext
    private EntityManager em;

//    // Search Active Products Method
    public List<Product> findActive(String keyword) {

        String k = keyword == null ? "" : keyword.trim().toLowerCase();

        return em.createQuery(
                "select p from Product p " +
                "where p.active = 1 and " +
                "(lower(p.name) like :k or lower(p.description) like :k) " +
                "order by p.id desc",
                Product.class)
                .setParameter("k", "%" + k + "%")
                .getResultList();
    }

//    Find All Products Method
    public List<Product> findAll() {

        return em.createQuery(
                "from Product p order by p.id desc",
                Product.class)
                .getResultList();
    }

//     Find Product by Specific ID
    public Product find(Long id) {

        return em.find(Product.class, id);
    }

//     Find a Single Product by Name
    public Product findByName(String name) {

        List<Product> results = em.createQuery(
                "select p from Product p " +
                "where lower(p.name) = :name",
                Product.class)
                .setParameter("name", name.toLowerCase())
                .setMaxResults(1)
                .getResultList();

        return results.isEmpty() ? null : results.get(0);
    }

//    Check whether a Product with the given name already exists
    public boolean existsByName(String name) {

        return em.createQuery(
                "select count(p) from Product p " +
                "where lower(p.name) = :name",
                Long.class)
                .setParameter("name", name.toLowerCase())
                .getSingleResult() > 0;
    }

// 	If the ID is null, persist a new Product
// 	Otherwise, merge the existing Product
    public void save(Product p) {

        if (p.getId() == null) {
            em.persist(p);
        } else {
            em.merge(p);
        }
    }
}