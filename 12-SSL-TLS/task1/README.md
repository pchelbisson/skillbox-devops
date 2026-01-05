## Symmetric Encryption with OpenSSL
This project demonstrates how to securely package and encrypt files using Linux CLI tools.

### Objective
To bundle multiple text files into a compressed archive and protect them using symmetric encryption.

### Workflow
1. Archiving and Compression
Combine source files into a single tar.gz archive:

```bash
tar -czf data.tar.gz file1.txt file2.txt file3.txt

```
2. Encryption
Encrypt the archive using AES-256-CBC with PBKDF2 key derivation:

```bash
openssl enc -aes-256-cbc -pbkdf2 -iter 100000 -e -in data.tar.gz -out data.tar.gz.enc

```

3. Decryption
Restore the original archive from the encrypted file:

```bash
openssl enc -aes-256-cbc -pbkdf2 -iter 100000 -d -in data.tar.gz.enc -out recovered.tar.gz

```

4. Verification
Verify the integrity and list the contents of the decrypted archive:

```bash
tar -tvf recovered.tar.gz

```

### Tech Stack

OS: Ubuntu (Linux)
Tools: Tar (compression), OpenSSL (encryption)
Algorithm: AES-256-CBC

## Security Considerations: Why PBKDF2?

In this project, the `-pbkdf2` flag is used during the encryption process for the following reasons:

*   **Key Derivation:** By default, older versions of OpenSSL used a weak key derivation function. PBKDF2 (Password-Based Key Derivation Function 2) is the modern standard that makes it much harder to derive the encryption key from a password.
*   **Brute-Force Resistance:** Combined with the `-iter 100000` flag, it forces the system to hash the password 100,000 times before generating the final key. This significantly slows down dictionary and brute-force attacks.
*   **Best Practices:** Using PBKDF2 addresses the `*** WARNING : deprecated key derivation used` message and ensures compliance with modern cryptographic recommendations.
