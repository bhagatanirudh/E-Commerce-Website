# EazyDeals Architecture

This repository is a Java web application built with JSP, Servlets, JDBC, and MySQL. It follows a classic MVC-style structure where JSP pages provide the UI, servlet classes handle HTTP requests, and DAO classes manage database access.

```mermaid
flowchart LR
    subgraph Client[Client Layer]
        U[Customer]
        A[Admin]
        B[Browser / JSP UI]
    end

    subgraph Web[Web Application Layer]
        JSP[JSP Pages\nindex.jsp, login.jsp, cart.jsp, checkout.jsp, admin.jsp, profile.jsp]
        SERVLETS[Servlet Controllers\nRegisterServlet, LoginServlet, AddToCartServlet,\nOrderOperationServlet, WishlistServlet, AdminServlet, ...]
        SESSION[HttpSession / Request / Response]
        HELPER[Helper Utilities\nConnectionProvider, Mail, MailMessenger, OrderIdGenerator]
    end

    subgraph DAO[Data Access Layer]
        USER[UserDao]
        ADMIN[AdminDao]
        PROD[ProductDao]
        CAT[CategoryDao]
        CART[CartDao]
        WISHLIST[WishlistDao]
        ORDER[OrderDao]
        ORDERED[OrderedProductDao]
    end

    subgraph DB[Database Layer]
        MYSQL[(MySQL Database\neazydeals schema)]
    end

    subgraph Mail[External Services]
        SMTP[SMTP Mail Service\nRegistration, Order, OTP emails]
    end

    U -->|HTTP requests| B
    A -->|HTTP requests| B
    B --> JSP
    JSP -->|renders pages| B

    B -->|POST/GET actions| SERVLETS
    SERVLETS --> SESSION
    SERVLETS --> HELPER
    SERVLETS --> USER
    SERVLETS --> ADMIN
    SERVLETS --> PROD
    SERVLETS --> CAT
    SERVLETS --> CART
    SERVLETS --> WISHLIST
    SERVLETS --> ORDER
    SERVLETS --> ORDERED

    USER -->|JDBC| MYSQL
    ADMIN -->|JDBC| MYSQL
    PROD -->|JDBC| MYSQL
    CAT -->|JDBC| MYSQL
    CART -->|JDBC| MYSQL
    WISHLIST -->|JDBC| MYSQL
    ORDER -->|JDBC| MYSQL
    ORDERED -->|JDBC| MYSQL

    HELPER -->|SMTP| SMTP
    SMTP -->|email notifications| U
```

## Component breakdown

- Front-end: JSP, HTML, CSS, JavaScript, Bootstrap
- Back-end: Java Servlets and Java classes
- Persistence: JDBC DAO layer against MySQL
- Session management: HttpSession for authenticated users/admins
- Mail: registration/order/password-reset email notifications
- Domain model: entities such as User, Product, Category, Cart, Order, Wishlist, and Admin

## Key folders

- [src/main/java/com/eazydeals/servlets](src/main/java/com/eazydeals/servlets) — controller logic
- [src/main/java/com/eazydeals/dao](src/main/java/com/eazydeals/dao) — database operations
- [src/main/java/com/eazydeals/entities](src/main/java/com/eazydeals/entities) — domain models
- [src/main/java/com/eazydeals/helper](src/main/java/com/eazydeals/helper) — database and mail helpers
- [src/main/webapp](src/main/webapp) — JSP pages, static assets, layouts, and UI templates
- [eazydeals_maven.sql](eazydeals_maven.sql) — database schema and seed data

## Flow diagram

```mermaid
flowchart TD
    Start[User opens website] --> Login[Login / Register / Browse Products]
    Login --> Page[JSP page loads]
    Page --> Action[Click action: Add to cart / Place order / Wishlist / Admin manage]
    Action --> Servlet[Servlet controller]
    Servlet --> Validate{Valid request?}
    Validate -- No --> Error[Show error message / redirect]
    Validate -- Yes --> DAO[DAO layer]
    DAO --> DB[(MySQL Database)]
    DB --> Result[Fetch / update data]
    Result --> Session[Store in session / response object]
    Session --> JSP2[JSP renders updated page]
    JSP2 --> User[User sees result]

    Servlet --> Mail{Need email?}
    Mail -- Yes --> SMTP[Mail helper / SMTP service]
    SMTP --> User

    User --> Admin[Admin manages products, orders, users]
    Admin --> Servlet
```

## Typical request flow

1. User opens a JSP page in the browser.
2. A servlet receives the request and validates the action.
3. The servlet uses a DAO to query or update the MySQL database.
4. The result is stored in the session or returned to the JSP for rendering.
5. Email notifications are sent when required for registration, password reset, or order updates.
