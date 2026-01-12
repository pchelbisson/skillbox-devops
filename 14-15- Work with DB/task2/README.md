# MySQL Full Instance Backup

This project demonstrates the process of performing a comprehensive backup of an entire MySQL installation, including all user-defined databases and system configurations.

## Project Overview
The objective was to create a single, compressed archive containing every database present on the MySQL server. This is a critical task for full system migrations and disaster recovery planning.

## Implementation Details

### 1. Full Dump Strategy
*   Used the `mysqldump` utility with the `--all-databases` (or `-A`) flag. 
*   This ensures that not only application data but also system tables, user privileges, and stored routines are captured.

### 2. Compression
*   To optimize storage space, the backup stream was compressed using the **LZMA** algorithm via the `xz` tool.
*   **Command:** `sudo mysqldump -u root -A | xz > all_db.sql.xz`

### 3. Verification
*   Checked the integrity of the backup by inspecting the compressed stream headers.
*   **Command:** `xzcat all_db.sql.xz | grep "Current Database"`

## Key Takeaways
- Mastery of the `--all-databases` flag for full-server backups.
- Practical application of Linux piping to combine database exports with high-ratio compression.
- Understanding the importance of `sudo` and root access when accessing system-level database records.
