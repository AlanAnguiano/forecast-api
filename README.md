# Test Online
In case you want to avoid the local installation, you can hit this URL either with Postman or go directly to the URL to test the API (expect delay due free tier)

example of use:
```
https://alananguiano-forecast-api.onrender.com/forecast?city=guadalajara
```

# Installing Locally

Also you can install the application to test locally

## Basic tech:

  * Ruby 3.2.2
  
  * Rails 7.1.2
## Run bundler
run bundle install to install all the necessary gems
```
bundle install
```

## Set database
you may be asked to create a database to run the app locally, even if it's not necessary
simply run
```
rails db:setup
```

### And that's it
now you can visit (in theory) your localhost and be able to perform calls to the api following the example
at the beggining of this readme, just change the url
```
http://localhost:3000/forecast?city=guadalajara
```

