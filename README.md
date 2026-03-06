# Distributed Medical Platform

A backend system built with Java and Spring Boot, designed as a set of loosely coupled microservices. The platform handles user authentication, medical data search, appointment booking, payment processing, and email notifications.

---

## Architecture
![Architecture](docs/architecture.png)
---

## Services

### API Gateway
- Centralized JWT validation — downstream services receive pre-verified user identity via headers (`X-User-Id`, `X-User-Role`)
- Redis-based token bucket rate limiting — 20 req/s (core), 10 req/s (payments)
- Global request/response logging with latency tracking
- Public route bypass for auth and Stripe webhook endpoints

### Medical Service
- Role-based access control (PATIENT, DOCTOR, PHARMACIST) enforced via Spring Security
- Paginated search for medicines, diseases, and symptoms with Redis caching
- Appointment booking with optimistic locking to prevent double-booking
- Publishes Kafka events on user registration and appointment status changes
- Communicates with Payment Service via REST

### Payment Service
- Stripe Checkout session creation with idempotency key (prevents duplicate charges on retry)
- Webhook handler for `checkout.session.completed` and `payment_intent.payment_failed` events
- Gateway pattern (`PaymentGateway` interface + `StripePGAdapter`) — easily swap payment providers
- Publishes payment status back to Medical Service via Kafka

### Notification Service
- Kafka consumers for welcome emails and appointment confirmation/cancellation
- Mail failures are caught and logged — consumer does not crash on email errors

---

## Tech Stack

| Technology | Usage |
|---|---|
| Java 17 | Primary language |
| Spring Boot 3 | Application framework |
| Spring Cloud Gateway | API Gateway with reactive WebFlux |
| Spring Security | Role-based auth, JWT filter chain |
| Spring Data JPA | ORM for MySQL |
| MySQL | Primary relational database |
| Redis | Rate limiting + response caching |
| Apache Kafka | Async inter-service communication |
| Stripe Java SDK | Payment processing |
| JWT (jjwt 0.12.x) | Stateless authentication |
| Lombok | Boilerplate reduction |
| JUnit + Mockito | Unit testing |

---

## Key Design Decisions

**JWT validated at gateway, not per service**
The API Gateway validates JWT and forwards user identity as headers. Downstream services trust these headers and skip re-validation, reducing latency and centralizing auth logic.

**Redis rate limiting with token bucket**
Each IP gets a token bucket (20 tokens/s for core, 10 for payments). Stricter limits on payment routes reduce exposure to abuse.

**Idempotent payment creation**
The appointment ID is used as the Stripe idempotency key. Retried requests return the existing session instead of creating duplicate charges.

**Optimistic locking on appointments**
The `Appointment` entity uses `@Version` to prevent race conditions when two patients try to book the same doctor slot simultaneously.

**Kafka for async notification delivery**
Email sending is decoupled from the main request flow. A failed email does not roll back a successful booking or payment.

**Gateway pattern for payment provider**
`PaymentGateway` interface abstracts the Stripe implementation. Switching to Razorpay requires only a new adapter — no changes to business logic.

---

## Running Locally

**Prerequisites**
- Java 17
- MySQL
- Redis
- Kafka + Zookeeper
- Stripe account (for payment service)

**Environment variables required**

| Variable | Used by |
|---|---|
| `JWT_KEY` | api-gateway, medical-service |
| `DB_USERNAME` | medical-service, payment-service |
| `DB_PASSWORD` | medical-service, payment-service |
| `PAYMENT_URL` | medical-service |
| `STRIPE_KEY` | payment-service |
| `STRIPE_WEBHOOK_SECRET` | payment-service |
| `MAIL_USERNAME` | notification-service |
| `MAIL_PASSWORD` | notification-service |

See `application.properties.example` in each service for full configuration reference.

**Start order**
```
1. Start Redis
2. Start Kafka + Zookeeper
3. Start MySQL, create databases: medicaldb, payments
4. Start notification-service
5. Start payment-service
6. Start medical-service
7. Start api-gateway
```

**Build each service**
```bash
cd <service-folder>
./mvnw clean install -DskipTests
./mvnw spring-boot:run
```

---

## API Overview

| Method | Endpoint | Auth | Description |
|---|---|---|---|
| POST | `/api/v1/auth/register` | Public | Register new user |
| POST | `/api/v1/auth/login` | Public | Login, returns JWT |
| GET | `/api/v1/medicines/search?name=` | JWT | Search medicines |
| GET | `/api/v1/diseases/search?query=` | JWT | Search diseases |
| GET | `/api/v1/symptoms/search?name=` | JWT | Search symptoms |
| POST | `/api/v1/appointments/book` | PATIENT | Book appointment |
| POST | `/payments/initiate` | Internal | Create payment |
| POST | `/api/webhook/stripe` | Stripe | Payment webhook |
