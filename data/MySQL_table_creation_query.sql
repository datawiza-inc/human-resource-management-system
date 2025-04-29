CREATE TABLE admin (
  username VARCHAR(30) PRIMARY KEY,
  password INT
);

INSERT INTO admin VALUES ('admin', 1234);
INSERT INTO admin VALUES ('grodgers', 1234);

CREATE TABLE department (
  deptId INT PRIMARY KEY AUTO_INCREMENT,
  deptName VARCHAR(30) UNIQUE NOT NULL,
  assignProject VARCHAR(35),
  deptManager VARCHAR(30) UNIQUE
);

CREATE TABLE employee (
  username VARCHAR(30) PRIMARY KEY,
  name VARCHAR(30),
  password VARCHAR(10),
  DOB DATE,
  deptId INT DEFAULT NULL,
  accountActive BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (deptId) REFERENCES department(deptId)
);

ALTER TABLE department
  ADD FOREIGN KEY (deptManager) REFERENCES employee(username);

INSERT INTO employee (username, name, password, DOB, accountActive)
VALUES
  ('deba@gmail.com','deba','1112','2000-05-16', 1),
  ('ram@gmail.com','deba','1234','2000-07-26', 1);

CREATE TABLE applyLeave (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(30) NOT NULL,
  leaveFrom DATE NOT NULL,
  leaveTo DATE NOT NULL,
  approved BOOLEAN,
  reason VARCHAR(100) NOT NULL,
  FOREIGN KEY(username) REFERENCES employee(username)
);

CREATE TABLE updateStatus (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(30),
  status VARCHAR(150),
  workingdDept INT,
  FOREIGN KEY(workingdDept) REFERENCES employee(deptId)
);