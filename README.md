# Initialization
Simply run the following commands in your terminal.

```
$ bundle install
$ rake db:migrate
```

After running the commands above, run `rails s` to make the api up and running.

# Testing 
First of all, create some data in your rails console.

```console
$ rails c
$ Topic.create(titel: "title1")
$ Topic.create(titel: "title2")
$ Topic.create(titel: "title3")
```

# Get topics
Now you can use [Postman](https://www.getpostman.com/) to test if the api is working properly.
Make a `get` request to `http://localhost:3000/api/v1/topics` and you will get the json formatted data like the code below.

```json
{
    "status": "SUCCESS",
    "message": "loaded posts",
    "data": [
        {
            "id": 3,
            "title": "title3",
            "created_at": "2018-12-20T00:47:13.266Z",
            "updated_at": "2018-12-20T00:47:13.266Z"
        },
        {
            "id": 2,
            "title": "title2",
            "created_at": "2018-12-20T00:47:09.688Z",
            "updated_at": "2018-12-20T00:47:09.688Z"
        },
        {
            "id": 1,
            "title": "title1",
            "created_at": "2018-12-20T00:47:02.036Z",
            "updated_at": "2018-12-20T00:47:02.036Z"
        }
    ]
}
```

# Get a topic
Make a `get` request to `http://localhost:3000/api/v1/topics/topic_id`(ex:`http://localhost:3000/api/v1/topics/2`).
The API would return something like the data below.

```json
{
    "status": "SUCCESS",
    "message": "Loaded the topic",
    "data": {
        "id": 2,
        "title": "title2",
        "created_at": "2018-12-20T01:58:00.104Z",
        "updated_at": "2018-12-20T01:58:00.104Z"
    }
}
```

# Create a topic
Make a `post` request to `http://localhost:3000/api/v1/topics` with the data like the following code.

```json
{
    "title": "New_title"
}
```
The API would return something like this.

```json
{
    "status": "SUCCESS",
    "data": {
        "id": 4,
        "title": "New_title",
        "created_at": "2018-12-20T02:15:30.945Z",
        "updated_at": "2018-12-20T02:15:30.945Z"
    }
}
```

# Update a topic
Make a `put` or `patch` request to `http://localhost:3000/api/v1/topics/topic_id`(ex:`http://localhost:3000/api/v1/topics/4`) with the data like the code below.

```json
{
 "title": "Updated_title"
}
```

The API would return something like this.

```
{
    "status": "SUCCESS",
    "message": "Updated the topic",
    "data": {
        "id": 4,
        "title": "Updated_title",
        "created_at": "2018-12-20T01:58:12.051Z",
        "updated_at": "2018-12-20T02:17:47.830Z"
    }
}
```

# Delete a topic
Make a `put` or `patch` request to `http://localhost:3000/api/v1/topics/topic_id`(ex:`http://localhost:3000/api/v1/topics/4`).

The API would return something like this if the data was successfully deleted.

```json
{
    "status": "SUCCESS",
    "message": "Deleted the topic",
    "data": {
        "id": 4,
        "title": "Updated_title",
        "created_at": "2018-12-20T01:58:12.051Z",
        "updated_at": "2018-12-20T02:17:47.830Z"
    }
}
```
