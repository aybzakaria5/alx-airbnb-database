-- 1. Find the total number of bookings made by each user
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

-- 2. Rank properties based on the total number of bookings using ROW_NUMBER and RANK
SELECT property_id, total_bookings,
       ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num,
       RANK() OVER (ORDER BY total_bookings DESC) AS rank_num
FROM (
    SELECT property_id, COUNT(*) AS total_bookings
    FROM bookings
    GROUP BY property_id
) AS property_bookings;
