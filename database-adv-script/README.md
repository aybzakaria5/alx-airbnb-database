## Aggregation and Window Functions Task

### Objective
Use SQL aggregation and window functions to analyze data.

### Instructions

1. **Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.**
2. **Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.**

### Example Solutions (see `aggregations_and_window_functions.sql`)

```sql
-- 1. Total number of bookings made by each user
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

-- 2. Rank properties based on total bookings
SELECT property_id, total_bookings,
	   ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num,
	   RANK() OVER (ORDER BY total_bookings DESC) AS rank_num
FROM (
	SELECT property_id, COUNT(*) AS total_bookings
	FROM bookings
	GROUP BY property_id
) AS property_bookings;
```
## Subqueries Task

### Objective
Write both correlated and non-correlated subqueries.

### Instructions

1. **Find all properties where the average rating is greater than 4.0 using a subquery.**
2. **Write a correlated subquery to find users who have made more than 3 bookings.**

### Example Solutions (see `subqueries.sql`)

```sql
-- 1. Non-correlated subquery: Properties with average rating > 4.0
SELECT property_id
FROM reviews
GROUP BY property_id
HAVING AVG(rating) > 4.0;

-- 2. Correlated subquery: Users with more than 3 bookings
SELECT u.user_id, u.name
FROM users u
WHERE (
	SELECT COUNT(*)
	FROM bookings b
	WHERE b.user_id = u.user_id
) > 3;
```
# ALX Airbnb Database Advanced Script Project

## About the Project
This project is part of the ALX Airbnb Database Module, focusing on advanced SQL querying and optimization techniques with a simulated Airbnb database. You will tackle real-world challenges such as optimizing query performance, writing complex SQL scripts, and applying indexing and partitioning. This hands-on experience will prepare you to manage large-scale applications where efficiency and scalability are essential.

## Learning Objectives
By completing this project, you will:

- **Master Advanced SQL:** Write complex queries involving joins, subqueries, and aggregations for data retrieval and analysis.
- **Optimize Query Performance:** Analyze and refactor SQL scripts using performance tools like `EXPLAIN` and `ANALYZE`.
- **Implement Indexing and Partitioning:** Apply indexing and table partitioning to improve performance for large datasets.
- **Monitor and Refine Performance:** Continuously monitor database health and refine schemas and queries for optimal results.
- **Think Like a DBA:** Make data-driven decisions about schema design and optimization strategies for high-volume applications.

## Requirements
To succeed in this project, you should:

- Have a solid understanding of SQL fundamentals (SELECT, WHERE, GROUP BY, etc.).
- Be familiar with relational database concepts (primary keys, foreign keys, normalization).
- Know basic performance monitoring tools (`EXPLAIN`, `ANALYZE`).
- Be able to set up and manage a GitHub repository for submissions.

## Key Highlights

1. **Defining Relationships with ER Diagrams**
	- Model relationships and dependencies between users, bookings, properties, and reviews in the Airbnb schema.

2. **Complex Queries with Joins**
	- Gain expertise in SQL joins (INNER JOIN, LEFT JOIN, FULL OUTER JOIN) to extract meaningful insights from multiple tables.

3. **Power of Subqueries**
	- Develop proficiency with correlated and non-correlated subqueries for advanced data analysis.

4. **Aggregations and Window Functions**
	- Use SQL aggregation functions (COUNT, SUM) and advanced window functions (ROW_NUMBER, RANK) for analytical tasks.

5. **Indexing for Optimization**
	- Identify bottlenecks and create indexes for frequently queried columns. Analyze the impact on query execution times.

6. **Query Optimization Techniques**
	- Write and refactor complex queries to improve execution times by reducing redundancies and leveraging indexing.

7. **Partitioning Large Tables**
	- Implement table partitioning (e.g., on the Booking table) to improve performance for queries on date ranges.

8. **Performance Monitoring and Schema Refinement**
	- Monitor query performance using `SHOW PROFILE` and `EXPLAIN ANALYZE`, identify bottlenecks, and propose schema changes.

This comprehensive workflow ensures you learn to write efficient SQL queries and think strategically about database design and optimization, preparing you for real-world challenges in high-performance applications.

## 📝 Project Assessment (Hybrid)
Your project will be evaluated primarily through manual reviews. To ensure you receive your full score, please:

- ✅ Complete your project on time
- 📄 Submit all required files
- 🔗 Generate your review link
- 👥 Have your peers review your work

An auto-check will also verify the presence of core files needed for manual review.

## ⏰ Important Note
If the deadline passes, you won’t be able to generate your review link—so be sure to submit on time!

We’re here to support your learning journey. Happy coding!
