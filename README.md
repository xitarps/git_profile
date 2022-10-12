# GIT Profile


## Info
This project(GIT Profile) aims on create a Github profile search tool

- Should be possible to register github profiles

- Through a webscrapper, the member information must be retrieved and stored from the Github page

- Should be possible to view a User Interface

- Should be possible to search for users

### Heroku (Live app)

https://git-profile-application.herokuapp.com/

<details>
  <summary>
     Technologies
  </summary>

  - Ruby 3.0.3
  - Rails
  - Postgres
  - Rubocop
  - RSpec
  - SimpleCov
  - I18n

</details>

<details>
  <summary>
     Initial Setup
  </summary>

Clone project(ssh or https)
```
git clone git@github.com:xitarps/git_profile.git
```
or
```
git clone https://github.com/xitarps/git_profile.git
```

Enter folder
```
cd git_profile
```
Run Setup
```
bin/setup
```
</details>

<details>
  <summary>
     How to Run
  </summary>

Server up
```
rails s
```
Access localhost

[127.0 0.1:3000](http://127.0.0.1:3000/)

</details>

<details>
  <summary>
     Tests and Linter
  </summary>

how to run tests:
```
rspec
```

how to run linter check:
```
rubocop
```

*obs: After running tests/rspec,
SimpleCov will generate a folder 'coverage' with a coverage report(open inside your browser)
```
coverage/index.html
```

</details>

<details>
  <summary>
     Board(development/trello)
  </summary>

https://trello.com/b/Fw1PPZAB/gitprofile

</details>

<details>
  <summary>
     Pending/future Improvements
  </summary>

 - Add url shortner
 - Add more unit tests
 - Enable multi repos for members(ex: gitlab etc)
 - Set on demand reload git profile infos
</details>