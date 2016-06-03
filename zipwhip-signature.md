# Signature API

Guide for interfacing with the Signature Feature.

## signature/set

Allow integrators to dynamically modify the signature for a specific account.

### Syntax

```
POST /user/signature/set HTTP/1.1
Host: https://api.zipwhip.com

?session=&signature=
```

### Example Request (Custom Signature)

```SH
$curl -X POST https://api.zipwhip.com/user/signature/set \
  -d session={session}
  --data-urlencode signature='This is my signature.'
```

### Example Response (Custom Signature)

```JSON
{
  "response": null,
  "success": true
}
```

### Example Request (Empty Signature)

```SH
$curl -X POST https://api.zipwhip.com/user/signature/set \
  -d session={session}
  --data-urlencode signature=''
```

### Example Response (Empty Signature)

```JSON
{
  "response": null,
  "success": true
}
```
