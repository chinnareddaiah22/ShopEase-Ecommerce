package com.shopease.model;

import javax.persistence.*;

@Entity
@Table(name="CART_ITEMS")
public class CartItem {
    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="cartSeq")
    @SequenceGenerator(name="cartSeq", sequenceName="CART_ITEMS_SEQ", allocationSize=1)
    private Long id;
    
    @Column(name="USER_ID") 
    private Long userId;
    
    @Column(name="PRODUCT_ID") 
    private Long productId;
    
    private Integer quantity;

    @Transient 
    private Product product;

    
//    Getters & Setters
	public Long getId() {
		return id;
	}

//	NO Need For Setter ID Beacuase it is Genarated by Hibernate 
//	public void setId(Long id) {
//		this.id = id;
//	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
    
}
