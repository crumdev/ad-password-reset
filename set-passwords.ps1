$oldpass = Read-Host "Enter Current Password: " -AsSecureString
$newpass = Read-Host "Enter New Password: " -AsSecureString
$confirmpass = Read-Host "Confirm New Password: " -AsSecureString

$targetpass = ($newpass -eq $confirmpass) ? ($newpass) : (throw "New passwords do not match")

$json = '
{
    "users": [
        {"username":"myusername","domain":"mycompany.com"},
        {"username":"myusername2","domain":"mycompany2.com"}
    ]
}
' | ConvertFrom-Json

Clear-Host

foreach($user in $json.users){
    Write-Host("Setting password for " + $user.domain + "\" + $user.username)
    $creds = New-Object System.Management.Automation.PSCredential ($user.username, $oldpass)
    Set-ADAccountPassword -Identity $user.username `
                        -NewPassword $newpass `
                        -OldPassword $oldpass `
                        -Credential $creds `
                        -server $user.domain
}
