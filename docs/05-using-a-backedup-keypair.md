[SSH](../README.md) __|__ [__Documemtation__](README.md)

---

__Part: 5__ of [6 article series on SSH](README.md)

# Using a Backed up Keypair

To save some typing create a temporary variable (`$k`) that will be the path to where you want to store your SSH keys.

I store all of my command line configs in a folder called `dotfiles` in my home folder. This is the same as the `.config` folder, just renamed. In the `dotfiles` folder i have a `keys` folder and in there my `ssh` and `pgp` folders. The path is `~/dotfiles/keys/ssh`. 

## Make a temporary variable to hold the path

Before cloning I create a temporary variable with the path to where I want my ssh folder to live. The `$k` is that path. Its mainly just to save some typing.

```
k="$HOME/dotfiles/keys/ssh" 
```

## Clone this Repository

```bash
cd ~ && git clone https://github.com/8rents/ssh $k
```

## Decrypt the private key

```
cd $k 
gpg <private-key-name>
```

Enter the PGP Passphrase when prompted. 

This will decrypt the private keys and import them to the systems keyring.

## Symlink the repo to `~/.ssh`

`cd` back to your home folder (`~`) and then symlink the ssh folder (`$k`) to `.ssh`.

```bash
cd ~ && ln -s $k .ssh
```

Now you have cloned your backed up keys to a new machine.


---

__Next Article:__ [Part 6: Using SSH Keys to Verify Identity](06-verify-identity.md)

---

__(Ɔ) 2026__ [8rents](https://github.com/8rents) & licensed under [Love](../LICENSE.md)