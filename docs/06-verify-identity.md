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

##Signing GitHub Commits

When you release a piece of software, wouldn't it be nice to let your users know that it was not tampered with in anyway?

You can! It's simple, You can cryptographically sign your git commits. Here's how to do it.













