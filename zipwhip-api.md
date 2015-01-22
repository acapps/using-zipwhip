
Working With Zipwhip's API
==========================
*Zipwhip's exposed API is the same API that we use to build all of our products*

Basics
------
Zipwhip's API relies on a sessionKey to perform all actions. This is a GUID representation of an authenticated user.
>Tip: SessionKeys do not expire, they can be obtained once and then used for all future actions.

A sessionKey is obtained from perfomring a `user/login` webcall for the account.

###It all begins with `user
``` Sh
$ curl -i https://api.zipwhip.com/user/login \
	-d username=[phone number] \
	-d password=[account password]
```
```json
{
  "success":true,
  "response":"3d0f1dde-aaff-4ce8-b61a-af212a860abc:123456789"
}
```
>In this case the `response` is the sessionKey for the account.

Next you'll want to send a message. To do so, we will use the the sessionKey retrieved from `user/login`.
```sh
$ curl -i https://api.zipwhip.com/message/send \
	-d session=3d0f1dde-aaff-4ce8-b61a-af212a860abc:123456789
	-d --data-rulencode contacts='+18559479447'
	-d --data-urlencode body='Hello World, from Zipwhip!'
```
```json
{
  "response": {
    "fingerprint": "4236521183",
    "root": "327559093363723008",
    "tokens": [
      {
        "contact": 1989548603,
        "device": 309626613,
        "fingerprint": "42336654183",
        "message": "327545678963723008"
      }
    ]
  },
  "success": true
}
```
>`message` is the ID of the unique this can be used in `message/get`, `message/read`, `message/delete`

General Application Flow
------------------------
Here is an example of Zipwhip's implementation for our devices.

1. [conversation/list](http://zipwhip.com/api/#/curl/conversation/list "Conversation List")
2. [conversation/get](http://zipwhip.com/api/#/curl/conversation/get "Conversation Get")
3. [contact/list](http://zipwhip.com/api/#/curl/contact/list "Contact List")

*This will pull down all of the relevant data to build a GUI with Contacts, Conversations, and Messages.*

###Conversation/List
Conversations are broken up by the unique combination of recipients. It is the most logical way to display messages in a format that mirrors the mobile devices that we all use today.

When performing a `conversation/list` you can page through the available conversations.
> Tip: On mobile devices or areas of less-than-ideal connectivity chose a page size that will at least fill the inital conversation list view on your applications. Then lazy load in the background.

```sh
$ curl https://api.zipwhip.com/conversation/list \
	-d session=3d0f1dde-aaff-4ce8-b61a-af212a860abc:123456789 \
	-d limit=10 \
	-d start=0
```
*This tells Zipwhip that you want the 10 most recent conversations.*
```json
{
  "total": 2,
  "response": [
    {
      "address": "ptn:/2068308909",
      "bcc": null,
      "cc": null,
      "dateCreated": "2013-04-18T11:44:57-07:00",
      "deleted": false,
      "deviceAddress": null,
      "deviceId": 309626613,
      "fingerprint": "1181232551",
      "id": 161304119203,
      "lastContactDeviceId": 309626613,
      "lastContactFirstName": "Scarlett",
      "lastContactId": 2127241703,
      "lastContactLastName": "",
      "lastContactMobileNumber": "2068308909",
      "lastMessageBody": "Fbhv",
      "lastMessageDate": "2013-04-18T11:45:06-07:00",
      "lastNonDeletedMessageDate": "2013-04-18T11:45:06-07:00",
      "lastUpdated": "2013-04-19T12:42:23-07:00",
      "unreadCount": 0,
      "version": 1
    },
    {
      "address": "ptn:/3604321502",
      "bcc": null,
      "cc": null,
      "dateCreated": "2013-02-21T16:49:51-08:00",
      "deleted": false,
      "deviceAddress": null,
      "deviceId": 309626613,
      "fingerprint": "11893565339",
      "id": 142834903003,
      "lastContactDeviceId": 309626613,
      "lastContactFirstName": "John",
      "lastContactId": 1989536703,
      "lastContactLastName": "Fan",
      "lastContactMobileNumber": "3604321502",
      "lastMessageBody": "hi",
      "lastMessageDate": "2013-04-24T12:58:39-07:00",
      "lastNonDeletedMessageDate": "2013-04-24T12:58:39-07:00",
      "lastUpdated": "2013-04-24T12:59:10-07:00",
      "new": false,
      "unreadCount": 0,
      "version": 1
    }
  ],
  "success": true,
  "size": 2
}
```
*In this example we just show the most recent 2 conversations.*

###Conversation/Get
Using the `conversation/get` will retrieve messages specific to the conversation. This will help to group relevant messages to the most recent conversations.

When performing a `conversation/get` you can page through the available messages.
> Tip: Again, we'll grab a handful of messages for the most recent conversations. This will populate the most relevant messages onto the client.

```sh
$ curl https://api.zipwhip.com/conversation/get \
	-d fingerprint=1181232551 \
	-d session=3d0f1dde-aaff-4ce8-b61a-af212a860abc:123456789 \
	-d limit=10 \
	-d start=0
```
*In this example we use the fingerprint from the first conversation*
> Tip: Similar to the `conversation/list` call you can limit the number of messages returned. This gives you as the implementor the chance to limit the number of messages return.

```json
{
  "response": {
    "conversation": {
      "address": "ptn:/3608964896",
      "bcc": null,
      "cc": null,
      "dateCreated": "2013-02-21T16:54:39-08:00",
      "deleted": false,
      "deviceAddress": null,
      "deviceId": 309626613,
      "fingerprint": "4233621183",
      "id": 142836952103,
      "lastContactDeviceId": 309626613,
      "lastContactFirstName": "Tim",
      "lastContactId": 1989548603,
      "lastContactLastName": "Jones",
      "lastContactMobileNumber": "3608964896",
      "lastMessageBody": "Nada much.",
      "lastMessageDate": "2013-04-24T17:47:12-07:00",
      "lastNonDeletedMessageDate": "2013-04-24T17:47:12-07:00",
      "lastUpdated": "2013-04-24T17:51:45-07:00",
      "unreadCount": 0,
      "version": 1
    },
    "messages": [
      {
        "address": "ptn:/3608964896",
        "advertisement": null,
        "bcc": null,
        "body": "Nada much.",
        "carrier": "ATT",
        "cc": null,
        "contactDeviceId": 309626613,
        "contactId": 1989548603,
        "dateCreated": "2013-04-24T17:47:12-07:00",
        "destAddress": "8559479447",
        "deviceId": 309626613,
        "errorState": false,
        "fingerprint": "4233621183",
        "firstName": "Tim",
        "fromName": null,
        "fwd": "",
        "hasAttachment": false,
        "id": "327222223187526144",
        "isInFinalState": false,
        "isParent": false,
        "isRead": true,
        "isSelf": false,
        "lastName": "Jones",
        "lastUpdated": null,
        "messageTransport": 8,
        "mobileNumber": "3608964896",
        "parentId": 0,
        "sourceAddress": "3608964896",
        "thread": "",
        "transmissionState": {
          "name": "DELIVERED"
        },
        "type": "MO",
        "version": 0,
        "visible": true
      },
      {
        "address": "ptn:/3608964896",
        "advertisement": "\n\nSent via Zipwhip",
        "bcc": null,
        "body": " yo wassup?",
        "carrier": "ATT",
        "cc": null,
        "contactDeviceId": 309626613,
        "contactId": 1989548603,
        "dateCreated": "2013-04-24T17:46:48-07:00",
        "destAddress": "3608964896",
        "deviceId": 309626613,
        "errorState": false,
        "fingerprint": "4233621183",
        "firstName": "Tim",
        "from": 1989548603,
        "fromName": "Zipwhip,",
        "fwd": "",
        "hasAttachment": false,
        "id": "327222123279641664",
        "isInFinalState": false,
        "isParent": false,
        "isRead": true,
        "isSelf": false,
        "lastName": "Jones",
        "lastUpdated": null,
        "latlong": "",
        "loc": "",
        "mobileNumber": "3608964896",
        "parentId": 0,
        "sourceAddress": "8559479447",
        "thread": "",
        "transmissionState": {
          "name": "DELIVERED"
        },
        "type": "ZO",
        "version": 0,
        "visible": true
      }
    ]
  },
  "success": true
}
```

###Contact/List
Zipwhip uses the `contact/list` primarily for when the user is composing a new message. We will then populate the To box based on the contacts retreived from `contact/list`.

```sh
$ curl https://api.zipwhip.com/contact/list \
	-d session=3d0f1dde-aaff-4ce8-b61a-af212a860abc:123456789 \
	-d pageSize=10 \
	-d page=0
```
> Tip: Zipwhip typcially lazy loads contacts, as they are only necessary during the compose action.

```json
{
  "total": 2,
  "response": [
    {
      "address": "ptn:/2062164915",
      "birthday": null,
      "business": null,
      "carrier": "Zipwhip",
      "channel": "",
      "city": "",
      "dateCreated": "2013-04-10T21:38:55-07:00",
      "deleted": false,
      "deviceId": 309626613,
      "email": "",
      "firstName": "Charlie The Dog",
      "fwd": "",
      "id": 2109659003,
      "lastName": "",
      "lastUpdated": "2013-04-10T21:42:48-07:00",
      "latlong": "",
      "loc": "",
      "mobileNumber": "2062164915",
      "notes": "",
      "phoneId": 0,
      "phoneKey": "",
      "state": "",
      "targetGroupDevice": -1,
      "thread": "",
      "version": 6,
      "zipcode": ""
    },
    {
      "address": "ptn:/2064551715",
      "birthday": null,
      "business": null,
      "carrier": "Vzw",
      "channel": "",
      "city": "",
      "dateCreated": "2013-02-22T10:34:06-08:00",
      "deleted": false,
      "deviceId": 309626613,
      "email": "",
      "firstName": "Veronica",
      "fwd": "",
      "id": 1991164703,
      "lastName": "",
      "lastUpdated": "2013-04-10T21:17:11-07:00",
      "latlong": "",
      "loc": "",
      "mobileNumber": "2064551715",
      "notes": "",
      "phoneId": 0,
      "phoneKey": "2064551715",
      "state": "",
      "targetGroupDevice": -1,
      "thread": "",
      "version": 6,
      "zipcode": ""
    }
  ],
  "page": 1,
  "pages": 1,
  "success": true
}
```