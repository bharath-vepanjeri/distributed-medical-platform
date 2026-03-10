USE medical_db;

INSERT IGNORE INTO users (name, email, password, role, active, created_at)
VALUES (
  'Admin',
  'admin@medical.com',
  '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhu2',
  'ADMIN',
  true,
  NOW()
);
