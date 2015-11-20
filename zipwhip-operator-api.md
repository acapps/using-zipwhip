
#Multi-User/Operator API

Information to perform basic interactions with the Operator API.

##Operator/List

Returns the Operators associated with the account.

###Exaple Request
```SH
$curl -G https://api.zipwhip.com/operator/list \
	-d session={session}
```

###Example Response
```JSON
{
  "response":[
    {
      "displayName":"Alan",
      "phoneNumber":"8445551212",
      "lastPunchedIn":null,
      "username":"alan",
      "operatorId":1234,
      "lastName":"",
      "version":5,
      "initials":"A",
      "hasImage":false,
      "email":"alan@zipwhip.com",
      "lastMessageSent":null,
      "role":{
        "description":"Admin operator",
        "permissions":[
          {
            "description":"Ability to log in",
            "activityKey":"Login",
            "displayName":"Login"
          },
          ...
          {
            "displayName":"Update Operator Role",
            "description":"Ability to update another operator's role",
            "activityKey":"UpdateOperatorRole"
          }
        ],
        "privilegeLevel":15,
        "roleId":2,
        "name":"Admin",
        "mutable":false
      },
      "color":null,
      "active":true,
      "firstName":"Alan",
      "owner":true
    },
    {
      "operatorId":12345,
      "lastPunchedIn":null,
      "username":"will",
      "phoneNumber":"",
      "displayName":"Will",
      "initials":"W",
      "version":12,
      "lastName":"",
      "role":{
        "mutable":false,
        "name":"Operator",
        "roleId":1,
        "description":"General operator",
        "permissions":[
          {
            "activityKey":"Login",
            "description":"Ability to log in",
            "displayName":"Login"
          },
          ...
          {
            "displayName":"View Contact Number",
            "description":"View Contact Full Phone Number",
            "activityKey":"ViewContactNumber"
          }
        ],
        "privilegeLevel":5
      },
      "lastMessageSent":null,
      "email":"will@zipwhip.com",
      "hasImage":true,
      "firstName":"Will",
      "owner":false,
      "active":true,
      "color":null
    }
  ]
}
```

##Role/List

Lists out the Roles associated with the line. This request is used specifically for process of creating an Operator on the line. The Role outlines within the WebApp the features available to the Operator.

###Example Request
```SH
$curl -G https://api.zipwhip.com/role/list \
	-d session={session}
```

###Example Response
```JSON
{
  "response":[
    {
      "privilegeLevel":5,
      "permissions":[
        {
          "description":"Ability to log in",
          "activityKey":"Login",
          "displayName":"Login"
        },
        ...
        {
          "displayName":"View Contact Number",
          "activityKey":"ViewContactNumber",
          "description":"View Contact Full Phone Number"
        }
      ],
      "description":"General operator",
      "name":"Operator",
      "mutable":false,
      "roleId":1
    },
    {
      "mutable":false,
      "roleId":2,
      "privilegeLevel":15,
      "description":"Admin operator",
      "permissions":[
        {
          "description":"Ability to log in",
          "displayName":"Login",
          "activityKey":"Login"
        },
        ...
        {
          "displayName":"Update Operator Role",
          "activityKey":"UpdateOperatorRole",
          "description":"Ability to update another operator's role"
        }
      ],
      "name":"Admin"
    },
    {
      "mutable":false,
      "roleId":501,
      "privilegeLevel":20,
      "description":"Admin of lines",
      "permissions":[
        {
          "description":"Add line to an account",
          "displayName":"Add line",
          "activityKey":"AddLine"
        },
        ...
        {
          "activityKey":"DeleteLine",
          "displayName":"Delete line",
          "description":"Delete line from account"
        }
      ],
      "name":"Account Admin"
    }
  ],
  "success":true
}
```

##Operator/Save

Operator Save is used for both creating a new operator or changing active state.
The `active` status can be toggled by sending in `true` or `false`.

###Example Request (Create New Operator)
```SH
$curl -X POST https://api.zipwhip.com/operator/save \
	-d session={session} \
    --data-urlencode username={Name used to log in unique per number} \
    --data-urlencode firstName={first name} \
    --data-urlencode lastName={last name} \
    --data-urlencode email={email address unique per number} \
    --data-urlencode active={true|false}
    --data-urlencode roleId={Id of role, role/list}
```

###Example Response (Create New Operator)
```JSON
{
  "success":true,
  "response":{
    "firstName":"Test",
    "lastName":"Name",
    "displayName":"Test Name",
    "initials":"T N",
    "color":null,
    "operatorId":585005,
    "version":1,
    "username":"testname",
    "email":"testname@zipwhip.com",
    "phoneNumber":null,
    "hasImage":false,
    "role":{
      "roleId":1,
      "name":"Operator",
      "description":"General operator",
      "mutable":false,
      "privilegeLevel":5,
      "permissions":[
        {
          "activityKey":"Login",
          "displayName":"Login",
          "description":"Ability to log in"
        },
        ...
        {
          "activityKey":"ViewContactNumber",
          "displayName":"View Contact Number",
          "description":"View Contact Full Phone Number"
        }
      ]
    },
    "lastMessageSent":null,
    "lastPunchedIn":null,
    "owner":false,
    "active":true
  }
}
```

###Example Request (Set to Inactive)
```SH
$curl -X POST https://api.zipwhip.com/operator/save \
	-d session={session} \
    --data-urlencode email=testname@zipwhip.com \
    --data-rulencode username=testname \
    -d operatorId=585005 \
    -d active=false
```

###Example Response (Set to Inactive)
```JSON
{
  "success":true,
  "response":{
    "firstName":"Test",
    "lastName":"Name",
    "displayName":"Test Name",
    "initials":"T N",
    "color":null,
    "operatorId":585005,
    "version":1,
    "username":"testname",
    "email":"testname@zipwhip.com",
    "phoneNumber":null,
    "hasImage":false,
    "role":{
      "roleId":1,
      "name":"Operator",
      "description":"General operator",
      "mutable":false,
      "privilegeLevel":5,
      "permissions":[
        {
          "activityKey":"Login",
          "displayName":"Login",
          "description":"Ability to log in"
        },
        ...
        {
          "activityKey":"ViewContactNumber",
          "displayName":"View Contact Number",
          "description":"View Contact Full Phone Number"
        }
      ]
    },
    "lastMessageSent":null,
    "lastPunchedIn":null,
    "owner":false,
    "active":false
  }
}
```

###Example Request (Set to Active)
```SH
$curl -X POST https://api.zipwhip.com/operator/save \
	-d session={session} \
    --data-urlencode email=testname@zipwhip.com \
    --data-rulencode username=testname \
    -d operatorId=585005 \
    -d active=true
```

###Example Response (Set to Active)
```JSON
{
  "success":true,
  "response":{
    "firstName":"Test",
    "lastName":"Name",
    "displayName":"Test Name",
    "initials":"T N",
    "color":null,
    "operatorId":585005,
    "version":1,
    "username":"testname",
    "email":"testname@zipwhip.com",
    "phoneNumber":null,
    "hasImage":false,
    "role":{
      "roleId":1,
      "name":"Operator",
      "description":"General operator",
      "mutable":false,
      "privilegeLevel":5,
      "permissions":[
        {
          "activityKey":"Login",
          "displayName":"Login",
          "description":"Ability to log in"
        },
        ...
        {
          "activityKey":"ViewContactNumber",
          "displayName":"View Contact Number",
          "description":"View Contact Full Phone Number"
        }
      ]
    },
    "lastMessageSent":null,
    "lastPunchedIn":null,
    "owner":false,
    "active":true
  }
}
```

##Operator/Unassign

Remove the user from the account.

###Example Request
```SH
$curl -G https://api.zipwhip.com/operator/unassign \
	-d session={session} \
	-d operatorId={ID of Operator}
```

###Example Response
```JSON
{
  "success":true,
  "response":null
}
```
