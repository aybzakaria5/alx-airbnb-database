-- 1) INNER JOIN: all bookings with the user who made them
-- Returns only bookings that have a valid user_id match.
SELECT
  b.id            AS booking_id,
  b.property_id,
  b.check_in,
  b.check_out,
  u.id            AS user_id,
  u.name          AS user_name,
  u.email         AS user_email
FROM bookings AS b
INNER JOIN users AS u
  ON u.id = b.user_id
ORDER BY b.id;

-- 2) LEFT JOIN: all properties with their reviews (including properties with NO reviews)
-- Properties with no reviews will show NULLs in the review columns.
SELECT
  p.id            AS property_id,
  p.title         AS property_title,
  r.id            AS review_id,
  r.user_id       AS reviewer_user_id,
  r.rating,
  r.comment
FROM properties AS p
LEFT JOIN reviews AS r
  ON r.property_id = p.id
ORDER BY p.id, r.id;

-- 3) FULL OUTER JOIN: all users and all bookings (even if unmatched)
-- VERSION A: PostgreSQL / SQL Server (supports FULL OUTER JOIN)
-- If you’re on Postgres/SQL Server, use this:
-- SELECT
--   u.id          AS user_id,
--   u.name        AS user_name,
--   b.id          AS booking_id,
--   b.property_id,
--   b.check_in,
--   b.check_out
-- FROM users AS u
-- FULL OUTER JOIN bookings AS b
--   ON b.user_id = u.id
-- ORDER BY COALESCE(u.id, -1), COALESCE(b.id, -1);

-- 3) FULL OUTER JOIN: MySQL-compatible workaround using UNION of LEFT and RIGHT joins.
-- (MySQL doesn’t support FULL OUTER JOIN natively.)
SELECT
  u.id            AS user_id,
  u.name          AS user_name,
  b.id            AS booking_id,
  b.property_id,
  b.check_in,
  b.check_out
FROM users AS u
LEFT JOIN bookings AS b
  ON b.user_id = u.id

UNION

SELECT
  u.id            AS user_id,
  u.name          AS user_name,
  b.id            AS booking_id,
  b.property_id,
  b.check_in,
  b.check_out
FROM users AS u
RIGHT JOIN bookings AS b
  ON b.user_id = u.id

ORDER BY user_id IS NULL, user_id, booking_id;
