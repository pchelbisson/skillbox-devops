## Instance 1: App Server (Frontend)

|**Priority**|**Metrics**|**Justification**|
|---|---|---|
|**1. HIGH**|`node_network_transmit_bytes_total`|Allows you to understand whether your content is reaching customers. Zero outgoing traffic = store downtime.|
|**2. Medium**|`node_cpu_seconds_total`|Monitoring processor load helps you scale resources promptly as traffic grows.|


## Instance 2: Database Server (Storage)

|**Priority**|**Metrics**|**Justification**|
|---|---|---|
|**1. CRITIC**|`node_memory_MemTotal_bytes{job="db_server"} - node_memory_MemAvailable_bytes{job="db_server"}`|RAM used. For a database, running out of memory means a process crash (OOM Killer) or performance degradation. This is the most important resource after the CPU.|
|**2. HIGH**|`node_disk_written_bytes_total`|Write intensity. Helps identify abnormal loads, heavy transactions, and predict drive wear.|

## Instance 3: Monitoring Server (Self-monitor)

|**Priority**|**Metrics**|**Justification**|
|---|---|---|
|**1. CRITIC**|`prometheus_tsdb_head_series`|Number of active time series. Shows the current load on the Prometheus database. A sudden increase (cardinality explosion) can lead to the failure of the entire monitoring system.|
|**2. HIGH**|`process_resident_memory_bytes{job="monitoring_node"}`|Prometheus RAM consumption. Allows you to monitor host resource usage. If Prometheus runs out of memory, it will crash and we will stop receiving alerts from other servers.|