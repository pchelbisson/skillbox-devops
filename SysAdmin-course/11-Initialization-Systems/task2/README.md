# TRASH Cleanup with systemd Timer

## Descripton
This task demonstrates the creation of a systemd user service and timer to automate cleanup of the ~/TRASH directory.

## What was done

Created a oneshot systemd user service that runs a cleanup script.

Created a systemd timer that triggers the service once per hour.

Configured the timer to remove files older than one day.

Enabled Persistent=true to ensure missed runs are handled correctly.

Verified the timer and service using systemctl --user.

## Result

The TRASH directory is automatically cleaned on an hourly basis without manual intervention, using systemd instead of cron.