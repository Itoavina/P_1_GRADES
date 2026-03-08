-- Create initial schema for grade tracking
CREATE DATABASE IF NOT EXISTS grades_db;

CREATE TABLE IF NOT EXISTS students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS grades (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    subject VARCHAR(100) NOT NULL,
    score DECIMAL(5, 2) CHECK (score >= 0 AND score <= 100),
    exam_date DATE
);
