-- Display the current contents of the 'users' table.
SELECT *
FROM users;

-- Update the 'valid_email' flag for the user with email "bob@dylan.com".
UPDATE users
SET valid_email = 1
WHERE email = "bob@dylan.com";

-- Update the email address for the user with email "sylvie@dylan.com".
UPDATE users
SET email = "sylvie+new@dylan.com"
WHERE email = "sylvie@dylan.com";

-- Update the name for the user with email "jeanne@dylan.com".
UPDATE users
SET name = "Jannis"
WHERE email = "jeanne@dylan.com";

-- Display a separator.
SELECT "--";

-- Display the updated contents of the 'users' table.
SELECT *
FROM users;

-- Attempt to update the email address back to its original value for the user with email "bob@dylan.com".
UPDATE users
SET email = "bob@dylan.com"
WHERE email = "bob@dylan.com";

-- Display a separator.
SELECT "--";

-- Display the contents of the 'users' table after the attempted update.
SELECT *
FROM users;
