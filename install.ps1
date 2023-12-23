# PowerShell SSH Install Script

# Check if scoop is installed (check directory)

Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Check if open ssh is installed

scoop install openssh

# check if pgp is installed

scoop install gpg

echo "If you are Brent, get the Private key passphrase ready! Otherwise cancel the private key decrypt"

# Move this directory to the user ~ folder