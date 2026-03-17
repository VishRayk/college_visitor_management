-- Recreate the database schema from backend queries.
-- Safe to run on a fresh database created by docker-compose.

CREATE TABLE IF NOT EXISTS members (
  member_id VARCHAR(32) NOT NULL,
  member_type VARCHAR(32) NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (member_id),
  UNIQUE KEY uniq_members_email (email)
);

CREATE TABLE IF NOT EXISTS students (
  sid VARCHAR(32) NOT NULL,
  sname VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  branch VARCHAR(64) NOT NULL,
  phone VARCHAR(32) NOT NULL,
  PRIMARY KEY (sid),
  UNIQUE KEY uniq_students_email (email),
  UNIQUE KEY uniq_students_phone (phone)
);

CREATE TABLE IF NOT EXISTS faculty (
  fid INT NOT NULL AUTO_INCREMENT,
  fname VARCHAR(255) NOT NULL,
  femail VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  department VARCHAR(128) NOT NULL,
  phone VARCHAR(32) NOT NULL,
  PRIMARY KEY (fid),
  UNIQUE KEY uniq_faculty_email (femail),
  UNIQUE KEY uniq_faculty_phone (phone)
);

CREATE TABLE IF NOT EXISTS adminstaff (
  wid INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone VARCHAR(32) NOT NULL,
  PRIMARY KEY (wid),
  UNIQUE KEY uniq_adminstaff_email (email),
  UNIQUE KEY uniq_adminstaff_phone (phone)
);

CREATE TABLE IF NOT EXISTS guards (
  gid VARCHAR(32) NOT NULL,
  gphone VARCHAR(32) NOT NULL,
  PRIMARY KEY (gid),
  UNIQUE KEY uniq_guards_phone (gphone)
);

CREATE TABLE IF NOT EXISTS appointments (
  appointment_id INT NOT NULL AUTO_INCREMENT,
  requested_by VARCHAR(32) NOT NULL,
  appointment_date DATE NOT NULL,
  visitor_phone VARCHAR(32) NOT NULL,
  visitor_name VARCHAR(255) NOT NULL,
  appointed_by_id VARCHAR(32) NOT NULL,
  status VARCHAR(32) NOT NULL DEFAULT 'not accepted',
  PRIMARY KEY (appointment_id)
);

CREATE TABLE IF NOT EXISTS visitors (
  visid INT NOT NULL AUTO_INCREMENT,
  visitor_name VARCHAR(255) NOT NULL,
  visitor_phone VARCHAR(32) NOT NULL,
  visiting_whom VARCHAR(255) NULL,
  intime DATETIME NOT NULL,
  outtime DATETIME NULL,
  visitor_type VARCHAR(64) NOT NULL,
  appointment_id INT NULL,
  imgverification TEXT NULL,
  PRIMARY KEY (visid),
  KEY idx_visitors_outtime (outtime),
  KEY idx_visitors_appointment_id (appointment_id)
);

CREATE TABLE IF NOT EXISTS visitor_photos (
  id INT NOT NULL AUTO_INCREMENT,
  visid INT NOT NULL,
  picture_url TEXT NOT NULL,
  uploaded_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_visitor_photos_visid (visid)
);

CREATE TABLE IF NOT EXISTS visitor_vehicles (
  id INT NOT NULL AUTO_INCREMENT,
  vis_id INT NOT NULL,
  license_plate VARCHAR(32) NOT NULL,
  PRIMARY KEY (id),
  KEY idx_visitor_vehicles_vis_id (vis_id)
);

CREATE TABLE IF NOT EXISTS guardentry (
  entry_id INT NOT NULL AUTO_INCREMENT,
  gid VARCHAR(32) NOT NULL,
  date_of_entry DATE NOT NULL,
  time_of_entry TIME NOT NULL,
  time_of_checkout TIME NULL,
  PRIMARY KEY (entry_id),
  KEY idx_guardentry_gid (gid)
);

-- Minimal seed data so the app can be tried immediately.
INSERT IGNORE INTO guards (gid, gphone) VALUES ('G1', '9999999999');

