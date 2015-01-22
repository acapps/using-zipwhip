#Working With Zipwhip's API
#####Zipwhip's exposed API is the same API that we use to build all of our products
---

###Basics
Zipwhip's API relies on a sessionKey to perform all actions. This is a GUID representation of an authenticated user.
>SessionKeys do not expire, they can be obtained once and then used for all future actions.

A sessionKey is obtained from perfomring a `user/login` webcall for the account.

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

###General Application Flow
Here is an example of Zipwhip's implementation for our devices.

1. [conversation/list](http://zipwhip.com/api/#/curl/conversation/list "Conversation List")
2. [conversation/get](http://zipwhip.com/api/#/curl/conversation/get "Conversation Get")
3. [contact/list](http://zipwhip.com/api/#/curl/contact/list "Contact List")

This will build all of the relevant data to build a GUI with Contacts, Conversations, and Messages.
