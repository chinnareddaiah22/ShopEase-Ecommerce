package com.shopease.service;

import com.shopease.model.*;
import javax.persistence.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.math.BigDecimal;
import java.util.List;

@Service
public class OrderService {
    @PersistenceContext private EntityManager em;
    private final CartService cart;

    public OrderService(CartService cart){this.cart=cart;}

    @Transactional
    public Long checkout(Long userId) {
        List<CartItem> items=cart.items(userId);
        if(items.isEmpty()) throw new IllegalArgumentException("Your cart is empty.");

        BigDecimal total=BigDecimal.ZERO;
        for(CartItem c:items){
            Product p=c.getProduct();
            if(p==null || p.getActive()!=1) throw new IllegalArgumentException("A product is unavailable.");
            if(c.getQuantity()>p.getStock()) throw new IllegalArgumentException("Stock changed for "+p.getName()+".");
            total=total.add(p.getPrice().multiply(BigDecimal.valueOf(c.getQuantity())));
        }

        Order order=new Order();
        order.setUserId(userId); order.setTotalAmount(total); order.setStatus("PLACED");
        em.persist(order); em.flush();

        for(CartItem c:items){
            Product p=c.getProduct();
            p.setStock(p.getStock()-c.getQuantity());
            em.merge(p);

            OrderItem oi=new OrderItem();
            oi.setOrderId(order.getId()); oi.setProductId(p.getId());
            oi.setProductName(p.getName()); oi.setPrice(p.getPrice()); oi.setQuantity(c.getQuantity());
            em.persist(oi);
        }
        cart.clear(userId);
        return order.getId();
    }

    public List<Order> userOrders(Long userId){
        return em.createQuery("from Order o where o.userId=:u order by o.id desc",Order.class)
                .setParameter("u",userId).getResultList();
    }

    public List<Order> allOrders(){
        return em.createQuery("from Order o order by o.id desc",Order.class).getResultList();
    }

    @Transactional
    public void updateStatus(Long id,String status){
        if(!List.of("PLACED","PACKED","SHIPPED","DELIVERED","CANCELLED").contains(status))
            throw new IllegalArgumentException("Invalid order status.");
        Order o=em.find(Order.class,id);
        if(o==null) throw new IllegalArgumentException("Order not found.");
        o.setStatus(status);
    }
}
