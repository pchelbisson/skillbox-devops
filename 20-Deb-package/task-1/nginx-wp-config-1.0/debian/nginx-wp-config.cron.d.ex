#
# Regular cron jobs for the nginx-wp-config package
#
0 4	* * *	root	[ -x /usr/bin/nginx-wp-config_maintenance ] && /usr/bin/nginx-wp-config_maintenance
