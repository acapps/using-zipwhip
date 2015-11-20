#Zipwhip Enum API
Zipwhip's Enum API gives developers access to critical information about the phone numbers they are interacting with. For example, if you want to only add the "Text Me" button in your CRM software when the recepient's number is a mobile number then you would use Zipwhip's isMobile API.

##Using isMobile
The most basic enum call Zipwhip offers, is the number a mobile number?

###Parameters
|Parameter|Required|Description
|:---------|:--------|:----------
|api_key|True|api_key is provided by Zipwhip.
|phone_number|True|The number to be looked up. In E.164 format.

###Example Request
```sh
$ curl -G https://provision.zipwhip.com/api/20140925/enum/mobile \
       -d api_key=[api_key] \
       -d phone_number=[phone_number]
```

###Example Response - It is a Mobile Number
```JSON
{
	"transaction_id": "5dcfdcf7-1839-84bb-asdf-172bdf32d8e6",
    "is_mobile": true
}
```

###Example Response - It is Not a Mobile Number
```JSON
{
	"transaction_id": "5dcfdcf7-1839-84bb-asdf-192bdf32d8e7",
    "is_mobile": false
}
```