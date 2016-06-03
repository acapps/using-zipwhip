####Create Session for a Provisioned Number

This web request gives you the ability as the Reseller to retrieve a valid sessionKey for a provisioned line assigned to your organization.

**Parameters**

| Parameter | Required | Description |
|:--------|:--------|:----------|
| api_key | TRUE | The key assigned to your organization. |
| phone_number | TRUE | The phone number assigned to your org. |

> Note: Web Request expects a GET request.

**Sample Request**
```SH
$curl -G https://provision.zipwhip.com/api/20140925/account/get-sessionkey \
  -d api_key={api_key} \
  -d phone_number={2065551212}
```

**Sample Response**
```JSON
{
  "success":true,
  "response":"{session_key}"
}
```