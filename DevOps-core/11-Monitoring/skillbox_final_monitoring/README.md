# Multi-Node Infrastructure Monitoring Suite

### 🚀 Scalable Monitoring Solution with Prometheus, Grafana, and Telegram Alerting

This project demonstrates a production-ready monitoring ecosystem designed for a distributed microservices architecture (simulating an E-commerce platform). It leverages **Docker Compose** to orchestrate multiple service nodes, each equipped with dedicated exporters for deep infrastructure visibility.

## 🌟 Key Achievements & Features

- **Multi-Tier Architecture Simulation**: Orchestrated three distinct logical environments (Web App, Database, and Monitoring) within a unified Docker network.
    
- **Infrastructure as Code (IaC)**: Fully automated deployment using Docker Compose, ensuring consistent environments across development and production.
    
- **Full-Stack Observability**: Integrated **Prometheus** for metrics collection, **Node Exporters** for OS-level telemetry, and **Grafana** for high-level data visualization.
    
- **Automated Incident Response**: Engineered a multi-level alerting system using **Alertmanager** with real-time **Telegram** integration, reducing MTTR (Mean Time To Repair).
    
- **Advanced Visualizations**: Developed specialized Grafana dashboards utilizing various panel types (Time Series, Gauges, Stat, Pie Charts) and automated **SlideShow** mode for NOC (Network Operations Center) displays.
    

---

## 🏗 System Architecture

The environment consists of several containers acting as independent server nodes:

1. **Frontend/App Node** (`nginx:alpine`): Simulates the user-facing web application.
    
2. **Database Node** (`postgres:alpine`): Simulates the persistent storage layer.
    
3. **Monitoring Stack**:
    
    - **Prometheus**: Time-series database & alerting engine.
        
    - **Grafana**: Analytics and visualization platform.
        
    - **Alertmanager**: Notification routing and silences.
        
    - **Node Exporters**: Deployed on each node to expose hardware/OS metrics.
        

---

## 📊 Critical Metrics & Monitoring Logic

I have prioritized metrics based on their impact on business continuity:

|**Domain**|**Metric**|**Priority**|**Strategic Justification**|
|---|---|---|---|
|**Availability**|`up == 0`|**Critical**|Immediate detection of service outages or network partitions.|
|**Storage**|`node_filesystem_avail_bytes`|**Critical**|Prevents database corruption and downtime due to disk exhaustion.|
|**Network**|`node_network_transmit_bytes`|**High**|Correlates traffic spikes with business events (e.g., flash sales) or DDoS attacks.|
|**Performance**|`node_load1`|**Medium**|Identifies CPU saturation before it impacts user experience (latency).|

---

## 🔔 Alerting Scenarios (Telegram Integrated)

The system is configured to notify on-call engineers for the following events:

- **InstanceDown**: Triggered if any node is unreachable for >1 minute.
    
- **DatabaseStorageFull**: Predictive alert when DB free space drops below 1GB.
    
- **WebServerHighLoad**: Detection of sustained CPU load spikes (Load Avg > 2).
    
- **NetworkFlood**: Detection of abnormal traffic ingress (> 50 MB/s).
    

---

## 🛠 Setup & Deployment

**Prerequisites:** Docker & Docker Compose.

1. Clone the repository and navigate to the project directory.
    
2. Update `alertmanager.yml` with your Telegram Bot credentials.
    
3. Launch the entire stack:
    
    Bash
    
    ```
    docker-compose up -d
    ```
    

### Access Points:

- **Grafana**: `http://localhost:3001` (Pre-configured with Prometheus DataSource)
    
- **Prometheus**: `http://localhost:9090`
    
- **Alertmanager**: `http://localhost:9093`