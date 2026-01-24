## Monitoring and Diagnostics: Prometheus Setup & Alerting

## Task 1: Monitoring System Metrics via PromQL

**Objective:** This project contains PromQL expressions designed to monitor key system performance indicators: disk space, memory usage, and CPU load.

**Results**
1. **Free Disk Space**
This expression shows the amount of available space on mounted filesystems (in bytes).
```promql
node_filesystem_avail_bytes{mountpoint="/"}
```
2. **Available Memory**
This expression calculates the actual free RAM. It accounts for both strictly free memory and memory occupied by the page cache and buffers, as the OS can reclaim this space immediately if needed.
```promql
node_memory_MemFree_bytes + node_memory_Cached_bytes + node_memory_Buffers_bytes
```

3. **Load Average (1 minute)**
This metric shows the average system load over the last minute, representing the number of processes in a runnable or uninterruptible state.
```promql
node_load1
```
### Setup Requirements
- Prometheus server must be installed and running.
- Node Exporter must be configured on the target hosts to collect system metrics.


## Task 2: Comprehensive Monitoring Strategy for a WordPress Stack

**Objective:** This document outlines a multi-layered monitoring and alerting strategy for a Linux-based web server hosting a WordPress application (Nginx, PHP-FPM, MySQL).

**Results:**

1. **Infrastructure Level (Hardware/OS)**
_Focus: Prevention of total system failure._
**Disk Space:** Alert if free space < 10%. Prevents database corruption.
```promql
(node_filesystem_avail_bytes{mountpoint="/"} / node_filesystem_size_bytes{mountpoint="/"}) * 100 < 10
```

**RAM Usage:** Alert if usage > 90% for 5m. Prevents OOM Killer from terminating DB processes.
```promql
(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / node_memory_MemTotal_bytes * 100 > 90
```

**CPU Load:** Alert if Load Average > (CPU cores * 2).

2. **Web Server Level (Nginx)**
_Focus: Real-time user experience and connectivity._
**5xx Errors:** Alert if 5xx responses > 5% over 2m. Indicates PHP crashes or gateway timeouts.
```promql
sum(rate(nginx_http_requests_total{status=~"5.."}[1m])) / sum(rate(nginx_http_requests_total[1m])) * 100 > 5
```

**4xx Errors:** Alert if 4xx responses > 10%. Indicates broken links or configuration issues.
```promql
sum(rate(nginx_http_requests_total{status=~"4.."}[5m])) / sum(rate(nginx_http_requests_total[5m])) * 100 > 10
```

3. **Backend Level (PHP-FPM)**
_Focus: Application performance and processing capacity._
**Worker Saturation:** Alert if active PHP-FPM processes > 80% of limit.
```promql
(php_fpm_active_processes / (php_fpm_active_processes + php_fpm_idle_processes)) * 100 > 80
```

**Latency:** Alert if page generation time > 2 seconds.

4. **Database Level (MySQL/MariaDB)**
_Focus: Data availability and query health._
**Service Status:** Critical alert if the database is down.
```promql
mysql_up == 0
```

**Slow Queries:** Alert if slow query rate > 10 per minute
```promql
rate(mysql_global_status_slow_queries[5m]) > 0.16
```

**Evaluation Summary**
This approach ensures high availability by monitoring the entire stack—from hardware limits to backend execution and frontend delivery—allowing for proactive incident response.


## Task 3: Configuring Prometheus Alertmanager

**Objective:** This assignment demonstrates the process of setting up and testing Prometheus Alertmanager. I studied the syntax of Alertmanager rules, created a set of demonstration alerts, and established conditions under which they would reliably fire.

### Steps Performed
- **Alertmanager Study:** Independently researched the principles of operation, installation, and basic configuration of Alertmanager.
- **Deployment:** Alertmanager was launched, and its web interface was accessed.
- **Rule Definition:** A configuration file was created containing the rules for generating alerts.
- **Testing:** Specific conditions were simulated (using specialized PromQL expressions) to deliberately trigger the alerts and verify their firing and routing within the web interface.

### Demonstration Alerts
The following rules were used for demonstration (based on Task 1 expressions, but with conditions guaranteed to fire in a test environment):

- `InstanceDown`: 	Critical alert, fires if a service is unavailable for more than 1 minute.
```promql
up == 0
```

- `AlwaysFiring`: Test alert, fires constantly to immediately see the result in the UI.
```promql
vector(1)
```

- `HighCpuLoad`: Warning for high CPU load (threshold artificially raised).
```promql
100 - avg by (instance) (rate (node_cpu_seconds_total{mode="idle"}[5m])) * 100 > 80
```






