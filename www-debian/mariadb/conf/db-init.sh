#!/bin/bash

# Display the root password (remove this after debugging)
echo "MariaDB root password: ${DB_ROOT_PASSWORD}"

# Start the MariaDB service
echo "Starting the MariaDB service..."
mysqld_safe &

# Wait for MariaDB to be ready
echo "MariaDB service started, waiting for availability..."
while ! mysqladmin ping -hlocalhost -uroot -p${DB_ROOT_PASSWORD} --silent; do
    echo "Waiting for MariaDB service to start..."
    sleep 1
done

# Execute the SQL script to initialize the database
echo "MariaDB is ready, initializing the database..."
mysql -u root -p${DB_ROOT_PASSWORD} < /db.sql
if [ $? -ne 0 ]; then
    echo "Error executing SQL script."
    exit 1
fi

echo "SQL script executed successfully."

# Stop the MariaDB service after initialization
echo "Stopping the MariaDB service after initialization..."
mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown
if [ $? -ne 0 ]; then
    echo "Error stopping the MariaDB service."
    exit 1
fi

# Ensure MariaDB is fully stopped
if mysqladmin ping -hlocalhost --silent; then
    echo "MariaDB did not stop properly."
    exit 1
fi

echo "MariaDB stopped successfully."
