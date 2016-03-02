## WOM

WOM is an open source social networking platform written in Ruby on Rails.

### What it uses?

* [Ruby on Rails 4.1.6](https://github.com/rails/rails)
* [Bootstrap](https://github.com/twbs/bootstrap-sass)
* [Devise](https://github.com/plataformatec/devise)
* [Public Activity](https://github.com/chaps-io/public_activity)


### How do I get set up?

To set it up on your local machine here is what you need to do. Install Ruby & Rails. Clone this repo using the following command:

```
git clone https://github.com/nickejanssen/WOM
cd WOM
```
Then resolve dependencies using bundler:

```
bundle install
```

Run Migrations:

```
rake db:migrate
```

Run rails using

```
rails server
```

### Populate Mock data
To test the app with mock data by running the following rake task:

```
rake fill:data
```

This will create records with values from faker & populator gems. Also here are the test user credentials:

* email: test@WOM.com
* password: password


### Pull Requests

* Fork this repo
* Make changes to code
* Send Pull Request

### Issues
If you find any issue with the app please do raise an issue here https://github.com/nickejanssen/WOM/issues

### License
This project is Licensed under the [GNU GPL V2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html). See  [LICENSE](https://github.com/sudharti/WOM/blob/master/LICENSE) for more info.
