-- USE mysql;

-- UPDATE user SET authentication_string=PASSWORD('${DB_ROOT_PASSWORD}') WHERE User='root';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_ROOT_PASSWORD}');

FLUSH PRIVILEGES;

-- Create the databases if they do not exist
CREATE DATABASE IF NOT EXISTS `${DB_NAME}`;
CREATE DATABASE IF NOT EXISTS `${DB_TEST_NAME}`;

-- Create the users
CREATE user '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
CREATE user '${DB_USER_ADMIN}'@'%' IDENTIFIED BY '${DB_PASSWORD_ADMIN}';

-- Grant all privileges on the databases to the users
GRANT ALL PRIVILEGES ON `${DB_NAME}`.* TO '${DB_USER_ADMIN}'@'%';
GRANT ALL PRIVILEGES ON `${DB_NAME}`.* TO '${DB_USER}'@'%';
GRANT ALL PRIVILEGES ON `${DB_TEST_NAME}`.* TO '${DB_USER_ADMIN}'@'%';
GRANT ALL PRIVILEGES ON `${DB_TEST_NAME}`.* TO '${DB_USER}'@'%';

-- Update the password for the root user
-- SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_ROOT_PASSWORD}');
-- ALTER user 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
-- UPDATE user SET authentication_string=PASSWORD('${DB_ROOT_PASSWORD}') WHERE User='root';

-- Refresh privileges
FLUSH PRIVILEGES;
