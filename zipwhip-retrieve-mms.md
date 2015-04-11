#Retrieving Picture Messages (MMS)
This document will outline the steps necessary to retrieving MMS content from
Zipwhip.
##Message Attachment
When looking at the details of the message, there is a field named, hasAttachment, this
is a boolean value. If this value is true, then you’ll perform a messageAttachment/list
web call.
###Parameters
|Parameter|Required|Description
|:---------|:--------|:----------
|session|True|Session is the response of user/login.
|messageId|True|The id of the message object.

###Example Request
```sh
$ curl -G https://api.zipwhip.com/messageAttachment/list \
       -d session=[sessionKey] \
       -d messageId=[id of message]
```

###Example Response
```JSON
{
    "total":2,
    "response":[
        {
            "fileName":"IMG_1827.jpg",
            "dateCreated":"2015-03-26T13:15:17-07:00",
            "fileSizeBytes":40101,
            "mimeType":"image/jpeg",
            "storageKey":"be9396da-a6aa-442c-9406-asdfasdfasdf"
        },
        {
            "fileName":"123_1.smil",
            "dateCreated":"2015-03-26T13:15:17-07:00",
            "fileSizeBytes":300,
            "mimeType":"application/smil",
            "storageKey":"269023ec-67a0-4481-a820-asdfasdfasdf"
        }
    ],
}
```
> The key data points are the storageKey values. These will be used in the next web calls.

##Retrieve Hosted Content
HostedContent is Zipwhip’s brand name for our MMS storage server. All items are
stored with a key and permissions.
###Parameters
|Parameter|Required|Description|
|:---------|:--------|:-----------|
|session|True|Session is the response of user/login.
|storageKey|True|The id of the media file.

###Example Request
```sh
$ curl -G https://api.zipwhip.com/hostedContent/get \
       -d session=[sessionKey] \
       -d storageKey=[storageKey]
```

###Example Response
The response will contain the media object as part of the payload.
