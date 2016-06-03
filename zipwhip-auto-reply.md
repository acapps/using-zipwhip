# Auto Reply API

Guide for interfacing with the Auto Reply Feature.

## autoreply/install

Install Auto Reply on an account.

### Syntax

```
POST /app/install HTTP/1.1
Host: https://api.zipwhip.com

?session=&appId=901&settings
```

The `appId` is specific to Auto Reply, the value is: `901`.

### Example Request
```SH
$curl -X POST https://api.zipwhip.com/app/install \
	-d session={session} \
  -d appId=901 \
  --data-urlencode settings='{"enabled":true,"settings":[{"body":"We are currently closed. A representative is available Monday - Friday, 8:00am to 5:00pm PT.","title":"MorningAutoReply","startDate":"2016-06-02T21:57:31-0700","endDate":"","enabled":true,"keywordEnabled":false,"times":[{"startTime":"00:00","endTime":"23:59","day":"1","active":true},{"startTime":"00:00","endTime":"07:59","day":"2","active":true},{"startTime":"00:00","endTime":"07:59","day":"3","active":true},{"startTime":"00:00","endTime":"07:59","day":"4","active":true},{"startTime":"00:00","endTime":"07:59","day":"5","active":true},{"startTime":"00:00","endTime":"07:59","day":"6","active":true},{"startTime":"00:00","endTime":"23:59","day":"7","active":true}]}]}'
```

### Example Response

**The key element in the response is the `installedAppId`, this ID allows the implementor to reference the Auto Reply app.**

```JSON
{
  "success":true,
  "response":{
    "appId":901,
    "appKey":"d2c_landline_advanced_autoreply",
    "installedAppId":36104,
    "settings":{
      "enabled":true,
      "settings":[
        {
          "enabled":true,
          "settings":[
            {
              "body":"We are currently closed. A representative is available Monday - Friday, 8:00am to 5:00pm PT.",
              "title":"MorningAutoReply",
              "startDate":"2016-06-02T21:57:31-0700",
              "endDate":"",
              "enabled":true,
              "keywordEnabled":false,
              "times":[
                {
                  "startTime":"00:00",
                  "endTime":"23:59",
                  "day":"1",
                  "active":true
                },
                {
                  "startTime":"00:00",
                  "endTime":"07:59",
                  "day":"2",
                  "active":true
                },
                {
                  "startTime":"00:00",
                  "endTime":"07:59",
                  "day":"3",
                  "active":true
                },
                {
                  "startTime":"00:00",
                  "endTime":"07:59",
                  "day":"4",
                  "active":true
                },
                {
                  "startTime":"00:00",
                  "endTime":"07:59",
                  "day":"5",
                  "active":true
                },
                {
                  "startTime":"00:00",
                  "endTime":"07:59",
                  "day":"6",
                  "active":true
                },
                {
                  "startTime":"00:00",
                  "endTime":"23:59",
                  "day":"7",
                  "active":true
                }
              ]
            }
          ]
        }
      ]
    }
  }
}
```

## autoreply/alter

Update an existing keyword or add additional Auto Reply.

At time of install, part of the response object is the `installedAppId`, this ID will be used for the `alter` request.

### Syntax

```
POST /app/alter HTTP/1.1
Host: https://api.zipwhip.com

?session=&installedAppId=&settings
```

### Example Request (Add New Auto Reply)

```SH
$curl -X POST https://api.zipwhip.com/app/alter \
	-d session={session} \
  -d installedAppId=36104 \
  --data-urlencode settings='{"enabled":true,"settings":[{"body":"We are currently closed. A representative is available Monday - Friday, 8:00am to 5:00pm PT.","title":"EveningAutoReply","startDate":"2016-06-02T21:59:50-0700","endDate":"","enabled":true,"keywordEnabled":false,"times":[{"startTime":"00:00","endTime":"23:59","day":"1","active":false},{"startTime":"17:00","endTime":"23:59","day":"2","active":true},{"startTime":"17:00","endTime":"23:59","day":"3","active":true},{"startTime":"17:00","endTime":"23:59","day":"4","active":true},{"startTime":"17:00","endTime":"23:59","day":"5","active":true},{"startTime":"17:00","endTime":"23:59","day":"6","active":true},{"startTime":"00:00","endTime":"23:59","day":"7","active":false}]},{"body":"We are currently closed. A representative is available Monday - Friday, 8:00am to 5:00pm PT.","title":"MorningAutoReply","startDate":"2016-06-02T21:59:50-0700","endDate":"","enabled":true,"keywordEnabled":false,"times":[{"startTime":"00:00","endTime":"23:59","day":"1","active":true},{"startTime":"00:00","endTime":"07:59","day":"2","active":true},{"startTime":"00:00","endTime":"07:59","day":"3","active":true},{"startTime":"00:00","endTime":"07:59","day":"4","active":true},{"startTime":"00:00","endTime":"07:59","day":"5","active":true},{"startTime":"00:00","endTime":"07:59","day":"6","active":true},{"startTime":"00:00","endTime":"23:59","day":"7","active":true}]}]}'

```

### Example Response (Add New Auto Reply)

```JSON
{"success":true,"response":null}
```

### Example Request (Remove Auto Reply)

```SH
$curl -X POST https://api.zipwhip.com/app/alter \
	-d session={session} \
  -d installedAppId=36104 \
  --data-urlencode settings='{"enabled":false,"settings":[]}'
```

### Example Response (Remove Auto Reply)

```JSON
{"success":true,"response":null}
```


## autoreply/list

Retrieve current settings for Auto Reply.

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
        "appId":901,
        "appKey":"d2c_landline_advanced_autoreply",
        "installedAppId":36104,
        "settings":{
          "enabled":true,
          "settings":[
            {
              "body":"We are currently closed. A representative is available Monday - Friday, 8:00am to 5:00pm PT.",
              "enabled":true,
              "endDate":"",
              "keywordEnabled":false,
              "startDate":"2016-06-02T21:59:50-0700",
              "times":[
                {
                  "active":false,
                  "day":"1",
                  "endTime":"23:59",
                  "startTime":"00:00"
                },
                {
                  "active":true,
                  "day":"2",
                  "endTime":"23:59",
                  "startTime":"17:00"
                },
                {
                  "active":true,
                  "day":"3",
                  "endTime":"23:59",
                  "startTime":"17:00"
                },
                {
                  "active":true,
                  "day":"4",
                  "endTime":"23:59",
                  "startTime":"17:00"
                },
                {
                  "active":true,
                  "day":"5",
                  "endTime":"23:59",
                  "startTime":"17:00"
                },
                {
                  "active":true,
                  "day":"6",
                  "endTime":"23:59",
                  "startTime":"17:00"
                },
                {
                  "active":false,
                  "day":"7",
                  "endTime":"23:59",
                  "startTime":"00:00"
                }
              ],
              "title":"EveningAutoReply"
            },
            {
              "body":"We are currently closed. A representative is available Monday - Friday, 8:00am to 5:00pm PT.",
              "enabled":true,
              "endDate":"",
              "keywordEnabled":false,
              "startDate":"2016-06-02T21:59:50-0700",
              "times":[
                {
                  "active":true,
                  "day":"1",
                  "endTime":"23:59",
                  "startTime":"00:00"
                },
                {
                  "active":true,
                  "day":"2",
                  "endTime":"07:59",
                  "startTime":"00:00"
                },
                {
                  "active":true,
                  "day":"3",
                  "endTime":"07:59",
                  "startTime":"00:00"
                },
                {
                  "active":true,
                  "day":"4",
                  "endTime":"07:59",
                  "startTime":"00:00"
                },
                {
                  "active":true,
                  "day":"5",
                  "endTime":"07:59",
                  "startTime":"00:00"
                },
                {
                  "active":true,
                  "day":"6",
                  "endTime":"07:59",
                  "startTime":"00:00"
                },
                {
                  "active":true,
                  "day":"7",
                  "endTime":"23:59",
                  "startTime":"00:00"
                }
              ],
              "title":"MorningAutoReply"
            }
          ]
        }
      }
    ]
  }
}
```
