[SSH](../README.md) __|__ [__Documemtation__](README.md)

---

__Part: 1__ of [6 in the series on SSH](README.md)

# Getting started with SSH

SSH (Secure Shell Hash) is an encryption method that uses a public and a private key. The public key is derived from the private key. 

SSH can be used for a wide variety of different things like:

1. Encrypting Data
2. Logging into remote servers
3. Signing messages or git commits
4. User identification

## The Public / Private Keypair Concept

As is implied by the name there's two keys. 

- One of them is public, meaning you can send it to anyone who requests it
- The other is private and should not be shared with anyone or uploaded anywhere.

### Installing OpenSSH

In this guide we are going to be using the SSH suite of programs called `OpenSSH`. It's free and fairly simple to get started with.

#### on Linux

```
apt update && apt install -y openssh
```

#### Mac

```
brew update && brew install openssh
```

#### Windows

```
scoop install openssh
```

Now that OpenSSH is installed the first thing we will do is create a new key pair.

---

__Next Article:__ [Part 2: Creating a New SSH Keypair](02-creating-new-ssh-keypair.md)

---

__(Ɔ) 2026__ [8rents](https://github.com/8rents) & licensed under [Love](../LICENSE.md)