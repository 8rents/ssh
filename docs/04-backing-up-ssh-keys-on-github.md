[Read Me](../README.md) __|__ [To Do List](TODO.md) __|__ [__Docs__](docs/README.md)

---

This is Part 4 of 7 articles on SSH

---

__Part 4__

# Backing up ssh keys on GitHub


## Encrypting Private Keys with PGP

```bash
# Install gpg tools with scoop
scoop install gpg
```

### Creating an encrypted file

```bash
# Change to your ssh folder
cd ~\.ssh

# Encrypt the private key file
gpg -a --symmetric --cipher-algo AES256 id_ed25519
```

- `-a` encodes the file with ASCII armor so that it is easy to copy into a message or send as an attachment. These files have the file ending in `.asc`.
- `--symmetric` using one key (passcode) instead of a pair (public/private) keys.
- ` --cipher-algo` we are using AES256

This will ask us to enter a passcode twice. I recommend creating the passcode first and then copy it in.

After this you will end up with the file: `id_ed25519.asc`.

## Add the unencrypted private key to the gitignore file


---

__Next Article:__ [Part 5: Using a Backed up Keypair on a new Machine](05-using-a-backedup-keypair.md)