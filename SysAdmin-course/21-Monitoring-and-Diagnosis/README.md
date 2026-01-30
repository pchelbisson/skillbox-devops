## Monitoring and Diagnostics
### Task 1: Load Average Analysis

**Objective:** Observe the impact of launching Telegram and Firefox on the system's Load Average.

**Method:**
- Used `uptime` to establish a baseline before and after launching applications.

**Results:**
The Load Average increased from `0.35` to `1.31`. On a 4-core system, this represents a healthy load with plenty of headroom. The spike is driven by both CPU task processing and I/O wait times during application initialization.

### Task 2: Resource Evaluation for MySQL

**Objective:** Determine if system resources are sufficient to run a second instance of the `mysqld` process.

**Methods:**
- Monitored `%CPU` and `%MEM` for the `mysqld` process using `top`.
- Calculated potential overhead if load were doubled.

**Results:**
The current process consumes approximately `5.2% CPU` and `10.3% RAM`. Doubling this would result in `~10.4% CPU` and `~20.6% RAM` usage. The system can easily handle this; however, RAM is identified as the likely bottleneck under future scaling.

### Task 3: Tracking `iftop` Installation and Usage Logs

**Objective:** Identify log files containing records of `iftop` installation and execution.

**Findings:**
- **Installation Logs:**
  - `/var/log/dpkg.log:` Detailed package state changes.
  - `/var/log/apt/history.log:` Transaction history including the exact command used.
- **Usage Logs:**
  - `/var/log/auth.log:` Records of `sudo` execution (required by `iftop` for network sniffing)

### Task 4: CPU Core Count (Alternative Methods)

**Objective:** Retrieve the number of CPU cores without using cat, top, htop, or atop.

**Solution:**
The following commands were identified as effective alternatives:
- `nproc` (Direct output of available cores).
- `lscpu` (Detailed CPU architecture report).
- `getconf _NPROCESSORS_ONLN` (Querying system configuration variables).
- `grep -c ^processor /proc/cpuinfo` (Direct file parsing without cat).

### Task 5: Firefox Resident Set Size (RSS) Measurement

**Objective:** Determine the resident memory usage of a Firefox process in Megabytes.

**Methods:**
- Filtered process IDs using `pgrep`.
- Extracted memory data using `ps -o rss`.
- Converted the output from Kilobytes to Megabytes (Value / 1024).

**Calculation:** 
**RSS Value:** 318752 
**KBConversion:** \(318752/1024=311.28\text{\ MB}\)
**Result:** The primary Firefox process is utilizing 311.28 MB of physical RAM. 







