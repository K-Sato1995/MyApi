# Initialization
Simply run the following commands in your terminal.

```
$ bundle install
$ rake db:migrate
```

After running the commands above, run `rails s` to make the api up and running.

# Testing
First of all, create some data by running the code below.

```console
$ rake db:seed
```

# Get posts
Now you can use [Postman](https://www.getpostman.com/) to test if the api is working properly.
Make a `get` request to `http://localhost:3000/api/v1/posts` and you will get the json formatted data like the code below.

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

# Get a post
Make a `get` request to `http://localhost:3000/api/v1/posts/post_id`(ex:`http://localhost:3000/api/v1/posts/2`).
The API would return something like the data below.

```json
{
    "status": "SUCCESS",
    "message": "Loaded the post",
    "data": {
        "id": 2,
        "title": "title2",
        "created_at": "2018-12-20T01:58:00.104Z",
        "updated_at": "2018-12-20T01:58:00.104Z"
    }
}
```

# Create a post
Make a `post` request to `http://localhost:3000/api/v1/posts` with the data like the following code.

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

# Update a post
Make a `put` or `patch` request to `http://localhost:3000/api/v1/posts/post_id`(ex:`http://localhost:3000/api/v1/posts/4`) with the data like the code below.

```json
{
 "title": "Updated_title"
}
```

The API would return something like this.

```
{
    "status": "SUCCESS",
    "message": "Updated the post",
    "data": {
        "id": 4,
        "title": "Updated_title",
        "created_at": "2018-12-20T01:58:12.051Z",
        "updated_at": "2018-12-20T02:17:47.830Z"
    }
}
```

# Delete a post
Make a `put` or `patch` request to `http://localhost:3000/api/v1/posts/post_id`(ex:`http://localhost:3000/api/v1/posts/4`).

The API would return something like this if the data was successfully deleted.

```json
{
    "status": "SUCCESS",
    "message": "Deleted the post",
    "data": {
        "id": 4,
        "title": "Updated_title",
        "created_at": "2018-12-20T01:58:12.051Z",
        "updated_at": "2018-12-20T02:17:47.830Z"
    }
}
```
