## Student Tracker 2.0


* Create a file called `.env` in the root of your project that contains the following:

```
GITHUB_CLIENT_ID=<ID>
GITHUB_SECRET=<SECRET>
WUFOO_TOKEN=<TOKEN>
WUFOO_ACCOUNT=<ACCOUNT>
```

* Modify the `config/initializers/configuration.rb` file.

```rb
# Site User Admins
APP_CONF = {
  # Array of Github Usernames who are admins
  'admins' => ['twhitacre'],
  # The Github Organization You are using
  'org' => 'tiy-atl-js-sept-2015', 
  # The Repo in above organization used for assignments
  'repo' => 'Assignments'
}
```