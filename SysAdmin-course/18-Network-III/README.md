# SSH and Network Diagnostics

This module covers SSH server configuration, key-based authentication, and traffic analysis using Wireshark.

## 1. Key-Based Authentication and Fingerprint

*   **Objective:** Set up secure SSH access using RSA keys.
*   **Action:** Generated a 4096-bit RSA key pair and deployed the public key to `authorized_keys`.
*   **Result:** Established secure, passwordless access. Verified the server's unique fingerprint (`256 SHA256:iT3N3qCF9H3OHCoTYvlk7IAPfZ7InwsZs6tCQ+rSCTA`).

## 2. Custom SSH Port Configuration

*   **Objective:** Change the standard SSH server port for security purposes.
*   **Action:** Modified `/etc/ssh/sshd_config` to listen on port `2222` and updated NAT port forwarding rules in VirtualBox.
*   **Result:** Verified successful connection on the new port, demonstrating defense-in-depth principles.

## 3. Wireshark Traffic Analysis

*   **Objective:** Capture and analyze DNS traffic using Wireshark.
*   **Action:** Filtered DNS packets during a `curl` request.
*   **Result:** Confirmed that DNS operates on the **Application Layer** and primarily uses **UDP** on the **Transport Layer** for speed and efficiency.
