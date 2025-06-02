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
- GraphQL

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

<br>

####  ➕ Create User

```http
POST /users
Content-Type: application/json
{
  "username": "john_doe",
  "firstName": "John",
  "lastName": "Doe",
  "email": "john.doe@example.com",
  "reportsTo": {
    "id": 1
  }
}
```
<br>

#### 📃 Get User by ID

```http
GET /users/{userId}
```

Path parameter: <br> 
 - userId: ID of the user to fetch

<br> 

#### 📃 Get All Users
```http
GET /users
```
Path parameter: No query parameters.

<br>

#### 🗑️ Archive User
```http
PUT /users/{userId}
```
Path parameter: <br>
- userId: ID of the user to archive


---


### 🏖️ **Vacation Endpoints** (`/vacations`)

| Method | Endpoint                  | Description                          |
|--------|---------------------------|--------------------------------------|
| POST   | `/vacations`              | Create a new vacation request        |
| GET    | `/vacations/{vacationId}` | Retrieve vacation by ID              |
| GET    | `/vacations`              | List all vacations (filtered by user ID or status) |
| PUT    | `/vacations/{vacationId}` | Update vacation status               |
| DELETE | `/vacations/{vacationId}` | Delete a vacation (only if pending)  |

<br>
➕ Create Vacation Request

```http
POST /vacations
Content-Type: application/json
{
  "startDate": "2025-01-02",
  "endDate": "2025-01-10",
  "description": "Family holiday",
  "type": "SPECIAL_EVENT",
  "status": "PENDING",
  "withPay": true,
  "user": {
    "id": 2
  }
}
```
<br>
📃 Get Vacation by ID

```http
GET /vacations/{vacationId}
```
Path parameter: <br>
- vacationId: ID of the vacation request

<br>
📃 Get All Vacations

```http
GET /vacations
```
Query parameters (optional): <br>
- userId: Filter by user ID (e.g. /vacations?userId=3)
- status: Filter by request status (PENDING, APPROVED, etc.)

<br>
🔄 Update Vacation Status

```http
PUT /vacations/{vacationId}?status=APPROVED
```
Path parameter: <br>
- vacationId: ID of the vacation to update

Query parameter: <br>
- status: New status (e.g. APPROVED, REJECTED, etc.)

<br>
🗑️ Delete Vacation(employee can only delete own vacation request, and with status PENDING)

```http
DELETE /vacations/{vacationId}
```
Path parameter: <br>
- vacationId: ID of the vacation to delete

---
## 🚀 GraphQL Integration (features/graphql)
<br>

### 📦 Branch
 - features/graphql

### ✅ Key Features
- GraphQL API exposed at: POST /graphql
- Interactive GraphQL UI available (e.g. GraphiQL or compatible client)
- Query and mutation support for:

  - User: create users, fetch users, hierarchical relationships (reportsTo)
  - VacationRequest: create vacation requests, filter by user/status, access nested relationships
<br>

### 📄 Schema Overview
#### User Type
```http
type User {
  id: ID!
  username: String!
  email: String
  firstName: String
  lastName: String
  allotedVacationDays: Int
  isArchived: Boolean
  reportsTo: User
  vacationRequests: [VacationRequest]
}
```
#### VacationRequest Type
```http
type VacationRequest {
  id: ID!
  startDate: String!
  endDate: String!
  duration: String
  description: String!
  status: VacationRequestStatus
  type: VacationRequestType
  user: User
  withPay: Boolean
}
```

### 🔁 Mutations
#### Create User
```http
mutation {
  createUser(input: {
    username: "jdoe",
    email: "john.doe@example.com",
    firstName: "John",
    lastName: "Doe",
    reportsToId: 1
  }) {
    id
    username
    reportsTo {
      username
    }
  }
}
```
#### Create VacationRequest
```http
mutation {
  createVacationRequest(input: {
    startDate: "2025-06-01",
    endDate: "2025-06-10",
    description: "Summer break",
    withPay: true,
    type: HOLIDAY,
    status: PENDING,
    userId: 5
  }) {
    id
    status
  }
}
```

### 🔍 Queries
#### Get User by ID
```http
query {
  userById(id: 1) {
    username
    reportsTo {
      username
    }
  }
}
```
#### Get All Users
```http
query {
  getAllUsers {
    username
    email
    isArchived
    reportsTo {
      username
    }
  }
}
```
#### Get  Vacation Request by Id
```http
query {
  getVacation(id: 2) {
    startDate
    endDate
    duration
    status
    type
    user {
      username
    }
  }
}
```

#### Get All Vacation Requests by User or Status
```http
query {
  getAllVacations(userId: 5, status: APPROVED) {
    id
    startDate
    status
  }
}
```

###  🧪 Testing Tools
 - GraphQL IDE (e.g., GraphiQL, Altair, Postman)
 - GraphiQL UI tool path: http://localhost:8080/graphiql?path=/graphql 
 - Authorization via Bearer Token (Spring Security is enabled)

### 📌 Notes
- The feature uses Spring GraphQL (spring-boot-starter-graphql)
- DTOs are used in resolvers to decouple internal entities from the API
- Dates are handled as ISO 8601 strings and converted to LocalDate automatically

Enum types (VacationRequestStatus, VacationRequestType) are fully supported
---


## 🔐 Authentication

The app uses **Keycloak** for OAuth2-based security.

- Realm: `Vacation-Application-Realm`
- Client: `Vacation_App_Client`
- Roles:
    - `ROLE_ADMIN`
    - `ROLE_EMPLOYEE`

Use a valid Keycloak access token (Bearer token) to access secured endpoints.

###  Retrieve JWT Token from Keycloak
- A user must be created in the keycloak instance by accessing http://host.docker.internal:8081/
- Afterward Realm role Admin or Employee has to be assigned to user. 

```http
POST http://host.docker.internal:8081/realms/Vacation-Application-Realm/protocol/openid-connect/token

Content-Type: application/json
{
  "grant_type": "password",
  "client_id": "Vacation_App_Client",
  "username": "$username",
  "password": "$password"
  }
}
```
Copy access_token from Response Body and paste to subsequent requests.

---


## 📂 Log Output
Logs are written to:
```http
./logs/vacation-app.log
```
<br>

Configure in application.properties
```http
logging.file.name=/logs/vacation-app.logv
```