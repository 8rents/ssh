# SSH Keys

> ***Brent's `.ssh` directory. Learn all about using SSH or use his keys to encrypt secret messages & data that only you and he can open.***

---

## Table of Contents

- Using Brent's keys if you are not Brent
  - As Proof of Identity
  - Encrypting data with pub/private keypairs
- Using this Repo if you are Brent
- Creating secure SSH keys on Windows
- Encrypting Private Keys with PGP

## Using these Keys if you are not Brent

SSH works using public / private key pairs to encrypt data, network connections, files and more.

Each user or server has a pair of keys. One of the keys is **private**, meaning only that user has that key. The other key is **public** meaning that user shares the public key with other users or servers.

### Encrypting data with pub/private keypairs

If someone sends you their pubic key, you can encrypt something using your private key and their public key. Then only you and they would be able to decrypt it. This is called **asymmetric encryption**.

### As Proof of Identity

Since only one user (person or device) has a copy of a private key file. It makes logical sense that if they publish their Public key and you encrypt something with your private key and their public key and send it to them. Only they will be able to open it. Therefore it can be used to prove one's identity.

#### **Fingerprinting Keys**

Using a one way hashing algorithm. We can make a fingerprint of a key. **One way hashing algorithms will always produce a unique output for every unique input**. If they produce two same outputs for two different inputs (or vice a versa), this would be called a **hash collision** and render the algorithm obsolete.

***More on this later...***

## Using this Repo if you are Brent

1. Clone this Repository to `~/.ssh`
2. On **Windows**, run `.\install.ps1` or on **Mac or Linux**, run `./install.sh` 
3. Enter the PGP Passphrase when prompted. This will decrypt the private keys and import them to the systems keyring.

## Creating secure SSH keys on Windows

Using Scoop in PowerShell to download OpenSSH

### In PowerShell

```bash
# Allow PowerShell to run scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install Scoop
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Install OpenSSH with Scoop
scoop install openssh
```

### Creating Keys with OpenSSH

Using a program that's part of OpenSSH called `ssh-keygen`.

```bash
ssh-keygen -t ed25519 -b 4096 -C "8rents@gmail.com"
```

- `ssh-keygen` - The name of the program
  - `-t` The type of encryption. in this case `ed25519`
  - `-b` the number of bits. `4096`
  - `-C`Comment. In this case my email address.

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

### Decrypting the private key file

```																																																																		bash
gpg -a --decrypt id_ed25519.asc --output id_ed25519
```

## Backing the keys up on GitHub

In the `.ssh` folder create a `.gitignore` file. In that file write: `id_ed25519`. This way git will ignore the private key file and only upload the encrypted one.



---

**🤍 2023 [Brenton Holiday](https://brenton.holiday)**