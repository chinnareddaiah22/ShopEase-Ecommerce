# 🛒 ShopEase

ShopEase is a Java-based e-commerce web application built using **Spring MVC, Spring Security, Hibernate, Oracle Database, JSP, HTML, CSS, and JavaScript**.

The project implements user authentication, product browsing, shopping cart management, checkout, order management, and admin product/order management.

---

## 🚀 Features

### 👤 User Features

* User registration
* User login
* User authentication
* Product catalog
* Product search
* Product details
* Add products to cart
* Update cart items
* Remove cart items
* Checkout
* Payment selection
* Order creation
* Order history
* Order success page
* User logout

### 🛠️ Admin Features

The project contains an admin section for managing the application.

* Admin dashboard
* Product management
* Add products
* Edit products
* Product management pages
* Order management
* Order status management

> The project uses the existing user authentication and security configuration for access control. There is no separate admin login page in the project.

---

## 💳 Payment

The project contains a checkout/payment flow with the following payment options:

* UPI
* Card
* Cash on Delivery

The payment functionality is intended for learning purposes and does not connect to a real payment provider.

---

## 🧑‍💻 Technologies Used

* Java 17
* Spring MVC
* Spring Security
* Hibernate
* Oracle Database
* JSP
* JSTL
* HTML5
* CSS3
* JavaScript
* Maven
* Apache Tomcat 9

---

## 🏗️ Project Architecture

The project follows a layered architecture:

```text
Browser
   ↓
Controller
   ↓
Service
   ↓
Repository
   ↓
Hibernate
   ↓
Oracle Database
```

---

## 📂 Project Structure

```text
ShopEase/
│
├── src/
│   └── main/
│       │
│       ├── java/
│       │   └── com/
│       │       └── shopease/
│       │           │
│       │           ├── config/
│       │           │   ├── HibernateConfig.java
│       │           │   ├── SecurityConfig.java
│       │           │   ├── SecurityWebApplicationInitializer.java
│       │           │   ├── WebAppInitializer.java
│       │           │   └── WebMvcConfig.java
│       │           │
│       │           ├── controller/
│       │           │   ├── AdminController.java
│       │           │   ├── AuthController.java
│       │           │   ├── CartController.java
│       │           │   ├── CheckoutController.java
│       │           │   ├── HomeController.java
│       │           │   └── OrderController.java
│       │           │
│       │           ├── model/
│       │           │   ├── CartItem.java
│       │           │   ├── Order.java
│       │           │   ├── OrderItem.java
│       │           │   ├── Product.java
│       │           │   └── User.java
│       │           │
│       │           ├── repository/
│       │           │   ├── ProductRepository.java
│       │           │   └── UserRepository.java
│       │           │
│       │           └── service/
│       │               ├── CartService.java
│       │               ├── CustomerDetailsService.java
│       │               ├── OrderService.java
│       │               ├── ProductService.java
│       │               └── UserService.java
│       │
│       └── webapp/
│           │
│           ├── css/
│           │   └── style.css
│           │
│           ├── images/
│           │
│           ├── js/
│           │   └── app.js
│           │
│           ├── WEB-INF/
│           │   ├── views/
│           │   │   │
│           │   │   ├── admin/
│           │   │   │   ├── dashboard.jsp
│           │   │   │   ├── orders.jsp
│           │   │   │   ├── product-form.jsp
│           │   │   │   └── products.jsp
│           │   │   │
│           │   │   ├── common/
│           │   │   │   ├── footer.jsp
│           │   │   │   └── navbar.jsp
│           │   │   │
│           │   │   ├── cart.jsp
│           │   │   ├── checkout.jsp
│           │   │   ├── index.jsp
│           │   │   ├── login.jsp
│           │   │   ├── order-success.jsp
│           │   │   ├── orders.jsp
│           │   │   ├── product-details.jsp
│           │   │   └── register.jsp
│           │   │
│           │   └── web.xml
│           │
│           └── ...
│
├── database/
│
├── pom.xml
├── README.md
└── target/
```

---

## 🔐 Security

The project contains Spring Security configuration for application security and user authentication.

Security-related classes include:

```text
SecurityConfig.java
SecurityWebApplicationInitializer.java
CustomerDetailsService.java
AuthController.java
```

---

## 🗄️ Database

The application uses **Oracle Database** and **Hibernate** for database operations.

Database-related project files are included in:

```text
database/
```

The Hibernate configuration is located in:

```text
src/main/java/com/shopease/config/HibernateConfig.java
```

---

## 🛒 Application Flow

```text
Home
  ↓
Products
  ↓
Product Details
  ↓
Add to Cart
  ↓
Cart
  ↓
Checkout
  ↓
Payment Selection
  ↓
Order
  ↓
Order Success
  ↓
Order History
```

---

## 👨‍💼 Admin Flow

The project contains an admin section under:

```text
WEB-INF/views/admin/
```

The available admin JSP pages are:

```text
dashboard.jsp
orders.jsp
product-form.jsp
products.jsp
```

The corresponding controller is:

```text
AdminController.java
```

---

## ▶️ How to Run

### Requirements

* Java 17
* Maven
* Oracle Database
* Apache Tomcat 9
* Eclipse IDE

### 1. Import the Project

Import the project into Eclipse as an existing Maven project.

### 2. Configure Oracle

Update the Oracle database configuration in:

```text
HibernateConfig.java
```

### 3. Update Maven

In Eclipse:

```text
Right Click Project
        ↓
Maven
        ↓
Update Project
```

### 4. Configure Tomcat

Add Apache Tomcat 9 to Eclipse and add the ShopEase project to the server.

### 5. Run the Application

Start Tomcat and open the context path assigned by Eclipse.

Example:

```text
http://localhost:8081/ShopEase/
```

---

## 📦 Build

The project is a Maven application.

To create the WAR file:

```bash
mvn clean package
```

The generated WAR file will be placed in:

```text
target/
```

---

## 📁 Main Packages

| Package      | Responsibility                                         |
| ------------ | ------------------------------------------------------ |
| `config`     | Application, MVC, Hibernate and security configuration |
| `controller` | Handles web requests                                   |
| `model`      | Application/domain models                              |
| `repository` | Database data access                                   |
| `service`    | Business logic                                         |

---

## 👨‍💻 Developer

**Chinnareddaiah Chagalamarri**

Java Developer

### Technologies

```text
Java
Spring MVC
Spring Security
Hibernate
Oracle SQL
JSP
Servlets
HTML
CSS
JavaScript
Maven
Tomcat
Git
GitHub
```

---

## 📄 License

This project is created for educational and portfolio purposes.
