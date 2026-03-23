# Task 1: Containerizing a Python Web Application with Docker Compose

## Project Overview

This project demonstrates the process of containerizing a simple Python web application using **Flask**. The application retrieves the container's hostname (which corresponds to its unique Docker ID) and displays a welcome message. The deployment is managed through **Docker Compose** for a streamlined "single-command" workflow.

## Key Features

- **Automated Environment:** Uses a `Dockerfile` based on `python:3.9-alpine` for a lightweight and secure runtime.
    
- **Orchestration:** Managed by `compose.yaml`, eliminating the need for complex manual `docker run` commands.
    
- **Dynamic Content:** Utilizes the Python `socket` library to identify the specific container instance handling the request.
    

## Project Structure

- `app.py`: The Flask web server logic.
    
- `requirements.txt`: Python dependencies (Flask).
    
- `Dockerfile`: Instructions for building the application image.
    
- `compose.yaml`: Orchestration file defining the service and port mapping.
    

## How to Run

### 1. Build and Start the Service

In the project directory, run the following command:

Bash

```
docker compose up --build
```

This command will build the image from the local `Dockerfile` and start the container in a single step.

### 2. Access the Application

Open your browser and navigate to: `http://<your-server-ip>:8000`

You should see the message: **"Skillbox rules. Hostname is: [Container_ID]"**

## Technical Details

- **Port Mapping:** The application listens on port `8000` inside the container, which is mapped to port `8000` on the host machine.
    
- **Base Image:** Using `alpine` Linux ensures the final image size is kept to a minimum.