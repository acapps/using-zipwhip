#Zipwhip Message Status Codes
The status codes listed in this document are used throughout Zipwhip's messaging infrastructure. Zipwhip strives to normalize all carrier errors to a unified list for our developers to consume.

##Status Codes
The list of status codes fall into to buckets, those at time of `message/send` and those that are part of the sending process. To put it another way synchronous vs asynchronous errors. Web Hooks, specifically `message/progress` gives the implementor the ability to track the message through the full sending process.

###Message Send Failures
At time of `message/send` these are the status codes expected in in the response payload, if an error has occurred.

|Code|Description|State|Retryable
|:---------|:--------|:----------|:--------
|-1234|Recipient Sent in "STOP"|Failure|No
|-855|Internal Error|Failure|Yes
|-801|Spam Protection|Failure|No
|-704|Internal Error|Failure|No
|-700|Internal Error|Failure|No
|-394|Invalid Parameter Length|Failure|No
|-124|Unable to determine carrier|Failure|No
|-1|Unknown Error|Unknown|Yes

###Message Sending/Progress
This particular set of status codes contains some of the specialized codes for `message/progress` events as they are fired through the Web Hook system. These specific status codes are labeled as `transient`. _They are unlikely seen in any `message/list` API calls, due to their fleeting nature._

|Code|Description|State|Final
|:---------|:--------|:----------|:--------
|0|Delivered - No confirmation|Success|Yes
|1|In Process|Transient|No
|2|Queued|Transient|No
|3|Queued|Transient|No
|4|Delivered - Confirmed|Success|Yes
|5|Error - Confirmed|Failure|Yes
|6|Delivered - Confirmed by DR|Success|Yes
|7|Error - Confirmed by DR|Failure|Yes
