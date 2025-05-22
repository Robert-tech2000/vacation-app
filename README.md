# 🌴 Vacation Management Application

This is a Spring Boot-based REST API for managing vacation requests and users. The application includes integration with Keycloak for authentication, MySQL for persistent storage, and Docker for containerized deployment.

---

## 📦 Features

- ✅ Create, view, update, and delete **vacation requests**
- ✅ Manage **users** with default vacation days
- ✅ Optional filtering by vacation status and user ID
- ✅ Caching and public holiday integration (Nager API)
- ✅ Keycloak-based security (admin/employee roles)
- ✅ Docker-based development environment

---

## 🚀 Technologies Used

- Java 21
- Spring Boot 3
- Spring Data JPA
- Spring Security (Keycloak OAuth2)
- MySQL
- Docker + Docker Compose
- MapStruct (DTO mapping)
- Lombok
- SLF4J Logging

---

## 🚀 Getting Started

### ✅ Requirements

- Java 17+
- Docker & Docker Compose
- Maven

### Clone the Repository

```shell
   git clone https://github.com/Robert-tech2000/vacation-app.git
```


## 🐳 Running with Docker

Make sure you have Docker and Docker Compose installed.


### 🏁 First-time setup

```bash
  docker compose up --build
```

### 🏁 Subsequent Docker runs

Comment the following --import-realm line in docker-compose.yml keycloak service, in order to maintain keycloak settings:
```
keycloak:
image: quay.io/keycloak/keycloak:24.0.1
container_name: vacation-app-keycloak
command:
- start-dev
# - --import-realm  
```

```bash
    docker compose up --build
```

---

## 🧪 API Overview

### 👤 **User Endpoints** (`/users`)

| Method | Endpoint            | Description                      |
|--------|---------------------|----------------------------------|
| POST   | `/users`            | Create a new user                |
| GET    | `/users/{userId}`   | Retrieve user by ID              |
| GET    | `/users`            | Retrieve all users               |
| PUT    | `/users/{userId}`   | Archive a user                   |
| GET    | `/users/me`         | Get the currently authenticated user (🔧 WIP) |

---


### 🏖️ **Vacation Endpoints** (`/vacations`)

| Method | Endpoint                  | Description                          |
|--------|---------------------------|--------------------------------------|
| POST   | `/vacations`              | Create a new vacation request        |
| GET    | `/vacations/{vacationId}` | Retrieve vacation by ID              |
| GET    | `/vacations`              | List all vacations (filtered by user ID or status) |
| PUT    | `/vacations/{vacationId}` | Update vacation status               |
| DELETE | `/vacations/{vacationId}` | Delete a vacation (only if pending)  |

---

## 🔐 Authentication

The app uses **Keycloak** for OAuth2-based security.

- Realm: `Vacation-Application-Realm`
- Client: `Vacation_App_Client`
- Roles:
    - `ROLE_ADMIN`
    - `ROLE_EMPLOYEE`

Use a valid Keycloak access token (Bearer token) to access secured endpoints.

---

