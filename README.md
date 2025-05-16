##Hotel Management System Database
Overview
This database schema is designed for a comprehensive hotel management system, tracking guests, bookings, rooms, payments, and additional services. The relational database supports all core operations of a hotel including reservations, room assignments, billing, and service management.

Database Schema Description
Core Entities
Guest Management

Stores guest personal information (name, contact details)

Tracks all bookings made by each guest

Booking System

Manages reservation details (dates, number of guests)

Tracks payment status for each booking

Records additional services purchased (add-ons)

Room Management

Detailed room classification system (standard to presidential)

Tracks room features and bed configurations

Manages room status (available, occupied, maintenance)

Payment Tracking

Multiple payment status options

Booking amount tracking with validation

Key Features
Flexible Room Configuration: Supports multiple bed types and room features

Service Add-ons: Tracks additional services like breakfast, spa, parking

Multi-floor Support: Manages rooms across different floors

Comprehensive Booking System: Handles check-in/out dates, guest counts

Payment Tracking: Multiple payment status options with default "NOT PAID"

Entity Relationships
The database establishes relationships between:

Guests and their bookings (one-to-many)

Bookings and payment statuses (many-to-one)

Rooms and their classifications (many-to-one)

Bookings and rooms (many-to-many via junction table)

Room classes and their features/bed types (many-to-many)

Sample Data
The database includes sample data for:

5 guest records

5 payment status options

5 booking records

5 service add-ons

5 room classes with features

5 bed types

5 room statuses

5 floors

5 rooms

### ERD Diagram

![HOTEL](https://github.com/user-attachments/assets/4d35f878-512a-4853-8897-41b12be0e8af)
