# Active Directory Password Reset

## Getting Started

You will first need to make sure you have the [Windows Remote Server Administration Tools (RSAT)](https://docs.microsoft.com/en-us/windows-server/remote/remote-server-administration-tools) installed.

Once RSAT is installed you can run `./set-passwords.ps1` from a powershell terminal. If you are doing more than one account at a time all old passwords must match. You will be prompted for your old password. Next you will be prompted twice for your new password to ensure it is typed correctly. Then it will iterate over the list of usernames and attempt to reset them. This will not work on accounts that are locked or expired.
