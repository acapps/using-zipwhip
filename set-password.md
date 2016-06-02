# Set Password

Change the current password for an account.

## password/set

###Exaple Request
```SH
$curl -G https://api.zipwhip.com/password/change
	-d session={session}
  --data-urlencode currentPassword={existingPassword}
  --data-urlencode password={newPassword}
```

###Example Response
```JSON
{
  "response":"",
  "sessions":null,
  "success":true
}
```
