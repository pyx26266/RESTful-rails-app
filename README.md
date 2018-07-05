# Rails RESTful App
[Try here!](https://restapi-app.herokuapp.com/)

### Discription
> A simle example app to demonstrate REST API and MVC in the same app.
For MVC it lets you create your account and manages logins through session.
It also shows how to use token authentication in API calls.

## Getting started
```bash
git clone https://github.com/pyx26266/RESTful-rails-app.git
cd RESTful-rails-app
```
## Running the app
```ruby
bundle install --without production test
rails db:migrate
rails db:seed
rails server
```
now visit http://localhost:3000
