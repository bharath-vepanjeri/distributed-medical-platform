USE medical_db;
INSERT IGNORE INTO users (name, email, password, role, active, created_at)
VALUES (
  'Admin',
  'admin@medical.com',
  '$2a$10$e8BIbmOlql1bi9PaDv6I0e8LXxp7fOoIAPeR2J9dlfEQNtY1SUX4G',
  'ADMIN',
  true,
  NOW()
);
