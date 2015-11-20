#Zipwhip Web Hooks
Web Hooks allow Server-to-Server communication of new events, without the hassle
of a persistent connection. The idea behind Web Hooks is to give implementers the ability to receive real-time events as items change within Zipwhip.

##Security
With all items involving messages and messages bodies, it is important to setup Web Hooks with privacy in mind.

* It is recommended that the destination address is HTTPS.
* Zipwhip supports TLS V1.0 and greater.
> Zipwhip does not support SSL V3.0 and older.

###Access Control List, ACL
If you have strict firewall rules or would prefer to lock down your Web Hook end-points to our IP space, then those ranges are provided below.

> 69.46.44.0/24

> 208.69.95.64/26

##General Information

###Events
As the implementer, you can chose which events you would like to listen for.

* Delete
* Progress
* Read
* Receive
* Send

###Example Payload
```
POST /message/receive HTTP/1.1
User-Agent: Jakarta Commons-HttpClient/3.1
Host: http://www.yoururl.com/zipwhip/api/receive
Content-Length: 581
Content-Type: application/json; charset=UTF-8
```

```JSON
{  
  "body":"Thanks for texting, this is an auto reply!",
  "bodySize":42,
  "visible":true,
  "hasAttachment":false,
  "dateRead":null,
  "bcc":null,
  "finalDestination":"4257772300",
  "messageType":"MO",
  "deleted":false,
  "statusCode":4,
  "id":634151298329219072,
  "scheduledDate":null,
  "fingerprint":"132131532",
  "messageTransport":9,
  "contactId":3382213402,
  "address":"ptn:/4257772222",
  "read":false,
  "dateCreated":"2015-08-19T16:53:45-07:00",
  "dateDeleted":null,
  "dateDelivered":null,
  "cc":null,
  "finalSource":"4257772222",
  "deviceId":299538202
}
```

##Adding Web Hooks
Install a Web Hook onto the text-enabled phone number. When an event occurs the details of the message will be delivered to the URL specified.

###Parameters
|Parameter|Required|Description
|:---------|:--------|:----------
|session|True|Session is the response of user/login.
|type|True|For now, the available options is 'message'
|event|True|Events listed above. i.e. send, receive, etc.
|url|True|The destination when the event fires.
|method|False|HTTP Method used for Web Hook. i.e. POST, PUT, GET

###Example Request
```sh
$ curl -X POST https://api.zipwhip.com/webhook/add \
       -d session=[sessionKey] \
       -d type=message \
       -d event=receive \
       -d url=https://test.zipwhip.com/message/receive \
       -d method=POST
```

###Example Response
```JSON
{
	"success": true,
	"response": [
		{
			"webhookId": 687557714,
			"type": "message",
			"event": "receive",
			"url": "https://test.zipwhip.com/message/receive",
			"method": "POST"
		}
	]
}
```

##Updating Web Hooks
Update an existing Web Hook configuration. Change the URL or update the Method used.

###Parameters
|Parameter|Required|Description
|:---------|:--------|:----------
|session|True|Session is the response of user/login.
|webhookId|True|The Id of an installed Web Hook.
|url|False|The destination when the event fires.
|method|False|HTTP Method used for Web Hook. i.e. POST, PUT, GET

###Example Request
```sh
$ curl -X POST https://api.zipwhip.com/webhook/update \
       -d session=[sessionKey] \
       -d method=PUT
```

###Example Response
```JSON
{
	"success": true,
	"response": [
		{
			"webhookId": 687557714,
			"type": "message",
			"event": "receive",
			"url": "https://test.zipwhip.com/message/receive",
			"method": "PUT"
		}
	]
}
```

##List Web Hooks
List the currently installed Web Hooks for the account.

###Parameters
|Parameter|Required|Description
|:---------|:--------|:----------
|session|True|Session is the response of user/login.

###Example Request
```sh
$ curl -G https://api.zipwhip.com/webhook/list \
       -d session=[sessionKey]
```

###Example Response
```JSON
{
	"success": true,
	"response": [
		{
			"webhookId": 687557714,
			"type": "message",
			"event": "receive",
			"url": "https://test.zipwhip.com/message/receive",
			"method": "PUT"
		}
	]
}
```

##Delete Web Hooks
Update an existing Web Hook configuration. Change the URL or update the Method used.

###Parameters
|Parameter|Required|Description
|:---------|:--------|:----------
|session|True|Session is the response of user/login.
|webhookId|True|The Id of an installed Web Hook.

###Example Request
```sh
$ curl -X POST https://api.zipwhip.com/webhook/delete \
       -d session=[sessionKey] \
       -d webhookId=687557714
```

###Example Response
```JSON
{
	"success": true,
	"response": []
}
```
