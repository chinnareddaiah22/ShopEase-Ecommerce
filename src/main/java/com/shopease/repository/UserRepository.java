package com.shopease.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.shopease.model.User;

@Repository
public class UserRepository {

    @PersistenceContext
    private EntityManager em;

    public User findByEmail(String email) {

        if (email == null || email.trim().isEmpty()) {
            return null;
        }

        List<User> results = em.createQuery(
                "select u from User u " +
                "where lower(u.email) = lower(:email)",
                User.class)
                .setParameter("email", email.trim())
                .setMaxResults(1)
                .getResultList();

        return results.isEmpty() ? null : results.get(0);
    }

    public User find(Long id) {
        return em.find(User.class, id);
    }

    public void save(User user) {
        em.persist(user);
    }
}