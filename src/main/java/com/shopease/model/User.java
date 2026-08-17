package com.shopease.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="APP_USERS")
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="userSeq")
    @SequenceGenerator(name="userSeq", sequenceName="APP_USERS_SEQ", allocationSize=1)
    private Long id;
    
    @Column
    private String name;
    
    @Column(unique=true, nullable=false) 
    private String email;
    
    @Column(nullable=false)
    private String password;
    
    @Column
    private String role = "CUSTOMER";
    
    @Column(name="CREATED_AT")
    private LocalDateTime createdAt;
    
    
//    Getters & Setters 
    
	public Long getId() {
		return id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

}
