# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version -'rvm install 2.7.1' 

* 'bundle install'

* added 'serchkick' gem for searching -
  dependencies: need to install 'elastic_search'

* rake db:create && rake db:migrate && rake db:seed

* 'rails s'

 After this you will be ready to test API's.

 API endpoints - 
1. User Index -
    get '/users'

2. User show -
    get '/users/:id'

3. User update
    patch '/users/:id'

4. User create
    post '/users'

5. User destroy -
    delete '/users/:id'

6. User typeahead -
    get '/users/typeahead/:search'

API postman collection - 
  https://www.getpostman.com/collections/087ab6a08b1664b66cad