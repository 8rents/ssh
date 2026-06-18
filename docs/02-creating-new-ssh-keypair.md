[Read Me](../README.md) __|__ [To Do List](../TODO.md) _~_|__ [__D ocs__](README.md)

---

This is part 2 of 6 articles on SSH

---

__Part 2__

# Creating a new SSH keypair

Using a program that's part of OpenSSH called `ssh-keygen`.

> [!Tip]
> I recommend naming the key for it's use and in he comment describe the use and specify the date created.
> ex.`8rents github key. Created: 6/4/26`

- `-f` - output file
- `-C` - comment (in public key)

syntax:

```bash
ssh-keygen -f ~/.ssh/<keyname> -C "<comment>"
```

example:

```
ssh-keygen -f ~/.ssh/8rents-github_26-06-05 -C "8rents cross machine github key, created June 5th 2026. EXPIRES:6/5/27"
```

---

__Next Article:__ [Part 3: Using SSH Keys to Login to Server & GitHub ](03-using-keys-login.md)