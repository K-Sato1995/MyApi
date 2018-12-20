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

Now you can use [Postman](https://www.getpostman.com/) to test if the api is working properly.
Make a get request to `http://localhost:3000/api/v1/topics` and you will get the json formatted data like the code below.

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

