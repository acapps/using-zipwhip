#Zipwhip Enum API
Zipwhip's Enum API gives developers access to critical information about the phone numbers they are interacting with. For example, if you want to only add the "Text Me" button in your CRM software when the recepient's number textable, then you would use Zipwhip's isTextable API.

##Using isTextable
The most basic enum call Zipwhip offers, is the number text-enabled?

###Parameters
|Parameter|Required|Description
|:---------|:--------|:----------
|api_key|True|api_key is provided by Zipwhip.
|phone_number|True|The number to be looked up. In E.164 format.

###Example Request
```sh
$ curl -G https://provision.zipwhip.com/api/20140925/enum/textable \
       -d api_key=[api_key] \
       -d phone_number=[phone_number]
```

###Example Response - It is Textable
```JSON
{
    "error": "false",
    "provider": "Zipwhip US - Syniverse",
    "status_code": "100",
    "textable": true,
    "transaction_id": "1228fb27-376b-832e-737b-1e600437e2d6",
    "type": "tollfree"
}
```

###Example Response - It is Not Textable
```JSON
{
    "error": "false",
    "provider": "unknown",
    "status_code": "100",
    "textable": false,
    "transaction_id": "623f84a4-faa2-e8d5-6609-4238b96fb2da",
    "type": "tollfree"
}
```