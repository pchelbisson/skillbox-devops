# Nginx Hello World Web Page

## Summary
In this task, I installed and configured the Nginx web server and published a simple static HTML page.  
The goal was to understand how Nginx serves files using its configuration and how the `root` directive maps HTTP requests to files on the filesystem.

---

## Goal
Apply basic knowledge of Nginx configuration by setting up a working web server that correctly serves a custom HTML page.

---

## Task Description
The task required:
- Installing and starting the Nginx web server
- Creating a simple HTML page (e.g. *Hello World*)
- Publishing the page using Nginx
- Verifying that the page is correctly displayed in a console browser

---

## Environment
- OS: Linux
- Web server: **Nginx**
- Browser: **Links**
- Configuration path: `/etc/nginx/sites-enabled/default`

---

## Implementation

### Step 1. Install and start Nginx
Nginx was installed using the system package manager and started as a system service.  
The service is running and listening on port **80**.

---

### Step 2. Nginx configuration
The active virtual host configuration is located at:

```text
/etc/nginx/sites-enabled/default

Relevant configuration fragment:

server {
    listen 80;
    root /var/www/html;
    index index.html;
}


This configuration tells Nginx to serve files from the /var/www/html directory and use index.html as the default page.

Step 3. HTML page

A simple HTML file was created in the document root directory:

/var/www/html/index.html


Example content:

<html>
  <body>
    <h1>Hello World</h1>
  </body>
</html>

How It Works

When a client opens http://localhost:

Nginx accepts the request on port 80

The server block from sites-enabled/default is selected

Nginx looks for files in the directory specified by root

The index.html file is found and returned to the client

Nginx does not execute the HTML file — it simply reads it and sends it to the browser.

Result

Nginx is running and serving requests

The custom HTML page is correctly displayed in the Links browser

Configuration and file structure work as expected

Conclusion

This task helped reinforce:

The role of root and index directives in Nginx

The separation between the main Nginx configuration and site-specific configs

The basic request flow from browser to filesystem

This setup forms the foundation for more advanced topics such as virtual hosts, reverse proxying, and HTTPS.