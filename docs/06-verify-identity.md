[SSH Readme](../README.md) __|__ [__Documemtation__](README.md)

__Part: 6__ of 6 in the [series on SSH](README.md)

# Using SSH Keys to Verify Identity

> *This article describes the concept of cryptographic identity and how to make use of it in practical everyday digital affairs*

---

Feel free to **[skip the philosophical bit if you just want to verify your keys with GitHub](#signing-github-commits)** and start signing commits.

> ## The philosophical concept of cryptographic Identity
>
> Lets first give some thought to the concept of identity and identification. What that can mean in a ew different contexts. What is digital identification? How are you digitally identified? 
>
> You might consider a social media profile a method of digital identification. How do you or other people know that the person behind it is who they say? You don't. However if they can login and control the social media profile then that's who it is. the profile is the method of identification.
>
> But that's stupid ,of course it is, that doesn't mean anything... But what if the profile is legitamate but then hacked? It's still a tool of identity. I'm simply going to propose that social media is a kludge tool that attempts to backward force an old and flawed method of identity in a digital world.
>
> ### Asymetric cryptography
>
> As we covered in the previous articles on SSH we know SSH is asymetric meaning it relies on a user holding a pair of keys. One key is public and the other is private.
>
> ### An asymetric challenge
>
> Each user has their own public and private keys. Encrypting a note (called a challenge) with your private key and my public key... then I'm the only user capable of decrypting the challenge.
> 
> Let's consider what that means for our idea of identity
> 
> ## Meatspace vs Cyberspace
>
> Face to face it's easy to see who your iteracting with...
>
> > Notreally... everyone wears a mask of sorts and is capable of deception. 
> 
> However in the digital world you can't see their face (like that matters).
> 
> A public/ private key pair becomes the perfect way to verify the user (not person) is who they claim to be. They have to have the matching key that you were previously provided.
> 
> This now opens working (without trust) but with full confidence with who you interact with in a fully anonymized space.

## Signing GitHub Commits

When you release a piece of software, wouldn't it be nice to let your users know that it was not tampered with in anyway?

You can! It's simple, You can cryptographically sign your git commits. Here's how to do it.

### Getting set up to sign commits

I'm my mind it's best practice to create a new SSH key called `user@github.signing` and give it a command like: 

```
8rents GitHub commit signing key. Created: 26/10/17 Exp: None
```

#### Creating a new key for signing commits 

- `-f` is the output file 
- `-C` is the keys Comment

```bash
ssh-keygen -f ~/.ssh/8rents@github.commit.signing -C "8rents GitHub commit signing key. Created: 26/10/17 Exp: None"
```

#### Fingerprint the key

- `-l` - Gets fingerprint hash

```
ssh-keygen -l -f ~/.ssh/8rents@github.commit.signing >> 8rents@github.commit.signing.fingerprint
```

Now that the key is created, let's encrypt it so we can back it up to Github

### Encrypting the private key

- `-a` - Tells GPG to ASCII encode the encryption so it acts as a normal text file
- `--symmetric` - Tells GPG to encrypt the key with a passcode instead of another key

```
cd ~/.ssh
gpg -a --symmetric 8rents@github.commit.signing
```

Enter a secure passphrase 2x and hit ok.

Now you'll have an `.asc` file with an encrypted private key.

> Make sure to back up the key passphase in a password manager like BitWarden. I'll make a new SSH key item and create several custom fields like:

- `gpg passphrase`
- `fingerprint`
- `public key`
- `date created`

And in the Note Field I'll list the commands that I used to create and encrypt the key.

#### Add the unencrypted private key to the `.gitignore` file

```
echo "8rents@github.commit.signing" >> .gitignore
```

#### Edit your git config file to sign commits

Tell git you want to use an ssh key to sign commits instead of a gpg key.

```
git config --global gpg.format ssh
```

Then add the public signing key you created to your gitconfig to sign commits

```
git config --global user.signingkey ~/.ssh/8rents@github.commit.signing.pub
```

And tell git you want to sign all commits in the future

And then tell git you always want to sign commits

```
git config --global commit.gpgsign true
```

Normally to sign a commit you would need to use the `-S` flag on the commit.

```
git commit -S -m "commit message"
```

However we've added to our user profile in the global gitconfig to sign all commits with the new key there's one thing left to do.

##### Tell GitHub which key will be your signing key

You want to upload the public signing key file to GitHub. Thi way GitHub know that it's us with the key. You can either: 

1. Do this on the website through settings
2. Use the `gh` CLI program to upload the keyfile

Using `gh`:

```
gh ssh-key add .ssh/8rents@git-signing.pub -t "8rents signing ssh key. Added: 10/22/26" --type signing
```

If the upload was sucessful, you'll get an email within a minute confirming the new key.

#### Commit the SSH repo and test out the new key

Once again verify that the `8rents@github.commit.signing` private key wasn't commited into the repository. 

```
git status
```

We only want the keyfiles ending in `.asc`, `.pub` and `.fingerprint`

Once you've confirmed that the private key is being ignored go ahead and:

##### Add all new files to the repo and commit it

```
# Stages all files
git add -A

# commit
```






