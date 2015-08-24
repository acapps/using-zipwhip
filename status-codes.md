#Zipwhip Message Status Codes
The status codes listed in this document are used throughout Zipwhip's messaging infrastructure. The status codes is tied to the Message object, so whether you're using the API to pull message history or are getting real time events from our Web Hooks system. Because of this some of the status codes listed below are specific to the `message/progress` event fired in Web Hooks. These specialized states are transient events are unlikely seen with a `message/list`, for example.

##Status Codes
There are two categories of failures, at time of a `message/send` event or during the sending process. To put it another way synchronous vs asynchronous errors.

###Message Sending/Progress
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

###Message Failure States
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
