CREATE DATABASE IF NOT EXISTS employee_management_system;
USE employee_management_system;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    address TEXT,
    department VARCHAR(50),
    position VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE NOT NULL,
    status ENUM('Active', 'Inactive', 'Terminated') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    date DATE NOT NULL,
    check_in TIME,
    check_out TIME,
    status ENUM('Present', 'Absent', 'Late', 'Half-day') DEFAULT 'Present',
    remarks TEXT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE
);

CREATE TABLE leave_requests (
    leave_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    leave_type ENUM('Sick', 'Casual', 'Annual', 'Unpaid') NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    reason TEXT,
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    approved_by INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE
);

CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    month VARCHAR(20) NOT NULL,
    year INT NOT NULL,
    basic_salary DECIMAL(10, 2),
    net_salary DECIMAL(10, 2),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE
);
