# TCP/IP Stack & Network Diagnostics

This module focuses on the practical application of the TCP/IP protocol suite, covering subnet calculations, service identification, and advanced system diagnostics.

## Key Accomplishments

### 1. Subnetting & Address Management
- **Task:** Capacity analysis of a `/8` network.
- **Learning:** Calculated $2^{24}$ (over 16.7 million) addresses and identified reserved Network/Broadcast IDs.

### 2. Loopback Interface Architecture
- **Task:** Investigating the `127.0.0.0/8` range.
- **Learning:** Confirmed that the entire Class A loopback block is reserved for internal host traffic, with `127.255.255.255` as the upper boundary.

### 3. Service & Port Auditing
- **Task:** Diagnosing `cupsd` and identifying `FidoNet` standard ports.
- **Learning:** Used `ss` and `/etc/services` to map applications to ports (631 for CUPS, 24554 for Binkp).

### 4. Interface Configuration
- **Task:** Host IP identification using modern CLI tools.
- **Learning:** Utilized `ip address show` to retrieve active IPv4/IPv6 configurations on the `enp0s3` interface.
