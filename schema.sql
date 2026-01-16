-- ==============================
-- BOUTIQUE HOTEL PERFORMANCE
-- Schema Definition
-- Author: Zulfi Nadhia Cahyani
-- ==============================

/*
This schema defines analytical tables derived from the Boutique Hotel dataset from Kaggle.

Dataset Source:
https://www.kaggle.com/datasets/alperenmyung/boutique-hotel-dataset-in-turkey

The dataset consists of 3 main tables:
- customers (customer information)
- orders (booking/ reservation data)
- rooms (room details)

The tables are organized in a relational model to support join-based analysis
for hotel occupancy, room performance, revenue, and customer behavior.
*/

-- ------------------------------
-- 1. Customers
-- ------------------------------
-- Dimension table storing hotel customer information
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,           -- Unique customer identifier
    CustomerAge INT,                      -- Customer age
    CustomerGender VARCHAR(10),           -- Customer gender (Male/Female)
    CustomerCountry VARCHAR(100)          -- Customer country
);

-- ------------------------------
-- 2. Rooms
-- ------------------------------
-- Dimension table storing hotel room details
CREATE TABLE rooms (
    RoomNumber INT PRIMARY KEY,           -- Room number
    Capacity INT,                         -- Maximum guests allowed
    RoomType VARCHAR(50),                 -- Type of room (e.g., Single Room)
    BasePrice DECIMAL(10,2)               -- Base price per night
);

-- ------------------------------
-- 3. Orders
-- ------------------------------
-- Fact table storing hotel bookings/reservations
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,              -- Unique order/booking identifier
    CustomerID INT,                       -- Foreign key to customer
    CustomerCount INT,                    -- Number of customers in the booking
    RoomNumber INT,                       -- Foreign key to room
    CheckInDate DATE,                     -- Check-in date
    CheckOutDate DATE,                    -- Check-out date
    StayDuration INT,                     -- Number of nights
    TotalCost DECIMAL(12,2),              -- Total booking amount
    PaymentMethod VARCHAR(50),            -- Payment method (e.g., Credit Card, Online Transfer)
    SeasonalFactor VARCHAR(20),           -- Season factor (e.g., normal, peak)
    CONSTRAINT fk_order_customer FOREIGN KEY (CustomerID)
        REFERENCES customers(CustomerID),
    CONSTRAINT fk_order_room FOREIGN KEY (RoomNumber)
        REFERENCES rooms(RoomNumber)
);