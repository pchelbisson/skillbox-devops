# Building Software (VIM) from Source without Root Privileges

This guide describes how to compile and install software from source code into a local user directory. This approach is useful when you do not have `sudo` access or want to isolate the application from the system-wide packages.

## Prerequisites

Ensure you have the basic build tools installed (usually provided by the system administrator):

- `gcc` / `g++` (Compiler)
- `make` (Build automation tool)
- `tar` (To extract source archives)

## Installation Steps

### 1. Download and Extract Source Code

First, download the source tarball and extract it:

```bash
wget https://example.com/software-1.0.tar.gz
tar -xzvf software-1.0.tar.gz
cd software-1.0
```
---

### 2. Configure the Build Environment
The key step is to use the `--prefix` flag to specify the installation directory. In this example, we install it to `$HOME/local`.

```bash
./configure --prefix=$HOME/local
```

---

### 3. Compile the Source Code
Run `make` to compile the program based on the configuration generated in the previous step.

---

### 4. Install the Software
Install the binaries and assets to the directory specified in the `--prefix`.