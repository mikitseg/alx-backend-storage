-- Create a trigger named 'decrease_q' that fires after inserting a new row into the 'orders' table.
-- This trigger decreases the quantity of an item in the 'items' table after adding a new order.

CREATE TRIGGER decrease_q AFTER INSERT ON orders FOR EACH ROW
UPDATE items SET quantity = quantity - NEW.number WHERE name = NEW.item_name;

