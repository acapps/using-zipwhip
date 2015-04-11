#Zipwhip Web Hooks
Web Hooks allow Server-to-Server communication of new events, without the hassle
of a persistent connection. The idea behind Web Hooks is to give implementors the ability to receive real-time events as items change within Zipwhip.
As the implementor, you can chose which events you would like to listen for.

###Events
* Delete
* Progress
* Read
* Receive
* Send

> It is recommended that the destination address is HTTPS.
 
> Zipwhip supports TLS V1.0 and greater.

> Zipwhip does not support SSL V3.0 and older. 

##Adding Web Hooks
Install a Web Hook onto the text-enabled phone number. When an event occurrs the details of the message will be delivered to the URL specified.

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
    success: true,
    response: [{
        webhookId: 687557714,
        type: "message",
        event: "receive",
        url: "http://test.zipwhip.com/message/receive",
        method: "POST"
    }]
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
$ curl -X POST https://api.zipwhip.com/webhook/add \
       -d session=[sessionKey] \
       -d method=PUT
```

###Example Response
```JSON
{
    success: true,
    response: [{
        webhookId: 687557714,
        type: "message",
        event: "receive",
        url: "http://test.zipwhip.com/message/receive",
        method: "PUT"
    }]
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
$ curl -G https://api.zipwhip.com/webhook/add \
       -d session=[sessionKey]
```

###Example Response
```JSON
 {
     success: true,
     response: [{
         webhookId: 687557714,
         type: "message",
         event: "receive",
         url: "http://test.zipwhip.com/message/receive",
         method: "PUT"
     }]
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
$ curl -X POST https://api.zipwhip.com/webhook/add \
       -d session=[sessionKey] \
       -d webhookId=687557714
```

###Example Response
```JSON
{
    success: true,
    response: []
}
``` 
