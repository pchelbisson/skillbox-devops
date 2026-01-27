## Yandex Cloud & Docker Practical Tasks

**Objective**
This repository contains a summary of completed tasks for Cloud Infrastructure and Containerization training

### Task 1: Web Server Deployment via CLI

- **Goal:** Create a Compute Instance and host a static web page using Nginx.
- **Infrastructure:** Yandex Cloud Compute Instance (Ubuntu 22.04 LTS).
- **Tools:** `yc CLI`, `SSH`, `Nginx`.
- **Outcome:** A VM was successfully created via command line with SSH-key authentication. Nginx was installed to serve a custom "Hello World" HTML page accessible via a public IP address.

### Task 2: Managed Database Integration (Advanced)

- **Goal:** Deploy a Managed MySQL cluster and connect to it from a virtual machine.
- **Infrastructure:** Managed Service for MySQL (Cluster: my-mysql, Database: my_db).
- **Operations:**
  - Configured Security Groups to allow TCP traffic on port 3306.
  - Installed `mysql-client` on the Compute Instance.
  - Established a remote connection using the `FQDN` of the database host.
- **Outcome:** Created a table schema, performed `INSERT` operations, and verified data persistence with `SELECT` queries.

### Task 3: Docker Containerization

- **Goal:** Install `Docker` and run an isolated Ubuntu container.
- **Workflow:**
  - Installed `docker.io` engine on the cloud VM.
  - Pulled and ran the official ubuntu image in interactive mode.
  - Executed commands within the isolated container environment.
- **Outcome:** Demonstrated understanding of container isolation and the difference between host OS and containerized environments.

### Key Commands Used:

- **VM Creation:** `yc compute instance create ...`
- **DB Creation:** `yc managed-mysql cluster create ...`
- **Docker Run:** `sudo docker run -it ubuntu bash`

### Cleanup:
All resources (VMs, Clusters, and Network Disks) were terminated after successful verification to optimize cloud credit usage.