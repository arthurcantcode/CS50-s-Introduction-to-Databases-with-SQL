
-- *** The Lost Letter ***
-- List all packages sent from 900 Somerville Avenue
SELECT p.id, p.contents, p.to_address_id
FROM packages p
JOIN addresses a_from ON p.from_address_id = a_from.id
WHERE a_from.address = '900 Somerville Avenue';

-- Check the textual address for each package
SELECT p.id, p.contents, a.address AS to_address
FROM packages p
JOIN addresses a ON p.to_address_id = a.id
WHERE p.from_address_id = (
    SELECT id FROM addresses WHERE address = '900 Somerville Avenue'
);

-- Find the last scan (final location) for the package ID 384 found from last query
SELECT a.address, a.type
FROM scans s
JOIN addresses a ON s.address_id = a.id
WHERE s.package_id = 384
ORDER BY s.timestamp DESC
LIMIT 1;
-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***

