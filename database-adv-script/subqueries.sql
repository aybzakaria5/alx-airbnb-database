-- 1. Find all properties where the average rating is greater than 4.0 using a subquery (non-correlated)
SELECT property_id
FROM reviews
GROUP BY property_id
HAVING AVG(rating) > 4.0;

-- 2. Find users who have made more than 3 bookings using a correlated subquery
SELECT u.user_id, u.name
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
