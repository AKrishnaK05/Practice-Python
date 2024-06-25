USE amazon;
-- TCL

-- COMMIT
commit;

-- ROLLBACK
rollback;

-- SAVEPOINT
savepoint a;
rollback to a;

-- TRIGGERS
-- AFTER INSERT
DELIMITER //
CREATE TRIGGER products_after_insert
AFTER INSERT ON products
FOR EACH ROW
BEGIN
INSERT INTO product_log(pid,pname,price,stock,location,inserted_at)
VALUES (NEW.pid, NEW.pname, NEW.price, NEW.stock, NEW.location, NOW());
END //
DELIMITER ; 

DELIMITER // 
CREATE TRIGGER orders_after_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
UPDATE products
SET stock = stock - 1
WHERE pid = NEW.pid;
END //
DELIMITER ;

-- AFTER UPDATE
DELIMITER // 
CREATE TRIGGER products_after_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
IF OLD.pid <> NEW.pid OR OLD.pname <> NEW.pname OR OLD.price <> NEW.price OR OLD.stock <> NEW.stock OR OLD.location <> NEW.location THEN
INSERT INTO product_log(pid,pname,price,stock,location,update_at)
VALUES(OLD.pid,OLD.pname,OLD.price,OLD.stock,OLD.location,NOW());
END IF;
END //
DELIMITER ;

-- AFTER DELETE
DELIMITER //
CREATE TRIGGER products_after_delete
AFTER DELETE ON products
FOR EACH ROW
BEGIN
DECLARE has_orders INT DEFAULT (0);
SELECT COUNT(*) INTO has_orders
FROM orders
WHERE pid = OLD.pid;
IF has_orders > 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete product with existing orders. Update or delete orders first.';
END IF;
END // 
DELIMITER ;

-- BEFORE INSERT
DELIMITER //
CREATE TRIGGER set_default_payment_status
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
IF NEW.status IS NULL THEN
SET NEW.status = 'Pending';
END IF;
END // 
DELIMITER ;

-- CREATE OR REPLACE VIEW
-- 1.example creates or replaces a view named active_customers_mumbai that shows customer ID, name, and address for customers older than 25 who live in addresses containing "Mumbai"
CREATE OR REPLACE VIEW active_customers_mumbai AS
SELECT c.cid, c.cname, c.address
FROM customer c
WHERE c.age > 25 AND c.address LIKE '%Mumbai%';

-- 2. View for Customers and their Orders
CREATE VIEW customer_orders AS
SELECT c.cid, c.cname, o.oid, o.amt, p.pname
FROM customer c
JOIN orders o ON c.cid = o.oid
JOIN products p ON o.pid = p.pid;

-- 3.View for Total Orders by Location
CREATE VIEW total_orders_by_location AS
select p.location, p.pname, count(o.oid) as total_orders
from products p
join orders o on p.pid = o.pid
group by p.location, p.pname;

-- 4.View for Payment Status
CREATE VIEW order_payment_status AS
SELECT o.oid, o.amt, p.mode, p.status
FROM orders o
JOIN payment p ON o.oid = p.oid;

-- removes a view from the database.
DROP VIEW active_customers_mumbai;
