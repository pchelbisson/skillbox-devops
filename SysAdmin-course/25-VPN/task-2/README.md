# Task 2: OpenVPN Server Deployment

## Objective
This project outlines the manual deployment of a secure OpenVPN server on an Ubuntu 22.04 virtual machine. The goal is to provide secure, encrypted internet access for remote clients. The setup involves configuring a local Certificate Authority (CA) using Easy-RSA, generating server and client certificates, and correctly configuring system networking to route client traffic through the server.

## Technology Stack
- **OS:** Ubuntu 22.04 LTS
- **VPN Software:** OpenVPN
- **PKI Management:** Easy-RSA
- **Firewall/NAT:** iptables

## Core Setup Steps
- **System Preparation:** The system was updated, and the `openvpn` and `easy-rsa` packages were installed.
- **Certificate Authority (CA) Setup:** A new Public Key Infrastructure (PKI) was initialized using Easy-RSA to act as our own CA for signing certificates.
- **Server-Side Cryptography:** A server key, a certificate signing request (CSR), and Diffie-Hellman parameters were generated. The CSR was then signed by our CA to create the server's certificate.
- **OpenVPN Server Configuration:** A `server.conf` file was created, defining the network topology (tun), protocol, cryptographic settings, and paths to the generated keys and certificates.
- **Client Configuration Generation:** A key and certificate were generated for a client. These, along with the CA certificate and a base configuration, were embedded into a single .ovpn profile for easy distribution and use.

## Key Configuration Points
- **IP Forwarding:** Kernel IP forwarding (`net.ipv4.ip_forward=1`) was enabled to allow traffic to pass from the tun interface to the public-facing network interface.
- **Network Address Translation (NAT):** The most critical step was setting up a `MASQUERADE` rule in iptables. This rule rewrites the source address of packets originating from the VPN clients (`10.8.0.0/24`) to the server's public IP address, allowing them to communicate with the internet. The rule was made persistent using iptables-persistent.

## Result
The result is a fully functional VPN server. A client using the generated `.ovpn` file can establish a secure connection, and all of their internet traffic is routed through the server. When checking their public IP address (e.g., via an external service), it will match the public IP of the VPN server.