# BOUTIQUE HOTEL PERFORMANCE ANALYSIS 

This project analyzes the Boutique Hotel in Turkey dataset from Kaggle to uncover booking patterns, room performance, and revenue trends. Using SQL-based analysis on customer, room, and booking data from 2024, the study provides actionable insights to support revenue optimization and operational efficiency.  


## BUSINESS QUESTIONS  

1. **Customer Demographics and Behavior**  
    - Distribution of customers by age, gender, and country
    - Relationship between demographics, bookings, and guest counts
2. **Room Utilization and Performance**  
    - Booking volume and revenue by room type
    - Occupancy by room capacity and base price
    - Average stay duration and guests per booking
3. **Revenue and Payment Analysis**  
    - Bookings, guests, and revenue by month and season
    - Payment method usage across seasons

---

## OBJECTIVES  

1. Analyze the impact of customer demographics on bookings and guest counts
2. Evaluate room utilization, occupancy, and revenue performance
3. Identify seasonal and monthly trends in bookings and revenue
4. Examine payment method usage across seasons
5. Deliver actionable insights to improve operational efficiency and revenue optimization

---

## DATASET

- **Source:** [Kaggle Boutique Hotel in Turkey Dataset](https://www.kaggle.com/datasets/alperenmyung/boutique-hotel-dataset-in-turkey)  
- **Tables Used:** customers, rooms, orders
- **Timeline:** Booking data for the year 2024

---

## DATA MODEL OVERVIEW 

The dataset uses a relational model with fact tables (`orders`) and dimension tables (`customers`, `rooms`) connected via **primary and foreign keys** to support accurate joins and analysis.

---

## KEY INSIGHTS  

1. **Customer Demographics and Behavior**  
    - Age: Guests aged 56+ dominate bookings and guests (≈54%), making older travelers the hotel’s core customer segment.  
    - Gender: Male customers lead bookings and guest counts (≈56%), while female and other genders present growth opportunities.  
    - Country: Domestic travelers from Turkey (~55%) are the primary market, followed by Germany (~25%) and the Netherlands (~10%), indicating strong but concentrated demand.  

2. **Room Utilization and Performance**  
    - Revenue: Double Rooms generate the highest total revenue, while Single Rooms drive the most bookings, supporting occupancy and cash flow.  
    - Premium Rooms: Suites and Family Rooms achieve the highest revenue per booking but show lower occupancy, suggesting underutilized premium capacity.  
    - Occupancy: Single Rooms are fully occupied (100%), whereas larger and higher-priced rooms have lower utilization, highlighting pricing and promotion opportunities.  

3. **Revenue and Seasonal Trends**  
    - Seasonality: Normal season contributes the majority of bookings and revenue, while high season delivers the highest revenue per booking, reflecting strong pricing power.  
    - Monthly Trends: June is the peak month for bookings and revenue; September is the weakest, indicating a clear off-peak period for targeted promotions.  

4. **Payment Behavior**  
    - Payment Methods: Credit cards dominate across all seasons (~50%), followed by cash (~30%), while online transfers remain least used, representing potential for digital payment adoption initiatives.  

---

## RECOMMENDATION  

1. **Strengthen core customer segments:**  
    Prioritize older and repeat travelers with comfort-focused amenities, loyalty programs, and long-stay or premium packages to protect the main revenue base.  
2. **Optimize room mix and pricing:**  
    Maintain Double Rooms as the revenue backbone, reassess Single Room pricing due to full occupancy, and improve Suite and Family Room utilization through targeted promotions and seasonal pricing.  
3. **Enhance seasonal revenue management:**  
    Maximize high-season and peak-month revenue with dynamic pricing and upselling, while using value-driven offers to stabilize demand during low seasons and weaker months.  
4. **Focus and diversify market reach:**  
    Concentrate marketing efforts on top markets (Turkey, Germany, Netherlands) while gradually expanding into underrepresented international segments to reduce demand concentration risk.  
5. **Broaden guest base and improve payment conversion:**  
    Attract younger and female travelers through targeted campaigns and encourage digital payments by simplifying checkout and offering light incentives.  
  
---

## LIMITATION  

1. **No causal insights:** The analysis identifies patterns but cannot establish cause-and-effect relationships.  
2. **Limited time scope:** Data covers only one year (2024), restricting long-term and year-over-year analysis.  
3. **Simplified revenue view:** Revenue excludes ancillary services, discounts, cancellations, and refunds.  
4. **Missing behavioral and cost context:** Customer intent, booking channels, loyalty status, and operational costs are not included, limiting deeper profitability insights.   

---

## TOOLS USED  
- **MySQL:** Used to design the relational schema and perform analytical queries using joins, aggregations, and filtering to answer business questions and extract insights. 
- **Python (Pandas) and Jupyter Notebook:** Used for data cleaning and preprocessing, including handling missing values, removing duplicates, correcting data types, and validating relational integrity.  
- **Markdown (.md)**: Used to document the analysis report, key findings, and business recommendations in a structured and readable format.  
- **Tableau:** Utilized to visualize key metrics and trends through clear, interactive dashboards and charts.  
