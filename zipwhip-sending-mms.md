#Sending Picture Messages (MMS)
Zipwhip now offers MMS on landline and toll free numbers. It is required at this time
to have the feature enabled on the individual line.

> Note: Sending is currently limited to one recipient. 

> Note: Sending is currently limited to MIME types:
* image/bmp
* image/gif
* image/jpeg
* image/png
* text/plain

> Note: The parameter body is limited to 700 bytes greater than this should be sent as
an attachment. 

> Note: Payload size is currently limited to 600KB. No transcoding functionality is
offered at this time. 

> Note: A session is obtained from a user/login response. A session does not expire and
therefore can be stored and used for all future requests. 

###Parameters
|Parameter|Required|Description|
|---------|--------|-----------|
|session|True|Session is the response of user/login.
|to|True|The recipient’s phone number in E.164 format.
|body|False|Text body of the message. Max 700 Bytes.

###Example Request (1 image & body)
```sh
$ curl –X POST \
       –F “image=@Filename.png” \
       https://api.zipwhip.com/messaging/send“?”session=[sessionKey]“&”to=+12065551212“&”body=Hello
```

###Example Request (2 images & body)
```sh
$ curl –X POST \
       –F “image1=@Filename01.png” \
       –F “image2=@Filename02.png” \
       https://api.zipwhip.com/messaging/send“?”session=[sessionKey]“&”to=+12065551212“&”body=Hello
```

###Example Request (Large text attachment)
```sh
$ curl –X POST \
       –F “file=@textFile.txt” \
       https://api.zipwhip.com/messaging/send“?”session=[sessionKey]“&”to=+12065551212
```
