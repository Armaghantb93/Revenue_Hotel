CREATE TABLE revenue (
    date DATE,
    price DECIMAL(10,2),
    bookings INT
);
INSERT INTO revenue VALUES 
    ('2022-01-01', 100.00, 50),
    ('2022-01-02', 120.00, 40),
    ('2022-01-03', 150.00, 30),
    ('2022-01-04', 180.00, 20),
    ('2022-01-05', 200.00, 10);

-- Calculate average price and occupancy for each day
SELECT date, AVG(price) AS avg_price, SUM(bookings) AS total_bookings,
       100 * SUM(bookings) / 100 AS occupancy
FROM revenue
GROUP BY date
ORDER BY date;
-- Calculate revenue and profit for each day
SELECT date, SUM(price * bookings) AS revenue, 
       SUM(price * bookings) - (SUM(bookings) * 50) AS profit
FROM revenue
GROUP BY date
ORDER BY date;
-- Identify the best performing price point for each day
SELECT date, price, bookings, 
       price * bookings AS revenue,
       price * bookings - (bookings * 50) AS profit
FROM revenue
WHERE price = (SELECT MAX(price) FROM revenue WHERE date = r.date)
ORDER BY date;


