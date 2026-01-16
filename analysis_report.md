# **BOUTIQUE HOTEL PERFORMANCE ANALYSIS** 
### Author: Zulfi Nadhia Cahyani 

## **I. PROJECT OVERVIEW**  

This project leverages the Boutique Hotel in Turkey dataset from Kaggle to extract actionable insights for hotel operations. The dataset covers hotel booking records for the entire year of 2024 and integrates customer demographics, room details, and booking data, including check-in and check-out dates, guest counts, payment methods, and seasonal factors. Using SQL joins, aggregations, and trend analysis, the study examines occupancy trends, room performance, and revenue patterns to uncover key drivers of customer behavior and booking activity, supporting data-driven decisions for revenue optimization and operational efficiency.

---

## **II. BUSINESS QUESTIONS**  

1. **Customer Demographics and Behavior**  
    - What is the distribution of customer age, gender, and country?
    - How do customer demographics relate to booking volume and guest count?

2. **Room Utilization and Performance**  
    - Which rooms are booked most frequently, and which generate the most revenue?
    - How does occupancy vary by room type, capacity, or base price?
    - What is the average stay duration and number of guests per booking by room type?

3. **Revenue and Payment Analysis**  
    - How do total bookings, guest counts, and revenue vary across seasons and months?
    - Which payment methods are most commonly used during different seasons?

---

## **III. OBJECTIVES**  

1. Analyze how customer demographics (age, gender, country) affect bookings and guest counts.
2. Examine room usage, occupancy, and revenue by room type, capacity, and stay duration.
3. Examine seasonal and monthly trends in bookings, guest counts, and revenue.
4. Analyze seasonal payment method usage to understand customer behavior.
5. Provide actionable insights to optimize operations, occupancy, and revenue performance.

---

## **IV. DATASET**  

**Source:** [**Boutique Hotel Dataset in Turkey on Kaggle**](https://www.kaggle.com/datasets/alperenmyung/boutique-hotel-dataset-in-turkey)  

**Tables Used:**  
- **customers:** dimension table storing hotel customer demographic information.
- **rooms:** dimension table containing room details such as type, capacity, and base price.
- **orders:** fact table recording booking/reservation details, including check-in/out dates, number of guests, payment method, and seasonal factors.

**Timeline:** The dataset covers hotel booking records for the entire year of 2024.

---

## **V. DATA MODEL OVERVIEW**  

The Boutique Hotel dataset is structured as a **relational model**, with **dimension** and **fact tables** that support join-based analysis for customer behavior, room utilization, occupancy, and revenue performance. Referential integrity is maintained through **primary key–foreign key relationships**, ensuring accurate joins and reliable aggregations.  

- **Primary Keys (PK)** uniquely identify each record in a table.  
- **Foreign Keys (FK)** reference primary keys in other tables to maintain relationships and ensure referential integrity.  

**Fact Tables:**  
- **orders** (PK: `OrderID`, FK: `CustomerID`, `RoomNumber`)  

**Dimension Tables:**  
- **customers** (PK: `CustomerID`)  
- **rooms** (PK: `RoomNumber`)  

### **Data Cleaning and Preparation**
Data cleaning was performed using **Python (Pandas)**, including:  
- Handling missing values and duplicates  
- Correcting data types, column names, and inconsistent data  
- Ensuring referential integrity for foreign keys  

Data analysis and SQL queries were executed in **MySQL**, leveraging the relational structure to efficiently extract insights related to hotel occupancy, room performance, revenue, customer behavior, and booking patterns.

---

## **VI. KEY INSIGHTS**  

### **VI.1 Customer Demographics and Behavior**  

#### **VI.1.1 Booking Volume and Guest Distribution by Age Group**  
1. Customers aged 56+ dominate the hotel’s bookings, accounting for 2,881 bookings (54.43% of total) and 3,908 guests (54.37%), indicating that older adults are the primary customer base, likely seeking comfort, longer stays, or premium services.  
2. The 46–55 age group is the second-largest segment, contributing 1,075 bookings (20.31%) and 1,450 guests (20.17%), highlighting the importance of middle-aged travelers who may be repeat customers or visiting with family.  
3. The 36–45, 26–35, and 18–25 groups collectively represent under 25% of bookings and guests, suggesting clear opportunities to attract younger travelers through targeted marketing, promotions, or specialized packages.   
4. Booking and guest volume rises with age, emphasizing the need to prioritize older demographics in room types, amenities, packages, loyalty programs, and promotions, while also exploring strategies to engage younger travelers.  

#### **VI.1.2 Booking Volume and Guest Distribution by Gender**  
1. Male customers dominate bookings (55.98%) and guest counts (55.72%), making them the primary contributors to occupancy and revenue.  
2. Female customers account for 33.80% of bookings and 34.11% of guests, indicating potential to attract more female travelers through targeted promotions or packages.  
3. The “Other” gender segment represents 10.22% of bookings and 10.17% of guests, highlighting an emerging group that could be engaged via inclusive marketing strategies.  
4. The gender imbalance suggests opportunities to diversify the guest base, optimize marketing, and tailor offerings to underrepresented groups while sustaining occupancy and revenue.  

#### **VI.1.3 Booking Volume and Guest Distribution by Country**  
1. Turkey dominates the hotel’s customer base, contributing 2,944 bookings (≈55.6%) and 3,963 guests (≈55.1%), making it the primary driver of occupancy and revenue.  
2. Germany (1,322 bookings; ≈25%) and the Netherlands (500 bookings; ≈9.5%) are the next largest markets, highlighting significant international demand that could be further leveraged through targeted promotions, partnerships, or packages.  
3. Other countries individually contribute minimal bookings and guests, collectively forming a long tail of international travelers, which represents untapped opportunities to diversify the hotel’s global footprint.  
4. The strong concentration in a few countries indicates that the majority of revenue is driven by top markets, suggesting marketing, loyalty programs, and seasonal campaigns should prioritize these key countries while exploring niche offerings for underrepresented segments.


### **VI.2 Room Utilization and Performance**  

#### **VI.2.1 Booking Volume and Revenue by Room Type**  
1. Double Rooms generate the highest total revenue (≈781,833) despite not having the most bookings, indicating strong demand combined with a relatively high price point and making them a key driver of overall revenue.
2. Single Rooms have the highest booking volume (2,659) but lower average revenue per booking (≈282), highlighting their importance for occupancy and consistent cash flow rather than high per-booking revenue.
3. Suites and Family Rooms achieve the highest average revenue per booking (≈658 and 595, respectively), signaling premium offerings that maximize revenue per guest despite lower total bookings.
4. The distribution suggests opportunities to optimize room allocation, pricing strategy, and targeted promotions, balancing high-volume rooms for occupancy with underbooked premium rooms for profitability.

#### **VI.2.2 Occupancy Rate by Room Characteristics**  
1. Single Rooms achieve full occupancy (100%), indicating extremely strong demand and efficient utilization, but also signaling potential capacity constraints and missed revenue opportunities due to limited room supply.  
2. Double Rooms show high but not saturated occupancy (76.33%), balancing strong demand with available capacity, making them a reliable core room type for both occupancy and revenue optimization.  
3. Family Rooms and Suites have noticeably lower occupancy rates (68.45% and 61.88%), suggesting underutilization despite higher capacity and base prices, which may reflect pricing sensitivity or niche demand.  
4. The decline in occupancy as capacity and price increase highlights opportunities for targeted pricing, bundling, or promotional strategies to improve utilization of larger and premium rooms while maintaining profitability.  

#### **VI.2.3 Stay Duration and Guest Volume by Room Type**  
1. Family Rooms and Suites host the largest groups per booking (≈3 guests), reinforcing their role as group-oriented and premium room types tailored to families and multi-guest travelers rather than high booking volume.  
2. Stay duration is uniform across all room types (≈3 nights), indicating that room selection affects guest volume and capacity utilization more than trip length, with demand driven primarily by occupancy needs.  
3. Double and Single Rooms underpin overall occupancy, with Double Rooms balancing moderate group size and high booking frequency, while Single Rooms primarily serve solo travelers and sustain consistent guest-nights through volume rather than guest density.  


### **VI.3 Revenue and Payment Analysis**  

#### **VI.3.1 Seasonal Impact on Bookings, Guests, and Revenue**  
1. Normal season is the backbone of hotel performance, generating the majority of bookings (4,630), guests (6,289), and revenue (≈1.72M), with a solid average revenue per booking (≈372.50), making it critical for sustaining occupancy and financial stability.
2. High season delivers the highest revenue efficiency, achieving the highest average revenue per booking (≈550.12) despite lower booking volume, reflecting strong pricing power and demand intensity that can be further leveraged through dynamic pricing and premium offerings.
3. Low season shows both low demand and low revenue efficiency, with minimal bookings, guests, and the lowest average revenue per booking (≈173.13), highlighting a clear need for aggressive promotions, bundled packages, or value-based pricing to improve utilization during off-peak periods.

#### **VI.3.2 Total Bookings, Guests, and Revenue by Month**  
1. June is the peak month, generating the highest total revenue (≈245.6K), the most bookings (520), and the highest average revenue per booking (≈472.25), indicating a period of strong demand combined with high pricing power.  
2. March and December show solid revenue performance (≈213.1K and ≈171.2K) supported by relatively high booking volumes, reflecting sustained seasonal demand driven by spring travel and year-end holidays rather than premium pricing.  
3. September represents the weakest month, with the lowest total revenue (≈99.6K) and the lowest average revenue per booking (≈259.42), signaling a clear low-demand, low-yield period that would benefit from targeted promotions or value-based packages.  
4. Most remaining months maintain stable baseline performance, with consistent booking volumes and moderate average revenue per booking (≈350–395), providing dependable revenue outside peak and low extremes.  

#### **VI.3.3 Payment Method Usage by Season**  
1. Credit cards are the dominant payment method across all seasons, accounting for roughly half of all bookings in normal (≈51%), high (≈46%), and low seasons (≈52%), indicating a strong customer preference for card-based payments regardless of demand conditions.  
2. Cash remains a consistently significant secondary payment method, representing around 29–32% of bookings in every season, suggesting that flexible payment acceptance remains essential to accommodate diverse customer preferences.  
3. Online transfers account for the smallest share of bookings across seasons (≈19–23%), indicating lower adoption and presenting a potential opportunity to increase usage through incentives, improved convenience, or targeted digital payment promotions.  

---

## **VII. RECOMMENDATION**  

1. **Strengthen Core Customer Segments**  
    - Prioritize guests aged 56+ and 46–55 through enhanced comfort-focused amenities, premium service touchpoints, and tailored loyalty programs.  
    - Introduce long-stay and premium packages designed for older and repeat travelers to protect and expand the hotel’s primary revenue base.  

2. **Optimize Room Mix, Pricing, and Utilization**  
    - Maintain Double Rooms as the revenue backbone with balanced pricing and availability, while reassessing Single Room pricing or capacity given full occupancy and potential unmet demand.  
    - Improve utilization of Suites and Family Rooms through targeted promotions, bundled experiences, or seasonal pricing adjustments without diluting premium positioning.  

3. **Refine Seasonal and Monthly Revenue Management**  
    - Maximize revenue during peak periods and high season (especially June) using dynamic pricing, upselling, and premium packages.  
    - Stabilize occupancy during low-demand periods (notably September and low season) with value-driven campaigns, extended-stay offers, and targeted promotions.  

4. **Focus and Diversify Market Reach**  
    - Concentrate marketing investment and partnerships on Turkey, Germany, and the Netherlands, which generate the majority of bookings and revenue.  
    - Gradually expand into underrepresented international markets through niche positioning and personalized digital campaigns to reduce reliance on core countries.  

5. **Broaden the Guest Base and Improve Conversion**  
    - Launch targeted campaigns to attract female travelers and younger age groups, while maintaining inclusive marketing for emerging segments.  
    - Enhance booking conversion and operational efficiency by sustaining strong credit card acceptance and encouraging digital payments via simplified checkout and light incentives.   

---

## **VIII. LIMITATION**  

1. **No Causal Insights**  
    The analysis highlights associations between customer demographics, room types, seasons, and revenue, but cannot establish cause-and-effect relationships behind booking or revenue changes.  

2. **Limited Temporal Scope**  
    The dataset covers only one year (2024), restricting the ability to analyze long-term trends, year-over-year seasonality, or structural demand shifts.  

3. **Simplified Revenue Measurement**  
    Revenue is derived from booking records and room prices only, excluding ancillary services, discounts, cancellations, and refunds that may affect true profitability.  

4. **Missing Behavioral and Contextual Factors**  
    The dataset lacks information on travel purpose, booking channels, loyalty status, and external market conditions, limiting deeper interpretation of customer behavior.  

5. **No Operational Cost Perspective**  
    Operational costs, staffing constraints, and capacity changes are not included, preventing evaluation of net profitability and operational efficiency.  