[Read Me](../README.md) __|__ [To Do List](../TODO.md) __|__ [__Docs__](README.md)

---

This is Part 6 of 6 in the SSH Series

---

__Part 6__

# Using keypairs as a method of identification

> **

---

### Encrypting data with pub/private keypairs

If someone sends you their pubic key, you can encrypt something using your private key and their public key. Then only you and they would be able to decrypt it. This is called **asymmetric encryption**.

### As Proof of Identity

Since only one user (person or device) has a copy of a private key file. It makes logical sense that if they publish their Public key and you encrypt something with your private key and their public key and send it to them. Only they will be able to open it. Therefore it can be used to prove one's identity.

SSH works using public / private key pairs to encrypt data, network connections, files and more.

Each user or server has a pair of keys. One of the keys is **private**, meaning only that user has that key. The other key is **public** meaning that user shares the public key with other users or servers.

---

<3 2026 [8rents](https://github.com/8rents)