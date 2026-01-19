# DevOps Practice: Custom Debian Package Creation & Management

This guide details the process of creating a custom Debian package (`.deb`) with maintainer scripts (`postinst`, `postrm`) that handle safe configuration reloading for the Nginx web server.

---

## 1. Creating Maintainer Scripts (`postinst` & `postrm`)

### Objective
Implement logic that runs immediately after package installation (`postinst`) and during package removal (`postrm`), specifically to safely reload Nginx configuration.

### Key Concepts
*   **`postinst`**: Executed after the package is installed. Used here to reload Nginx configuration to apply changes made by the package.
*   **`postrm`**: Executed when the package is removed or purged. Used here to safely reload Nginx configuration again, cleaning up any applied changes.
*   **Safety Checks**: Scripts include validation (`nginx -t`) to ensure configuration syntax is correct before attempting a reload (`systemctl reload nginx`), preventing service failure.
*   **`dpkg` Stages**: Scripts handle different stages (`configure`, `remove`, `purge`).

### Snippet Example (Logic in both scripts)

```bash
case "$1" in
    configure|remove|purge)
        if [ -x "$(command -v nginx)" ]; then
            # Check Nginx configuration syntax safely
            if nginx -t >/dev/null 2>&1; then
                echo "Reloading Nginx config..."
                systemctl reload nginx
            else
                echo "Warning: Nginx configuration test failed, skipping reload."
            fi
        fi
    ;;
esac
```
---

## 2. Building and Managing the Package

### Objective

Structure files for a custom package and use `debuild` (or `dpkg-deb`) to create the `.deb` file, then manage installation and removal with `dpkg`.

### Tools & Commands Used
* `debuild`: Automates the Debian package build process.
* `dpkg -i`: Installs a local .deb package.
* `dpkg -r`: Removes a package (leaves config files behind).
* `dpkg -P`: Purges a package (removes all associated files, including configuration).

### Key Concepts
* Directory Structure: Required layout includes a `DEBIAN/` folder containing `control`, `postinst`, `postrm`, etc., and the actual file structure mimicking the target system root (`usr/local/bin/`).
* `control` file: Contains essential package metadata (Package Name, Version, Architecture, Dependencies).
* Execution Verification: Logs confirm that the postinst script runs during installation and the postrm script runs during both remove and purge operations.

### Findings (Example Package: nginx-wp-config_1.0-1_all.deb)
Successfully built, installed, and purged the package, verifying script execution via console output logs. The safe reload logic ensured Nginx service continuity throughout the lifecycle management operations.

