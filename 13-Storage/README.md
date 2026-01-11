# Linux Storage Management Practice

This project covers fundamental DevOps skills regarding file system mounting and disk partitioning within a Linux environment.

## Task 1: ISO Image Mounting
**Goal:** Practice manual mounting of read-only loop devices.
*   **Action:** Downloaded an Ubuntu ISO image and attached it to the filesystem.
*   **Key Command:** `sudo mount -o loop <path_to_iso> /mnt/iso`
*   **Outcome:** Gained access to the contents of a disk image as a local directory.

## Task 2: Disk Partitioning and Persistent Mounting
**Goal:** Configure a new physical storage device with automated mounting via `fstab`.
*   **Process:** 
    1. Identified the new block device using `lsblk`.
    2. Created a new partition table and primary partition using `fdisk`.
    3. Formatted the partition with the **ext4** file system.
    4. Retrieved the unique **UUID** of the device for reliable identification.
    5. Configured `/etc/fstab` to ensure the disk mounts automatically upon system boot.
*   **Outcome:** Implemented a production-ready persistent storage solution.

## Skills Demonstrated
- Command Line Interface (CLI) proficiency.
- Disk management (`fdisk`, `mkfs.ext4`, `blkid`, `lsblk`).
- System administration and persistent configuration (`/etc/fstab`).
