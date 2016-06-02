# Keywords API

Guide for interfacing with Keywords.

## keywords/install

Install Keywords on an account.

### Syntax

```
POST /app/install HTTP/1.1
Host: https://api.zipwhip.com

?session=&appId=4601&settings
```

The `appId` is specific to Keywords, the value is: `4601`.

### Example Request
```SH
$curl -X POST https://api.zipwhip.com/app/install \
	-d session={session} \
  -d appId=4601 \
  --data-urlencode settings='{"enabled": true,"settings": [{"enabled": true,"startDate": "2014-12-11T17:17:38-0800","body": "https://zipwhip.com/dist/img/global/logo.svg","title": "coffee","times": [{"startTime": "00:00","active": true,"day": "1","endTime": "23:59"},{"startTime": "00:00","active": true,"day": "2","endTime": "23:59"},{"startTime": "00:00","active": true,"day": "3","endTime": "23:59"},{"startTime": "00:00","active": true,"day": "4","endTime": "23:59"},{"startTime": "00:00","active": true,"day": "5","endTime": "23:59"},{"startTime": "00:00","active": true,"day": "6","endTime": "23:59"},{"startTime": "00:00","active": true,"day": "7","endTime": "23:59"}],"keywordEnabled": true,"endDate": ""}]}'
```

### Example Response

**The key element in the response is the `installedAppId`, this ID allows the implementor to reference the Keyword app.**

```JSON
{
  "success":true,
  "response":{
    "appId":4601,
    "appKey":"keyword_auto_reply",
    "installedAppId":17835202,
    "settings":{
      "enabled":true,
      "settings":[
        {
          "body":"https://zipwhip.com/dist/img/global/logo.svg",
          "startDate":"2014-12-11T17:17:38-0800",
          "enabled":true,
          "title":"coffee",
          "times":[
            {
              "startTime":"00:00",
              "active":true,
              "day":"1",
              "endTime":"23:59"
            },
            {
              "startTime":"00:00",
              "active":true,
              "day":"2",
              "endTime":"23:59"
            },
            {
              "startTime":"00:00",
              "active":true,
              "day":"3",
              "endTime":"23:59"
            },
            {
              "startTime":"00:00",
              "active":true,
              "day":"4",
              "endTime":"23:59"
            },
            {
              "startTime":"00:00",
              "active":true,
              "day":"5",
              "endTime":"23:59"
            },
            {
              "startTime":"00:00",
              "active":true,
              "day":"6",
              "endTime":"23:59"
            },
            {
              "startTime":"00:00",
              "active":true,
              "day":"7",
              "endTime":"23:59"
            }
          ],
          "keywordEnabled":true,
          "endDate":""
        }
      ]
    }
  }
}
```

## keywords/alter

Update an existing keyword or add additional keywords.

At time of install, part of the response object is the `installedAppId`, this ID will be used for the `alter` request.

### Syntax

```
POST /app/alter HTTP/1.1
Host: https://api.zipwhip.com

?session=&installedAppId=&settings
```

### Example Request (Add New Keyword)

```SH
$curl -X POST https://api.zipwhip.com/app/alter \
	-d session={session} \
  -d installedAppId=17835202 \
  --data-urlencode settings='{"enabled":false,"settings":[{"body":"Echo","title":"Echo","startDate":"2016-06-02T11:14:19-0700","endDate":"","enabled":false,"keywordEnabled":true,"times":[{"startTime":"00:00","endTime":"23:59","day":"1","active":true},{"startTime":"00:00","endTime":"23:59","day":"2","active":true},{"startTime":"00:00","endTime":"23:59","day":"3","active":true},{"startTime":"00:00","endTime":"23:59","day":"4","active":true},{"startTime":"00:00","endTime":"23:59","day":"5","active":true},{"startTime":"00:00","endTime":"23:59","day":"6","active":true},{"startTime":"00:00","endTime":"23:59","day":"7","active":true}]},{"body":"Hi","title":"New","startDate":"2016-06-02T11:14:19-0700","endDate":"","enabled":false,"keywordEnabled":true,"times":[{"startTime":"00:00","endTime":"23:59","day":"1","active":true},{"startTime":"00:00","endTime":"23:59","day":"2","active":true},{"startTime":"00:00","endTime":"23:59","day":"3","active":true},{"startTime":"00:00","endTime":"23:59","day":"4","active":true},{"startTime":"00:00","endTime":"23:59","day":"5","active":true},{"startTime":"00:00","endTime":"23:59","day":"6","active":true},{"startTime":"00:00","endTime":"23:59","day":"7","active":true}]}]}'

```

### Example Response (Add New Keyword)

```JSON
{"success":true,"response":null}
```

### Example Request (Remove Keywords)

```SH
$curl -X POST https://api.zipwhip.com/app/alter \
	-d session={session} \
  -d installedAppId=17835202 \
  --data-urlencode settings='{"enabled":false,"settings":[]}'
```

### Example Response (Remove Keywords)

```JSON
{"success":true,"response":null}
```

## keywords/list

Retrieve current settings for Keywords.

### Syntax

GET /app/list HTTP/1.1
Host: https://api.zipwhip.com

?session=

### Example Request

```SH
$curl -G https://api.zipwhip.com/app/list \
	-d session={session} \
```

### Example Response

```JSON
{
  "success":true,
  "response":{
    "apps":[
      {
        "appId":4601,
        "appKey":"keyword_auto_reply",
        "installedAppId":17835202,
        "settings":{
          "enabled":true,
          "settings":[
            {
              "enabled":true,
              "startDate":"2014-12-11T17:17:38-0800",
              "body":"https://zipwhip.com/dist/img/global/logo.svg",
              "title":"coffee",
              "times":[
                {
                  "startTime":"00:00",
                  "active":true,
                  "day":"1",
                  "endTime":"23:59"
                },
                {
                  "startTime":"00:00",
                  "active":true,
                  "day":"2",
                  "endTime":"23:59"
                },
                {
                  "startTime":"00:00",
                  "active":true,
                  "day":"3",
                  "endTime":"23:59"
                },
                {
                  "startTime":"00:00",
                  "active":true,
                  "day":"4",
                  "endTime":"23:59"
                },
                {
                  "startTime":"00:00",
                  "active":true,
                  "day":"5",
                  "endTime":"23:59"
                },
                {
                  "startTime":"00:00",
                  "active":true,
                  "day":"6",
                  "endTime":"23:59"
                },
                {
                  "startTime":"00:00",
                  "active":true,
                  "day":"7",
                  "endTime":"23:59"
                }
              ],
              "keywordEnabled":true,
              "endDate":""
            }
          ]
        }
      }
    ]
  }
}
```
