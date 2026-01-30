# MySQL Backup and Recovery Practice

This project demonstrates the ability to manage MySQL databases, create compressed backups, and perform data restoration using Linux CLI tools.

## Project Overview
The goal was to create a sample database, perform a logical backup using the LZMA compression algorithm, and restore it into a new database environment to verify data integrity.

## Steps Performed

### 1. Database Initialization
*   Created a database named `mydb`.
*   Defined a `students` table with schema: `ID`, `LastName`, `FirstName`, and `eMail`.
*   Populated the table with sample records.

### 2. Compressed Backup (LZMA)
*   Used the `mysqldump` utility to generate a logical backup.
*   Streamed the output through the `xz` compressor to apply the **LZMA** algorithm.
*   **Command:** `mysqldump -u root -p mydb | xz > mydb_backup.sql.xz`

### 3. Restoration & Verification
*   Created a target database named `mydb_restored`.
*   Restored the data directly from the compressed file without intermediate extraction using `xzcat`.
*   **Command:** `xzcat mydb_backup.sql.xz | sudo mysql mydb_restored`
*   Verified data consistency by querying the `students` table in the new database.

## Technical Skills Demonstrated
- **Database Administration:** MySQL CRUD operations and schema management.
- **Backup Strategy:** Logical backups via `mysqldump`.
- **Data Compression:** Using `xz` (LZMA) for efficient storage management.
- **Linux Pipelines:** Advanced use of stdout/stdin redirection and pipes (`|`).
- **Security:** Handling `auth_socket` authentication and `sudo` privileges in Linux.
