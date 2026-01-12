# Secure MySQL Backup with Dedicated User

This final iteration focuses on security best practices by moving away from the 'root' account.

## Security Enhancements
- **Dedicated Service Account:** Created `backup_user` with limited privileges (`SELECT`, `LOCK TABLES`, etc.).
- **Credential Encapsulation:** Used a separate `.cnf` file to supply credentials to `mysqldump` securely.
- **Access Control:** Restricted configuration file permissions to `600` (read/write only for the owner).
- **Principle of Least Privilege:** The backup user cannot delete or modify data, only read it.

## Remaining Risks & Mitigation
- **Risk:** Plain-text password storage. 
- **Mitigation:** In production, use secret management tools (like HashiCorp Vault) or MySQL's `mysql_config_editor` to encrypt credentials in a `.mylogin.cnf` file.
