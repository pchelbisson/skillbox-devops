# React App Deployment in Virtual Environment

## Project Overview

This project involves deploying a React demonstration application on Ubuntu 22.04 within a VirtualBox environment. The primary objective was to configure a stable development environment accessible via a static IP address with functional Hot Reloading.

## Implementation Steps:

1. **Infrastructure Setup:**
    
    - Configured dual network adapters: **NAT** (internet access) and **Host-only** (host-guest communication).
        
    - Assigned a static IP `10.10.10.10` to the `enp0s8` interface.
        
    - Set up **VirtualBox Shared Folders** for seamless code synchronization between Windows (Host) and Ubuntu (Guest).
        
2. **Environment Configuration:**
    
    - Installed Node.js, Yarn, and project dependencies.
        
    - Implemented a `mount --bind` strategy for the `node_modules` directory to bypass `vboxsf` filesystem limitations regarding symbolic links.
        
3. **Application Launch:**
    
    - Bound the application to `0.0.0.0` to ensure it listens on all network interfaces, including the static Host-only IP.
        
    - Utilized `--openssl-legacy-provider` for compatibility with modern Node.js versions.
        

## Challenges & Troubleshooting:

- **Dependency Installation Issues in Shared Folders:**
    
    - _Symptoms:_ Errors during symlink creation in `node_modules` on the `vboxsf` filesystem.
        
    - _Solution:_ Relocated `node_modules` to the native Linux filesystem and used `mount --bind` to link it back to the project folder.
        
- **Broken Hot Reload (HMR):**
    
    - _Symptoms:_ Code changes on the Host machine were saved but not reflected in the browser.
        
    - _Solution:_ Enabled file polling by setting `CHOKIDAR_USEPOLLING=true`. This is necessary as the Linux kernel does not receive `inotify` events from the host filesystem.
        
- **Network Reachability (VPN Interference):**
    
    - _Symptoms:_ Successful `ping` to the VM, but connection refused in the browser.
        
    - _Solution:_ Identified and disabled an active VPN on the Host machine that was intercepting traffic destined for the VirtualBox local network.
        

## Key Learning Outcomes:

This task simulated a real-world DevOps workflow, focusing on:

1. **Network Engineering:** Bridging communication between host and guest systems.
    
2. **Advanced Troubleshooting:** Identifying silent failures in filesystem events and network routing.
    
3. **Professional Git Flow:** Managing branches, resolving upstream conflicts, and using secure authentication (PAT).