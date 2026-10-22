[SSH Readme](../README.md) __|__ [__Documemtation__](README.md)

---

__Part: 2__ of 6 in the [series on SSH](README.md)

# Creating our first keypair

We will be using a suite of sofware called OpenSSH. To create a new key we will use a program called `ssh-keygen`.

Just typing the following and following the prompt is enough to create a key.

```
ssh-keygen
```

When the prompts have stopped you will have a new keypair they will likely be named `id_ed25519` and `id_ed25519.pub`.

The first is the private key, the second is the public key.

it's first prefixed with `id`, `ed25519` is the type of encryption used to  create the key.

This key is just fine, however it's good to have different keys for different purposes.

## A keys shelf life

Unlike PGP keys, SSH keys can't be set to expire. So we have to roll our keys ourselves. It's best to add an expiration date to the keys comment and it's name. 

### Picking a name for your key

It's also good to call the keys by the following:

- Who's using it
- What it's for
- What device it's being used from
- How long it's good for

`id_ed25519` just tells us the encryption type, which isn't super helpful... but it would make a fine general purpose development user key in a closed system.

## SSH Key Naming Conventions 

Options are: user, device, service, expiration date

As options are specified the key becomes more secure and specific (use underscores to separate values, except date values which as hyphens).

Name pattern is: `user-device@service_exp-date.pub`

### Here's a table of example keynames

Keynames | Purpose
---------|-------
 `id_ed25519` | generic | could be for anything or everything
`user name` | single user | 1 user, any device, any service
 `system name`  | single device | any servi
`system name dated` | single device w/ expiration,  any service
`service name` | single service from any device
`service name dated` | single service w/ exp
`user name@service name` | single user @ single service
`user device@service dated` |  single user, service, device w/ exp


> [!Tip]
> I recommend naming the key for what it's going to be used for, and in he comment describe the use and specify the date created.
> ex.`8rents github key. Created: 6/4/26 exp: 6/4/28`. You would need to specifically look at the comment to see it though, so it's clearer as the key name.

# `ssh-keygen` options

- `-f <file path>` - output file
- `-C "<commemt>"` - comment (in public key)

syntax:

```bash
ssh-keygen -f ~/.ssh/<keyname> -C "<comment>"
```

example:

```
ssh-keygen -f ~/.ssh/me@github_26-06-05 -C "8rents universal github key. created: 6/5/26; EXPIRES:6/5/27"
```

## Fingerprinting the key

A fingerprint is taking a bit of data and running it through a one way hasinng algorithm to get the result. Anytime we run it through it should give back the same result. 

We use `ssh-keygen` again with the `-l` option to show the keys fingerprint. `-f` is the file we are fingerprinting. Then we can take the fingerprint output and send it to a file like `keyname.fingerprint`

```bash
ssh-keygen -l -f me@github_26-06-05 >> me@github_26-06-05.fingerprint
```

Now that we have a fingerprint we can be sure that our keys haven't been tampered with. More on that in a future article.

---

__Next Article:__ [Part 3: Using SSH Keys to Login to Server & GitHub ](03-using-keys-login.md)