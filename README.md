# DocRef 

### Rails 

Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates).

The Devise Rails template by Le Wagon with Bootstrap, Simple form, debugging gems, webpack and postgres as database as well as a Devise install with a generated User model was used to bootstrap the project.

```
rails new \
  --database postgresql \
  --webpack \
  -m https://raw.githubusercontent.com/lewagon/rails-templates/master/devise.rb \my-app
```

### Database creation and initialization

```
rails db:create
rails db:migrate
rails db:seed # for sample data
```

### Running the project
You can install dependencies and run the project in development mode with:

```
cd my-app
npm install # or yarn
bundle install
rails server
```
Open up localhost:3000.

### Deployment

```
git push heroku master
heroku run rails db:migrate
heroku open

```
