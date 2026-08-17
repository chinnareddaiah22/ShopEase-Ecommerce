package com.shopease.model;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name="ORDER_ITEMS")
public class OrderItem {
    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="orderItemSeq")
    @SequenceGenerator(name="orderItemSeq", sequenceName="ORDER_ITEMS_SEQ", allocationSize=1)
    private Long id;
    
    @Column(name="ORDER_ID") 
    private Long orderId;
    
    @Column(name="PRODUCT_ID") 
    private Long productId;
    
    @Column(name="PRODUCT_NAME") 
    private String productName;
    
    @Column
    private BigDecimal price;
    
    @Column
    private Integer quantity;

    
//    Getters & Setters
	public Long getId() {
		return id;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
   
}
