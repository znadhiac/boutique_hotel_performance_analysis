-- ==========================================
-- BOUTIQUE HOTEL PERFORMANCE ANALYSIS
-- Queries to answer key business questions
-- Author: Zulfi Nadhia Cahyani
-- ==========================================

USE boutique_hotel;
SHOW TABLES;

-- =======================================
-- 1. Customer Demographics and Behavior
-- =======================================

-- 1.1 Booking Volume and Guest Distribution by Age Group

-- Purpose:
-- Analyze how bookings and guest counts vary across different customer age groups.

-- Notes:
-- - Customers with unknown or missing age are grouped under 'Unknown'.
-- - total_booking counts the number of bookings per age group.
-- - total_guests sums the number of guests associated with those bookings.
-- - booking_percentage shows the share of total bookings for each age group.
-- - guests_percentage shows the share of total guests for each age group.

WITH booking_by_age_group AS (
SELECT CASE
		WHEN c.CustomerAge BETWEEN 18 AND 25 THEN '18-25'
        WHEN c.CustomerAge BETWEEN 26 AND 35 THEN '26-35'
        WHEN c.CustomerAge BETWEEN 36 AND 45 THEN '36-45'
        WHEN c.CustomerAge BETWEEN 46 AND 55 THEN '46-55'
        WHEN c.CustomerAge > 55 THEN '56+'
        ELSE 'Unknown'
        END AS customer_age_group,
		COUNT(o.OrderID) AS total_booking,
        SUM(o.CustomerCount) AS total_guests
FROM customers C
JOIN orders O
	ON c.CustomerID = o.CustomerID
GROUP BY customer_age_group
)

SELECT *,
		ROUND((total_booking * 100 / SUM(total_booking) OVER()),2) AS booking_percentage,
        ROUND((total_guests * 100 / SUM(total_guests) OVER()),2) AS guests_percentage
FROM booking_by_age_group
GROUP BY customer_age_group
ORDER BY customer_age_group;

-- 1.2 Booking Volume and Guest Distribution by Gender

-- Purpose:
-- Evaluate how booking volume and guest counts differ between genders.

-- Notes:
-- - total_booking counts the number of bookings for each gender.
-- - total_guests sums the number of guests associated with those bookings.
-- - booking_percentage shows each gender’s share of total bookings.
-- - guests_percentage shows each gender’s share of total guests.
-- - Useful to identify the dominant gender segment and opportunities to target underrepresented groups.

WITH booking_by_gender AS (
SELECT c.CustomerGender,
		COUNT(o.OrderID) AS total_booking,
        SUM(o.CustomerCount) AS total_guests
FROM customers C
JOIN orders O
	ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerGender
)

SELECT *,
		ROUND((total_booking * 100 / SUM(total_booking) OVER()),2) AS booking_percentage,
        ROUND((total_guests * 100 / SUM(total_guests) OVER()),2) AS guests_percentage
FROM booking_by_gender
GROUP BY CustomerGender
ORDER BY booking_percentage DESC, guests_percentage DESC;

-- 1.3 Booking Volume and Guest Distribution by Country

-- Purpose:
-- Understand which countries contribute the most to bookings and guest counts.

-- Notes:
-- - total_booking counts the number of bookings for each customer country.
-- - total_guests sums the number of guests associated with those bookings.
-- - booking_percentage shows each country’s share of total bookings.
-- - guests_percentage shows each country’s share of total guests.
-- - Useful to identify top contributing countries and prioritize marketing or operational focus accordingly.

WITH booking_by_country AS (
SELECT c.CustomerCountry,
		COUNT(o.OrderID) AS total_booking,
        SUM(o.CustomerCount) AS total_guests
FROM customers C
JOIN orders O 
	ON c.CustomerID = O.CustomerID
GROUP BY c.CustomerCountry
)

SELECT *,
		ROUND((total_booking * 100 / SUM(total_booking) OVER()),2) AS booking_percentage,
        ROUND((total_guests * 100 / SUM(total_guests) OVER()),2) AS guests_percentage
FROM booking_by_country
ORDER BY booking_percentage DESC, guests_percentage DESC;

-- =====================================
-- 2. Room Utilization and Performance
-- =====================================

-- 2.1 Booking Volume and Revenue by Room Type

-- Purpose:
-- Identify which room types are booked most frequently and which generate the most revenue.

-- Notes:
-- - total_booking counts all bookings per room type.
-- - total_revenue sums TotalCost for each room type.
-- - average_revenue_per_booking calculates revenue per booking for comparison.

WITH revenue_per_booking AS (
SELECT r.RoomType,
		COUNT(o.OrderID) AS total_booking,
        SUM(o.TotalCost) AS total_revenue
FROM orders O
JOIN rooms R
	ON o.RoomNumber = r.RoomNumber
GROUP BY r.RoomType
)
SELECT *,
		ROUND(total_revenue / total_booking, 2) AS average_revenue_per_booking
FROM revenue_per_booking
ORDER BY total_revenue DESC, average_revenue_per_booking DESC;

-- 2.2 Occupancy Rate by Room Characteristics

-- Purpose:
-- Calculate occupancy rates based on room capacity, type, and base price.

-- Notes:
-- - guest_nights represents total booked guest-nights for each room type.
-- - available_capacity_nights calculates maximum possible guest-nights based on room capacity.
-- - occupancy_rate shows the percentage of capacity actually used. 
-- - Useful for identifying under- or over-utilized room types.

WITH occupancy_by_room AS (
SELECT r.RoomType,
       r.Capacity,
       r.BasePrice,
       SUM(o.CustomerCount * DATEDIFF(o.CheckOutDate, o.CheckInDate)) AS guest_nights,
       SUM(r.Capacity * DATEDIFF(o.CheckOutDate, o.CheckInDate)) AS available_capacity_nights
FROM orders o
JOIN rooms r
  ON o.RoomNumber = r.RoomNumber
GROUP BY r.RoomType, r.Capacity, r.BasePrice
)

SELECT *,
		ROUND((guest_nights/ available_capacity_nights * 100), 2) AS occupancy_rate
FROM occupancy_by_room
ORDER BY occupancy_rate DESC;

-- 2.3 Stay Duration and Guest Volume by Room Type

-- Purpose:
-- Assess average stay duration and guest count per booking for each room type.

-- Notes:
-- - total_stay_duration sums the total days booked per room type.
-- - average_guests_per_booking calculates mean guests per booking.
-- - average_stay_duration_per_booking calculates mean stay length per booking.

WITH duration_guests_booking AS (
SELECT r.RoomType,
		COUNT(o.OrderID) AS total_booking,
		SUM(o.CustomerCount) AS total_guests,
		SUM(DATEDIFF(o.CheckOutDate, o.CheckInDate)) AS total_stay_duration
FROM orders O 
JOIN rooms R 
	ON o.RoomNumber = R.RoomNumber
GROUP BY r.RoomType
)

SELECT *,
		CEIL(total_guests/total_booking) AS average_guests_per_booking,
        CEIL(total_stay_duration/total_booking) AS average_stay_duration_per_booking
FROM duration_guests_booking
ORDER BY average_guests_per_booking DESC;

-- =================================
-- 3. Revenue and Payment Analysis
-- =================================

-- 3.1 Seasonal Impact on Bookings, Guests, and Revenue

-- Purpose:
-- Examine how bookings, guest counts, and revenue vary by seasonal factors.

-- Notes:
-- - total_booking counts orders per season.
-- - total_guests sums guests per season.
-- - total_revenue sums TotalCost per season.
-- - Helps identify high- and low-demand periods for strategic planning.

WITH seasonal_booking AS (
SELECT SeasonalFactor,
		COUNT(OrderID) AS total_booking,
        SUM(CustomerCount) AS total_guests,
        SUM(TotalCost) AS total_revenue
FROM orders
GROUP BY SeasonalFactor
)

SELECT *,
		ROUND(total_revenue / total_booking, 2) AS average_revenue_per_booking	
FROM seasonal_booking
ORDER BY total_revenue DESC, average_revenue_per_booking DESC;

-- 3.2 Total Bookings, Guests, and Revenue by Month

-- Purpose:
-- Analyze monthly trends in bookings, guest counts, and revenue to understand temporal patterns.

-- Notes:
-- - month_checkin uses numeric month for sorting; month_name_checkin is for readability.
-- - total_booking, total_guests, and total_revenue are aggregated per month.
-- - Useful for identifying peaks, seasonality, and monthly trends.

WITH monthly_booking AS (
SELECT MONTH(CheckInDate) AS month_checkin,
		MONTHNAME(CheckInDate) AS month_name_checkin,
		COUNT(OrderID) AS total_booking,
        SUM(CustomerCount) AS total_guests,
        SUM(TotalCost) AS total_revenue
FROM orders
GROUP BY month_checkin, month_name_checkin
)

SELECT *,
		ROUND(total_revenue / total_booking, 2) AS average_revenue_per_booking	
FROM monthly_booking
ORDER BY month_checkin;

-- 3.3 Payment Method Usage by Season

-- Purpose:
-- Determine the most commonly used payment methods across different seasons and their share of total bookings.

-- Notes:
-- - total_booking counts orders per payment method per season.
-- - booking_percentage shows the share of each payment method within the season.
-- - Helps understand customer payment behavior and plan payment-related strategies.

WITH payment_by_season AS (
SELECT SeasonalFactor,
		PaymentMethod,
		COUNT(OrderID) AS total_booking
FROM orders
GROUP BY SeasonalFactor, PaymentMethod
)

SELECT *,
		ROUND(total_booking * 100 / SUM(total_booking) OVER(PARTITION BY SeasonalFactor),2) AS booking_percentage
FROM payment_by_season
ORDER BY SeasonalFactor, booking_percentage DESC;
