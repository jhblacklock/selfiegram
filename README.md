# README

## Getting Started

```
rake db:schema:load
rake db:seed
rails s
```

## CURL 

doc/curl_me.txt

```
# users

curl --user truecar:truecar http://localhost:3000
curl --user truecar:truecar http://localhost:3000/users
curl --user truecar:truecar "http://localhost:3000/users?page=2&per_page=2"
curl --user truecar:truecar -H "Content-Type: application/json" -X POST -d '{"name":"Billy","email":"xyz@faker.com"}' http://localhost:3000/users
curl --user truecar:truecar http://localhost:3000/users/1

# images

curl --user truecar:truecar http://localhost:3000/popular
curl --user truecar:truecar http://localhost:3000/users/1/images
curl --user truecar:truecar -H "Content-Type: application/json" -X POST -d '{"url":"http://faker.com/img.png","caption":"test"}' http://localhost:3000/users/1/images

# likes

curl --user truecar:truecar http://localhost:3000/users/1/images/1/likes
curl --user truecar:truecar -H "Content-Type: application/json" -X POST -d '{"like": {"by": 3}}' http://localhost:3000/users/1/images/1/likes

# Follows

curl --user truecar:truecar http://localhost:3000/users/1/follows
curl --user truecar:truecar -H "Content-Type: application/json" -X POST -d '{"follow": {"by": 3}}' http://localhost:3000/users/1/follows
curl --user truecar:truecar http://localhost:3000/users/1/follows/feed

```

## Run some tests

```
rake test
```
