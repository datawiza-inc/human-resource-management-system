# Human Resource Management System (Full Stack Project)

## Overview

The Human Resource Management System is a comprehensive full-stack Java-based web application. This application is designed to streamline HR operations within an organization, allowing administrators to manage departments, employees, projects, and leave requests efficiently.

## Build and Run

This project is Docker-ready. Follow these steps to build and run:

1. Build the application:

    ```bash
    sh ./scripts/build.sh
    ```

1. Start the services:

    ```bash
    docker compose up -d
    ```

## Functions

- Department Management: Admin can add and delete new departments, view department details, and assign managers and projects to departments.

- Employee Management: Admin has the authority to activate/deactivate employee accounts, transfer employees between departments, and grant or deny leave requests.

- User Authentication: Admin can log in and out of the website.

## Screenshots

### User Login

![Admin Login](https://user-images.githubusercontent.com/69399810/215173006-87684555-ae58-4b34-89a2-0171d7218eca.png)

### Employee List

![Employee List](https://user-images.githubusercontent.com/69399810/215175168-6b081382-ea20-4b10-a24a-53fbf7654139.png)

### Department List

![Department List](https://user-images.githubusercontent.com/69399810/215175874-528eb8a8-3fd0-47ef-8d31-bf9371690ae4.png)

### Leave Application By Employee

![Leave Application](https://user-images.githubusercontent.com/69399810/215177269-765c43c2-8089-4336-8b4c-c7dc98697412.png)

### All Leave Requests By Specific Employee

![All Leave Requests](https://user-images.githubusercontent.com/69399810/215178878-7a7a12a7-14e3-496f-9830-3b169ca1626f.png)

## ER Diagram

![ER Diagram](https://user-images.githubusercontent.com/69399810/215180147-6002f7cb-be5f-4deb-a12c-edac583b702c.png)

## Tech Stack

- Core Java
- Servlet
- JSP
- JDBC
- MySQL
- Tomcat 9.0

## About

This is a full-stack web application where administrators can add projects to specific departments, and employees can work on those projects. Employees can also update project status and apply for leave.

Contributor: [3dharmadev](https://github.com/3dharmadev)

