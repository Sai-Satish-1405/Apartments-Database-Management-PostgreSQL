
# 🏠 DP Apartment Rental Management System

A full-stack PostgreSQL-powered database system for managing apartment rentals, lease agreements, service requests, and payment workflows.

---

## 📌 Project Overview

This system streamlines apartment rental operations for tenants, owners, managers, and technicians. It supports lease tracking, service request automation, secure payments, and role-based access—all within a scalable relational database.

---

## 🧩 Key Features

- 🏘️ Property Listings with images and descriptions  
- 📄 Lease Agreement Management with start/end dates and rent tracking  
- 💳 Online Rent Payments with auto-generated transaction references  
- 🛠️ Service Request System with technician assignment and status updates  
- 🔐 Role-Based Access Control for tenants, owners, managers, and technicians  
- 🌐 Multi-language and currency support for diverse user bases  
- 👥 Community Discovery: Tenants can view neighbors in their complex  

---

## 🧠 Business Rules Enforced

| Rule | Description |
|------|-------------|
| One owner per property | Owners can manage multiple properties |
| One tenant per property | Tenants can only rent one property at a time |
| Unique lease per property | Each property has one active lease |
| Payments tied to lease | Rent payments require an active lease |
| Technician assignment | Only available technicians are auto-assigned |
| Unique service request ID | Format: `SRYYYYMMDD + property_id + sequence` |

---

## 🗃️ Database Schema Highlights

- **Tables**: `property`, `tenant`, `owner`, `manager`, `lease_file`, `payment`, `technician`, `service_request`
- **Sequences & Triggers**:
  - Auto-increment IDs for entities
  - Custom ID formats for payments and service requests
- **Constraints**:
  - Foreign keys for relational integrity
  - Unique constraints for tenant-property mapping

---

## 📊 Sample Queries & Reports

- 🔍 Lease Expiry Alerts: Properties with leases ending next month  
- 💰 Manager Commission Report: 5% of monthly rent managed  
- 🛠️ Top 5 Properties by Service Requests  
- 💳 Monthly Payment Turnover by Method  
- 🏚️ Vacant Properties Listing with Manager Info  

---

## 👨‍💻 Contributors

- **Sai Satish Pallapolu** – Architecture, SQL logic, triggers, documentation  
- **Team Members** – Data modeling, ERD design, synthetic data generation  

---

## 🤖 AI Disclosure

Synthetic data was generated using Gemini for populating sample records across tables.

---

> 🚀 *Built for INFO 5707 Term Project — A robust, scalable solution for modern apartment management.*
