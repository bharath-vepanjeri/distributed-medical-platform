#!/bin/bash
set -e

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<EOF
CREATE DATABASE IF NOT EXISTS medical_db;
CREATE DATABASE IF NOT EXISTS payment_db;

GRANT ALL PRIVILEGES ON medical_db.* TO '${MYSQL_USER}'@'%';
GRANT ALL PRIVILEGES ON payment_db.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "Databases and privileges created successfully."
