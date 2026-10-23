[SSH](../README.md) __|__ [__Documemtation__](README.md)

---

__Part: 4__ of [6 in the series on SSH](README.md)

# Backing up ssh keys on GitHub

Since we don't want to share our private key with anyone. It's beat practice to encrypt it bwfore backing it up.

## Encrypting your private SSH Keys with PGP

### Install GPG

*on windows* use `gpg-tools`

```bash
# Install `gpg-tools` with `scoop`
scoop install gpg
```

*on Linux/Debian* use `gnupg`

```
# install gnupg with apt
apt install gnupg -y
```

### Creating an encrypted file

We want to encrypt our private SSH key with a password and then set git to ignore the private key file

```bash
# Change to your ssh folder
cd ~/.ssh
```

My private key is called `id_ed25519`

```
# Encrypt the private key file
gpg -a --symmetric id_ed25519
```

> Options Reference
>
>  `-a` encodes the file with ASCII armor so that it is easy to copy into a m> essage or send as an attachment. These files have the file ending in `.asc`.
> - `--symmetric` using one key (passcode) instead of a pair (public/private) keys

This will ask us to enter a passcode twice. I recommend creating the passcode first and then copy it in. I both create and store my passcode in Bitwarden.

After this you will end up with the file: `id_ed25519.asc`.

## Add the unencrypted private key to the `.gitignore` file


```
echo "id_ed25519.asc" > .gitignore
```

Then when you commit and push the repository only the encrypted file will be uploaded to GitHub.

---

__Next Article:__ [Part 5: Using a Backed up Keypair on a new Machine](05-using-a-backedup-keypair.md)

---

__(Ɔ) 2026__ [8rents](https://github.com/8rents) & licensed under [Love](../LICENSE.md)