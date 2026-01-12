# MySQL Automated Backup System

This project implements a robust, automated backup solution using Bash scripting and Systemd units.

## Features
- **Integrity Check:** The script verifies if the MySQL service is active before starting.
- **Timestamped Archives:** Backups are named with the exact date and time (e.g., `all_db_2026-01-11_08-00.sql.xz`).
- **High Compression:** Uses LZMA (`xz`) for minimal storage footprint.
- **Auto-Cleanup:** Automatically deletes backups older than 7 days using the `find` command.
- **Scheduling:** Fully automated via Systemd Timers (daily execution).

## Components

### 1. Backup Script (`mysql_backup.sh`)
Handles the logic of dumping databases, compressing them, and cleaning up old files.

### 2. Systemd Service (`mysql-backup.service`)
Defines how the script should be executed. Being a `oneshot` type, it runs and then exits.

### 3. Systemd Timer (`mysql-backup.timer`)
Replaces traditional cron jobs. Set to run daily with `Persistent=true`, ensuring that if the server was down during the scheduled time, the backup runs immediately upon boot.

## How to Verify
- **List Timers:** `systemctl list-timers --all`
- **Check Logs:** `journalctl -u mysql-backup.service`
