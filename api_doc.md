# API Documentation

## Authentication/Registration

### Registration

`POST` `api/v1/users`

**Request body:**
```json
{
  "user": {
    "email": "ek@ya.ru",
    "password": "12345678",
    "nickname": "EugeneKozlov"
  }
}
```
**Response status codes:**
  - `201` - Success. User created. Response body is empty
  - `422` - Non valid attributes. Explanation in  response body 

### Authentication

`POST` `api/v1/user_token`
**Request body:**

```json
{
  "auth": {
    "email": "ek@ya.ru",
    "password": "12345678"
  }
}
```
**Successful Response:**
HTTP Status - `201`
Body:
```json
{
    "jwt": "token here"
}
```
  
## Messages/Votes

### Create message
`POST` `api/v1/messages`

**Headers**:
  - `Authorization` - `JWT 'token here'`

**Request body:**

```json
{
  "message": {
    "text": "ewewwefwewefwfwewewefwewefwewfwwf"
  }
}
```

Response codes:
  - `201` - Message created
  - `422` - Parameters are bad
  - `401` - Authentication failed

### Get messages

`GET` `api/v1/messages`

Parameters:
  - `page` -  pagination

  **Response:**
  Headers:
  - `X-Total-Pages-Count` - count of pages

Body:
  ```json
  [
    {
        "id": 11,
        "text": "Eveniet est deleniti doloribus voluptatibus doloremque et quas dolorem repudiandae.",
        "created_at": "2017-10-15T09:29:04.712Z",
        "updated_at": "2017-10-15T09:29:04.712Z",
        "user": {
            "id": 4,
            "nickname": "Alesia Kemmer",
            "email": "shantel_walker@davis.ca"
        }
    },
    {
        "id": 10,
        "text": "Nobis dicta enim in voluptate numquam quia sint deserunt.",
        "created_at": "2017-10-15T09:29:04.701Z",
        "updated_at": "2017-10-15T09:29:04.701Z",
        "user": {
            "id": 4,
            "nickname": "Alesia Kemmer",
            "email": "shantel_walker@davis.ca"
        }
    }
]
  ```
  
 ### Vote for message
`POST` `api/v1/messages/:id/votes`

**Headers**:
  - `Authorization` - `JWT 'token here'`

**Request body:** empty

Response codes:
  - `201` - Vote accepted
  - `422` - Vote already accepted
  - `401` - Authentication failed
  - `404` - Message not found