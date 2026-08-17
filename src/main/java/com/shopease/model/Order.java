package com.shopease.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name="ORDERS")
public class Order {
    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="orderSeq")
    @SequenceGenerator(name="orderSeq", sequenceName="ORDERS_SEQ", allocationSize=1)
    private Long id;
    
    @Column(name="USER_ID") 
    private Long userId;
    
    @Column(name="TOTAL_AMOUNT") 
    private BigDecimal totalAmount;
    
    @Column
    private String status;
    
    @Column(name="ORDER_DATE") 
    private LocalDateTime orderDate;

    
//    Getters & Setters
	public Long getId() {
		return id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public LocalDateTime getOrderDate() {
		return orderDate;
	}
   
}
